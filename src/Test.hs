module Test where

import Control.Monad.Trans.State.Strict (evalStateT, runStateT, execStateT)
import DSL
import Data.IntMap.Internal (fromList)
import Grammar as G
import Interpreter
import GrammarToDSL

test :: Interpretor IO () -> IO ()
test prog = evalStateT (interpret prog) initContext

tprog1 :: Interpretor IO ()
tprog1 = ifSt (gToDSLExpr (GreaterThan (G.MyInt 3) (G.MyInt 10)) GrammarToDSL.initContextLib) (mprint $ myStr "then branch")
