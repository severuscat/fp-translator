module GrammarToDSL where

import Prelude hiding (lookup)

import Grammar as G
import DSL
import Data.Map ((!), Map, empty, fromList, insert, lookup)
import Data.Maybe (fromMaybe)
import Control.Exception.Base (throw)


data Context expr = Context
  { varsMap :: Map String (expr String),
    func0Map :: Map String (expr MyValue),
    func1Map :: Map String (expr MyValue -> expr MyValue),
    func2Map :: Map String (expr MyValue -> expr MyValue -> expr MyValue)
  }

initContextLib :: Context expr
initContextLib =
  Context
    { varsMap = empty,
      func0Map = empty,
      func1Map = empty,
      func2Map = empty
    }

gToDSLBlock :: PyDsl expr => [Statement] -> GrammarToDSL.Context expr -> expr ()
gToDSLBlock ((G.Assignment name e) : stms) context =
  forInitVar
    name
    (gToDSLExpr e context)
    (\v -> gToDSLBlock stms (context {varsMap = insert name v (varsMap context)}))
gToDSLBlock ((G.If p thenst) : stms) context =
  ifSt (gToDSLExpr p context) (gToDSLBlock thenst context)
    `next` gToDSLBlock stms context
gToDSLBlock ((G.While p thenst) : stms) context =
  while (gToDSLExpr p context) (gToDSLBlock thenst context)
    `next` gToDSLBlock stms context
gToDSLBlock ((G.Print e) : stms) context =
  mprint (gToDSLExpr e context)
    `next` gToDSLBlock stms context
gToDSLBlock ((G.Func0Def name block) : stms) context =
  let fun resvalue = gToDSLBlock block ( context { varsMap = insert "#resvalue" resvalue empty } )
    in defFunc0 name fun `next`
      gToDSLBlock stms context { func0Map = insert name ( func0 name fun ) (func0Map context) }
gToDSLBlock ((G.Return e) : stms) context = gToDSLBlock (G.Assignment "#resvalue" e : stms) context
gToDSLBlock ((G.Func1Def name a1 block):stms) context =
  let fun resvalue arg1 = gToDSLBlock block (context {varsMap = fromList [("#resvalue", resvalue), (a1, arg1)]})
   in defFunc1 name a1 fun `next`
      gToDSLBlock stms context {func1Map = insert name (func1 name a1 fun) (func1Map context)}
gToDSLBlock ((G.Func2Def name a1 a2 block) : stms) context =
  let fun resvalue arg1 arg2 = gToDSLBlock block ( context { varsMap = fromList [("#resvalue", resvalue), (a1, arg1), (a2, arg2)] })
   in defFunc2 name a1 a2 fun `next`
      gToDSLBlock stms
        context { func2Map = insert name (func2 name a1 a2 fun) (func2Map context) }
gToDSLBlock ((G.F0CallS name) : stms) context =
  fCall (func0Map context ! name)
    `next` gToDSLBlock stms context
gToDSLBlock ((G.F1CallS name arg1) : stms) context =
  fCall ((func1Map context ! name) (gToDSLExpr arg1 context))
    `next` gToDSLBlock stms context
gToDSLBlock ((G.F2CallS name arg1 arg2) : stms) context =
  fCall ((func2Map context ! name) (gToDSLExpr arg1 context) (gToDSLExpr arg2 context))
    `next` gToDSLBlock stms context
gToDSLBlock (G.Pass : stms) context = gToDSLBlock stms context
gToDSLBlock ((G.Expression _) : stms) context = gToDSLBlock stms context
gToDSLBlock [] _ = end

gToDSLExpr :: PyDsl expr => Expression -> GrammarToDSL.Context expr -> expr MyValue
gToDSLExpr (Add a b) context = gToDSLExpr a context `DSL.add` gToDSLExpr b context
gToDSLExpr (Sub a b) context = gToDSLExpr a context `DSL.sub` gToDSLExpr b context
gToDSLExpr (G.Mul a b) context = gToDSLExpr a context `DSL.mul` gToDSLExpr b context
gToDSLExpr (G.Div a b) context = gToDSLExpr a context `DSL.div` gToDSLExpr b context
gToDSLExpr (G.And a b) context = gToDSLExpr a context `DSL.and` gToDSLExpr b context
gToDSLExpr (G.Or a b) context = gToDSLExpr a context `DSL.or` gToDSLExpr b context
gToDSLExpr (G.Not a) context = DSL.not $ gToDSLExpr a context
gToDSLExpr (Eq a b) context = gToDSLExpr a context `DSL.eq` gToDSLExpr b context
gToDSLExpr (G.LessThan a b) context = gToDSLExpr a context `DSL.lessThan` gToDSLExpr b context
gToDSLExpr (G.LessThanEq a b) context = gToDSLExpr a context `DSL.lessThanEq` gToDSLExpr b context
gToDSLExpr (G.GreaterThan a b) context = gToDSLExpr a context `DSL.greaterThan` gToDSLExpr b context
gToDSLExpr (G.GreaterThanEq a b) context = gToDSLExpr a context `DSL.greaterThanEq` gToDSLExpr b context
gToDSLExpr (G.MyInt inum) _ = myInt inum
gToDSLExpr (G.MyFloat fnum) _ = myFloat fnum
gToDSLExpr (G.MyStr str) _ = myStr (init $ tail str)
gToDSLExpr G.MyTrue _ = myBool True
gToDSLExpr G.MyFalse _ = myBool False
gToDSLExpr (G.Var name) context = getVar (extractVar name (varsMap context))
gToDSLExpr (G.F0CallE name) context = func0Map context ! name
gToDSLExpr (G.F1CallE name arg1) context = (func1Map context ! name) $ gToDSLExpr arg1 context
gToDSLExpr (G.F2CallE name arg1 arg2) context = (func2Map context ! name) (gToDSLExpr arg1 context) (gToDSLExpr arg2 context)
gToDSLExpr G.ReadInt _ = readInt
gToDSLExpr G.ReadStr _ = readStr
gToDSLExpr G.ReadFloat _ = readFloat

extractVar name context = fromMaybe (throw NoValue) (lookup name context)