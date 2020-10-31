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

type Context = Map String MyValue

newtype Interpretor m s = Interpretor {interpret :: StateT Context m s}

instance Monad (Interpretor IO) where
  (>>=) x func = Interpretor $ do
    x1 <- interpret x
    interpret $ func x1

instance MonadFail (Interpretor IO) where
  fail _ = error "trying to get MBool in logical operation, but failed. Ha-ha, loser!"

instance Functor (Interpretor IO) where
  fmap f = Interpretor . fmap f . interpret

instance Applicative (Interpretor IO) where
  pure = Interpretor . return
  liftA2 f x y = Interpretor $ do
    x1 <- interpret x
    y1 <- interpret y
    pure (f x1 y1)

--type Context = Map String MyValue
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

  mprint x = Interpretor $ do
    x1 <- interpret x
    lift $ print x1

  fCall a = Interpretor $ do
    _ <- interpret a
    return ()

  func0 fun = Interpretor $ do
    let newMapka = insert "#resvalue" None initContext
    lift $ execStateT (interpret $ fun $ return "#resvalue") newMapka >>= (\x -> return $ x ! "#resvalue")

  func1 fun arg = Interpretor $ do
    a <- interpret arg
    let newMapka = insert "#arg1" a $ insert "#resvalue" None initContext
    lift $ execStateT (interpret $ fun (return "#resvalue") (return "#arg1") ) newMapka >>= (\x -> return $ x ! "#resvalue")

  func2 fun arg1 arg2 = Interpretor $ do
    a1 <- interpret arg1
    a2 <- interpret arg2
    let newMapka = insert "#arg1" a1 $ insert "#arg2" a2 $ insert "#resvalue" None initContext
    lift $ execStateT (interpret $ fun  (return "#resvalue") (return "#arg1") (return "#arg2") ) newMapka >>= (\x -> return $ x ! "#resvalue")

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

  end = return ()
  readInt = Interpretor $ do
    lift $ MInt <$> (readLn :: IO Int)
  readFloat = Interpretor $ do
    lift $ MFloat <$> (readLn :: IO Float)
  readStr = Interpretor $ do
    lift $ MString <$> (readLn :: IO String)