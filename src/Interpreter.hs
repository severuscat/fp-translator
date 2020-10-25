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
  mul a b = Interpretor $ interpret a * interpret b
  div a b = Interpretor $ interpret a / interpret b

  myTrue = Interpretor $ MBool True
  myFalse = Interpretor $ MBool False

  not a = Interpretor $ not' (interpret a)
    where
      not' (MBool a') = MBool (Prelude.not a')
      not' _ = error ""
  and a b = Interpretor $ and' (interpret a) (interpret b)
    where
      and' (MBool a') (MBool b') = MBool (a' && b')
      and' _ _ = error ""
  or a b = Interpretor $ or' (interpret a) (interpret b)
    where
      or' (MBool a') (MBool b') = MBool (a' || b')
      or' _ _ = error ""
  
  eq a b = Interpretor $ MBool $ interpret a == interpret b
  lessThan a b = Interpretor $ MBool $ interpret a < interpret b
  lessThanEq a b = Interpretor $ MBool $interpret a <= interpret b
  greaterThan a b = Interpretor $ MBool $interpret a > interpret b
  greaterThanEq a b = Interpretor $ MBool $interpret a >= interpret b
  
  wrapMyValue = Interpretor
