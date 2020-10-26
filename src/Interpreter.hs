{-# LANGUAGE TypeFamilies #-}

module Interpreter where

import Control.Applicative (liftA2)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.State.Lazy
import DSL
import Data.Map
import GHC.IORef (IORef, newIORef, writeIORef, readIORef)

test :: PyDsl expr => expr (MyValue Int)
test = f0CallE "main" (\r -> assignment r (wrapMyValue (MInt 2)))

instance PyDsl IO where
  type MyValueWrap IO = IORef
  wrapMyValue = pure
  greaterThan a b = do
    a1 <- a
    b1 <- b
    wrapMyValue $ MBool (a1 > b1)
  greaterThanEq a b = do
    a1 <- a
    b1 <- b
    wrapMyValue $ MBool (a1 >= b1)
  lessThan a b = do
    a1 <- a
    b1 <- b
    wrapMyValue $ MBool (a1 < b1)
  lessThanEq a b = do
    a1 <- a
    b1 <- b
    wrapMyValue $ MBool (a1 <= b1)
  eq a b = do
    a1 <- a
    b1 <- b
    wrapMyValue $ MBool (a1 == b1)
  add = liftA2 (+)
  sub = liftA2 (-)
  mul = liftA2 (*)
  div = liftA2 (/)
  and a b = do
    MBool a1 <- a
    MBool b1 <- b
    wrapMyValue $ MBool (a1 && b1)
  or a b = do
    MBool a1 <- a
    MBool b1 <- b
    wrapMyValue $ MBool (a1 || b1)
  f0CallE _ func = do
    let res = newIORef None
    res' <- res
    _ <- func (pure res')
    readIORef res'
  assignment ref val = do
    v <- val
    r <- ref
    writeIORef r v

--newtype Interpretor a = Interpretor {interpret :: a}

--instance PyDsl Interpretor where
--  add a b = Interpretor $ interpret a + interpret b
--  sub a b = Interpretor $ interpret a - interpret b
--  mul a b = Interpretor $ interpret a * interpret b
--  div a b = Interpretor $ interpret a / interpret b
--
--  myTrue = Interpretor $ MBool True
--  myFalse = Interpretor $ MBool False
--
--  not a = Interpretor $ not' (interpret a)
--    where
--      not' (MBool a') = MBool (Prelude.not a')
--      not' _ = error ""
--  and a b = Interpretor $ and' (interpret a) (interpret b)
--    where
--      and' (MBool a') (MBool b') = MBool (a' && b')
--      and' _ _ = error ""
--  or a b = Interpretor $ or' (interpret a) (interpret b)
--    where
--      or' (MBool a') (MBool b') = MBool (a' || b')
--      or' _ _ = error ""
--
--  eq a b = Interpretor $ MBool $ interpret a == interpret b
--  lessThan a b = Interpretor $ MBool $ interpret a < interpret b
--  lessThanEq a b = Interpretor $ MBool $interpret a <= interpret b
--  greaterThan a b = Interpretor $ MBool $interpret a > interpret b
--  greaterThanEq a b = Interpretor $ MBool $interpret a >= interpret b
--
--  --  myFloat (Interpretor x) = Interpretor $ MFloat x
--  --  myInt (Interpretor x) = Interpretor $ MInt x
--  --  mystr (Interpretor x) = Interpretor $ MString x
--  wrapMyValue = Interpretor
