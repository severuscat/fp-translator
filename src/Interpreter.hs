{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}

module Interpreter where

import Control.Applicative (liftA2)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.State.Lazy
import DSL
import Data.Map
import GHC.IORef (IORef, newIORef, readIORef, writeIORef)
import Data.Kind (Type)
import GHC.Base (IO)

--test :: PyDsl expr => expr MyValue
--test = f0CallE "main" (\r -> assignment r (wrapMyValue (MInt 220)))

type Context = Map String MyValue

newtype Interpretor m s = Interpretor { interpret :: StateT Context m s }

instance Monad (Interpretor IO) where
  (>>=) x func = Interpretor $ do
    x1 <- interpret x
    interpret $ func x1

instance MonadFail (Interpretor IO) where
  fail _ = error "trying to get MBool in logical operation, but failed. Ha-ha, loser!"

instance Functor (Interpretor IO) where
  fmap f = Interpretor .fmap f. interpret

instance Applicative (Interpretor IO) where
  pure = Interpretor . return
  liftA2 f x y = Interpretor $ do
    x1 <- interpret x
    y1 <- interpret y
    pure (f x1 y1)

initContext :: Context
initContext = empty

instance PyDsl (Interpretor IO) where
  greaterThan a b = do
    a1 <- a
    b1 <- b
    Interpretor . return $ MBool (a1 > b1)
  greaterThanEq a b = do
    a1 <- a
    b1 <- b
    Interpretor . return $ MBool (a1 >= b1)
  lessThan a b = do
    a1 <- a
    b1 <- b
    Interpretor . return $ MBool (a1 < b1)
  lessThanEq a b = do
    a1 <- a
    b1 <- b
    Interpretor . return $ MBool (a1 <= b1)
  eq a b = do
    a1 <- a
    b1 <- b
    Interpretor . return $ MBool (a1 == b1)
  add = liftA2 (+)
  sub = liftA2 (-)
  mul = liftA2 (*)
  div = liftA2 (/)
  and a b = do
    MBool a1 <- a
    MBool b1 <- b
    Interpretor . return $ MBool (a1 && b1)
  or a b = do
    MBool a1 <- a
    MBool b1 <- b
    Interpretor . return $ MBool (a1 || b1)
  not a = do
    MBool a1 <- a
    Interpretor . return $ MBool (Prelude.not a1)
  myFalse = Interpretor . return $ MBool False
  myTrue = Interpretor . return $ MBool True
  
--  type Context = Map String MyValue
--  newtype Interpretor m s = Interpretor {interpret :: StateT Context m s}

--  type MyValueWrap (Interpretor IO) = IO
--  wrapMyValue = Interpretor . return

  mprint x = Interpretor $ do
    x1 <- interpret x
    lift $ print x1
    
  fCall a = Interpretor $ do interpret a
    
  assignment name val = Interpretor $ do
    n <- interpret name
    v <- interpret val
    modify $ helper n v
      where
        helper :: Name -> MyValue -> Context -> Context
        helper n v context = insertWith const n v context
  