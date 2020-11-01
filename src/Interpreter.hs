{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}

module Interpreter where

import Control.Applicative (liftA2)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.State.Strict
import DSL
import Data.Map
import GHC.Base (when)
import Data.Functor.Identity (Identity)

type Context = Map String MyValue

newtype Interpretor m s = Interpretor {interpret :: StateT Context m s}

class Monad m => WrapperTestIO m where
  out :: String -> m ()
  rint :: m Int
  rfloat :: m Float
  rstr :: m String

instance WrapperTestIO IO where
  out = putStrLn
  rint = readLn :: IO Int
  rfloat = readLn :: IO Float
  rstr = readLn :: IO String

instance WrapperTestIO Identity where
  out = \_ -> return () 
  rint = return 1
  rfloat = return 1.0
  rstr = return ""


instance WrapperTestIO m => Monad (Interpretor m) where
  (>>=) x func = Interpretor $ do
    x1 <- interpret x
    interpret $ func x1

instance WrapperTestIO m => MonadFail (Interpretor m) where
  fail _ = error "trying to get MBool in logical operation, but failed. Ha-ha, loser!"

instance WrapperTestIO m => Functor (Interpretor m) where
  fmap f = Interpretor . fmap f . interpret

instance WrapperTestIO m =>Applicative (Interpretor m) where
  pure = Interpretor . return
  liftA2 f x y = Interpretor $ do
    x1 <- interpret x
    y1 <- interpret y
    pure (f x1 y1)

--type Context = Map String MyValue
initContext :: Context
initContext = empty

instance WrapperTestIO m => PyDsl (Interpretor m) where
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

  mprint x = Interpretor $ do
    x1 <- interpret x
    lift $ out $ show x1

  fCall a = Interpretor $ do
    _ <- interpret a
    return ()

  func0 _ fun = Interpretor $ do
    let newMapka = insert "#resvalue" None initContext
    lift $ execStateT (interpret $ fun $ return "#resvalue") newMapka >>= (\x -> return $ x ! "#resvalue")

  func1 _ a1 fun arg = Interpretor $ do
    a <- interpret arg
    let newMapka = insert a1 a $ insert "#resvalue" None initContext
    lift $ execStateT (interpret $ fun (return "#resvalue") (return a1)) newMapka >>= (\x -> return $ x ! "#resvalue")

  func2 _ ar1 ar2 fun arg1 arg2 = Interpretor $ do
    a1 <- interpret arg1
    a2 <- interpret arg2
    let newMapka = insert ar1 a1 $ insert ar2 a2 $ insert "#resvalue" None initContext
    lift $ execStateT (interpret $ fun (return "#resvalue") (return ar1) (return ar2)) newMapka >>= (\x -> return $ x ! "#resvalue")

  pass = Interpretor $ return ()

  while predicate stms = Interpretor $ do
    p <- interpret predicate
    interpret (when (helper p) $ stms >> while predicate stms)
    where
      helper (MBool True) = True
      helper (MBool False) = False
      helper _ = error "trying to use not bool as a condition in while cycle. Sad news("

  ifSt predicate stms = Interpretor $ do
    p <- interpret predicate
    if helper p then interpret stms else interpret pass
    where
      helper (MBool True) = True
      helper (MBool False) = False
      helper _ = error "trying to use not bool as a condition in if statement. Sad news("

  myBool b = Interpretor $ return $ MBool b
  myFloat f = Interpretor $ return $ MFloat f
  myInt i = Interpretor $ return $ MInt i
  myStr s = Interpretor $ return $ MString s
  myNone = Interpretor $ return None

  getVar valName = Interpretor $ do
    st <- get
    v <- interpret valName
    return $ st ! v
  forInitVar name val func = Interpretor $ do
    st <- get
    v <- interpret val
    put $ insert name v st
    interpret $ func (Interpretor $ return name)
  returnSt = id
  next a b = do
    a
    b
  defFunc0 _ _ = return ()
  defFunc1 _ _ _ = return ()
  defFunc2 _ _ _ _ = return ()
  end = return ()
  readInt = Interpretor $ do
    lift $ MInt <$> rint
  readFloat = Interpretor $ do
    lift $ MFloat <$>rfloat
  readStr = Interpretor $ do
    lift $ MString <$> rstr
