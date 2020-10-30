module Test where

import Control.Monad.Trans.State.Lazy (evalStateT)
import DSL
import Data.IntMap.Internal (fromList)
import Grammar as G
import Interpreter
import Lib

test :: Interpretor IO () -> IO ()
test prog = evalStateT (interpret prog) initContext

tprog1 :: Interpretor IO ()
tprog1 = ifElseSt (gToDSLExpr (GreaterThan (G.MyInt 3) (G.MyInt 10)) initContextLib) (mprint $ myStr "then branch") (mprint $ myStr "else branch")