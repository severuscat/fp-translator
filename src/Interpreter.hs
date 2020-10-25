module Interpreter where

import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.State.Lazy
import DSL
import Data.Map

--type Context = {
--  functions :: Map String [Statement]
--  variables :: Map String
--  }
newtype Interpretor a = Interpretor {interpret :: a}

instance PyDsl Interpretor where
  add a b = Interpretor $ interpret a + interpret b
  sub a b = Interpretor $ interpret a - interpret b
  myTrue = Interpretor $ MBool True
  myFalse = Interpretor $ MBool False
  not a = Interpretor $ Prelude.not (interpret a)
  mul a b = Interpretor $ interpret a * interpret b
  div a b = Interpretor $ interpret a / interpret b
  and a b = Interpretor $ interpret a && interpret b
  or a b = Interpretor $ interpret a || interpret b
  eq a b = Interpretor $ interpret a == interpret b
  lessThan a b = Interpretor $ interpret a < interpret b
  lessThanEq a b = Interpretor $ interpret a <= interpret b
  greaterThan a b = Interpretor $ interpret a > interpret b
  greaterThanEq a b = Interpretor $ interpret a >= interpret b
  wrapMyValue = Interpretor
