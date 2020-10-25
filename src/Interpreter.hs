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
  --  add :: Interpretor MyType -> Interpretor MyType -> Interpretor MyType
  add a b = Interpretor $ interpret a + interpret b
  sub a b = Interpretor $ interpret a - interpret b
  wrapMyValue = Interpretor
