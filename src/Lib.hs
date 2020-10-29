module Lib where

import Data.Text (Text)
import Data.List.Split (splitOn)
import Lexer
import DSL
import Grammar as G
import Data.Map (Map, (!))

data Context expr = Context
  { varsMap  :: Map String (expr MyValue)
  , func0Map :: Map String (expr MyValue)
  , func1Map :: Map String (expr MyValue -> expr MyValue)
  , func2Map :: Map String (expr MyValue -> expr MyValue -> expr MyValue)
  }

convertTokens :: [Token] -> [Token]
convertTokens lst = convertTokens2 $ markIndent 0 $ convertTokenSplitted (splitOn [Newline] lst)
  where
    markIndent :: Int -> [[Token]] -> [Token]
    markIndent level ((Tab newLvl:xss):xs) = let dif = newLvl - level in
                                              case dif of
                                                0 -> xss            ++ [Newline] ++ markIndent newLvl xs
                                                1 -> (Indent:xss)   ++ [Newline] ++ markIndent newLvl xs
                                                _ -> if dif < 0
                                                       then (replicate (- dif) Dedent ++ [Newline] ++ xss) ++ [Newline] ++ markIndent newLvl xs
                                                       else error "incorrect number of spaces in the beginning of this line"
    markIndent _ _ = []

    convertTokenSplitted :: [[Token]] -> [[Token]]
    convertTokenSplitted (x:xs) = replaceWithNTabs 0 x : convertTokenSplitted xs
    convertTokenSplitted [] = []
    
    replaceWithNTabs :: Int -> [Token] -> [Token]
    replaceWithNTabs n (Space:xs) = replaceWithNTabs (n+1) xs
    replaceWithNTabs n rest = case mod n 4 of
                                0 -> Tab (n `Prelude.div` 4):filter (\x -> x /= Space && x /= TEmpty) rest
                                _ -> error "incorrect number of spaces in the beginning of this line"    
                                
convertTokens2 :: [Token] -> [Token]
convertTokens2 [] = []
convertTokens2 [x] = [x]
convertTokens2 tokens = helper (head tokens) (tokens !! 1) [] (tail $ tail tokens)
  where
    helper :: Token -> Token -> [Token] -> [Token] -> [Token]
    helper Newline Dedent acc [] = acc ++ [Dedent]
    helper Newline Dedent acc as = helper Dedent (head as) acc $ tail as
    helper x Newline acc [] = acc++[x]
    helper Newline Newline acc as = helper Newline (head as) acc $ tail as
    helper x y acc [] = acc ++ [x, y]
    helper x y acc as = helper y (head as) (acc ++ [x]) $ tail as

--gToDSLfun0 ::
--gToDSLfun1 ::
--gToDSLfun2 ::
--gToDSLBlock ::
gToDSLExpr :: PyDsl expr => Expression -> Context expr -> expr MyValue
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
gToDSLExpr (G.Str str) _ = myStr str
gToDSLExpr G.MyTrue _ = myBool True
gToDSLExpr G.MyFalse _ = myBool False
gToDSLExpr (G.Var name) context =  varsMap context ! name
gToDSLExpr (G.ReadInt) context = undefined
gToDSLExpr (G.ReadStr) context = undefined
gToDSLExpr (G.ReadFloat) context = undefined
gToDSLExpr (G.F0CallE name) context = undefined
gToDSLExpr (G.F1CallE name arg1) context = undefined
gToDSLExpr (G.F2CallE name arg1 arg2) context = undefined
