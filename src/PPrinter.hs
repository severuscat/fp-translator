module PPrinter where

import Control.Applicative (liftA2)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.State.Strict
import DSL
import Data.Map
import Debug.Trace
import GHC.Base (when)

--import X.

type Context = Map String MyValue

newtype Printer a = Printer {toString :: Int -> String}

indent :: Int -> String
indent 0 = ""
indent x = " " ++ indent (x - 1)

instance PyDsl Printer where
  greaterThan a b = Printer $ \tabs -> toString a tabs ++ " > " ++ toString b tabs
  greaterThanEq a b = Printer $ \tabs -> toString a tabs ++ " >= " ++ toString b tabs
  lessThan a b = Printer $ \tabs -> toString a tabs ++ " < " ++ toString b tabs
  lessThanEq a b = Printer $ \tabs -> toString a tabs ++ " <= " ++ toString b tabs
  eq a b = Printer $ \tabs -> toString a tabs ++ " == " ++ toString b tabs
  add a b = Printer $ \tabs -> toString a tabs ++ " + " ++ toString b tabs
  sub a b = Printer $ \tabs -> toString a tabs ++ " - " ++ toString b tabs
  mul a b = Printer $ \tabs -> toString a tabs ++ " * " ++ toString b tabs
  div a b = Printer $ \tabs -> toString a tabs ++ " / " ++ toString b tabs
  and a b = Printer $ \tabs -> toString a tabs ++ " and " ++ toString b tabs
  or a b = Printer $ \tabs -> toString a tabs ++ " or " ++ toString b tabs
  not a = Printer $ \tabs -> "not " ++ toString a tabs

  myFalse = Printer $ const "False"
  myTrue = Printer $ const "True"

  mprint x = Printer $ \tabs -> indent tabs ++ "print " ++ toString x tabs

  fCall a = Printer $ \tabs -> indent tabs ++ toString a tabs

  pass = Printer $ \tabs -> indent tabs ++ "pass"

  while predicate stms = Printer $ \tabs ->
    indent tabs ++ "while " ++ toString predicate tabs ++ ":\n" ++ toString stms (tabs + 1)

  ifSt predicate stms = Printer $ \tabs ->
    indent tabs ++ "if " ++ toString predicate tabs ++ ":\n" ++ toString stms (tabs + 1)

  myBool b = Printer $ \_ -> show b
  myFloat f = Printer $ \_ -> show f
  myInt i = Printer $ \_ -> show i
  myStr s = Printer $ const s
  myNone = Printer $ const "none"

  getVar valName = Printer $ \tabs -> toString valName tabs

  forInitVar name val _ = Printer $ \tabs -> show name ++ " = " ++ toString val tabs ++ toString val tabs

  returnSt e = Printer $ \tabs -> indent tabs ++ toString e tabs
  end = Printer $ const ""
  next a b = Printer $ \tabs -> indent tabs ++ toString a tabs ++ "\n" ++ toString b tabs
  readInt = Printer $ const "int(input())"
  readFloat = Printer $ const "float(input())"
  readStr = Printer $ const "input()"
