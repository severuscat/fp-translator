{-# LANGUAGE TypeFamilies #-}

module DSL where

import Data.Kind (Type)

data MyValue = MInt Int | MBool Bool | MFloat Float | MString String deriving (Show)

instance Eq MyValue where
  (==) (MString a) (MString b) = a == b
  (==) (MInt a) (MInt b) = a == b
  (==) (MInt a) (MFloat b) = fromIntegral a == b
  (==) (MFloat a) (MInt b) = a == fromIntegral b
  (==) (MFloat a) (MFloat b) = a == b
  (==) _ _ = error "You can't compare values of this type"

instance Ord MyValue where
  (<=) (MInt a) (MInt b) = a <= b
  (<=) (MInt a) (MFloat b) = fromIntegral a <= b
  (<=) (MFloat a) (MInt b) = a <= fromIntegral b
  (<=) (MFloat a) (MFloat b) = a <= b
  (<=) _ _ = error "You can't compare values of this type"

instance Num MyValue where
  (+) (MInt x) (MInt y) = MInt $ x + y
  (+) (MInt x) (MFloat y) = MFloat $ fromIntegral x + y
  (+) (MFloat x) (MFloat y) = MFloat $ x + y
  (+) (MFloat x) (MInt y) = MFloat $ x + fromIntegral y
  (+) _ _ = error "You can't add values of this type"

  (*) (MInt x) (MInt y) = MInt $ x * y
  (*) (MInt x) (MFloat y) = MFloat $ fromIntegral x * y
  (*) (MFloat x) (MFloat y) = MFloat $ x * y
  (*) (MFloat x) (MInt y) = MFloat $ x * fromIntegral y
  (*) _ _ = error "You can't multiply values of this type"

  (-) (MInt x) (MInt y) = MInt $ x - y
  (-) (MInt x) (MFloat y) = MFloat $ fromIntegral x - y
  (-) (MFloat x) (MFloat y) = MFloat $ x - y
  (-) (MFloat x) (MInt y) = MFloat $ x - fromIntegral y
  (-) _ _ = error "You can't subtract values of this type"

  abs (MInt x) = MInt $ abs x
  abs (MFloat x) = MFloat $ abs x
  abs _ = error "no abs for this type defined"

  signum (MInt x) = MInt $ signum x
  signum (MFloat x) = MFloat $ signum x
  signum _ = error "no signum for this type defined"

  fromInteger x = MInt $ fromInteger x

instance Fractional MyValue where
  fromRational a = MFloat $ fromRational a

  (/) (MInt x) (MInt y) = MInt $ x `Prelude.div` y
  (/) (MInt x) (MFloat y) = MFloat $ fromIntegral x / y
  (/) (MFloat x) (MFloat y) = MFloat $ x / y
  (/) (MFloat x) (MInt y) = MFloat $ x / fromIntegral y
  (/) _ _ = error "you can NOT divide this"

type Name = String

class PyDsl expr where
  -- root
  --  pyFile ::
  -- statement
  assignment :: expr Name  -> expr MyValue -> expr ()
--  ifSt :: expr Bool -> expr () -> expr ()
--  ifElseSt :: expr Bool -> expr () -> expr () -> expr ()
--  func0Def :: expr Name -> expr () -> expr ()
--  func1Def :: expr Name -> expr Name -> expr () -> expr ()
--  func2Def :: expr Name -> expr Name -> expr Name -> expr () -> expr ()
--  while :: expr Bool -> expr () -> expr ()
--  return :: expr MyValue -> expr ()
--  expression :: expr MyValue -> expr ()
--  pass :: expr ()
  mprint :: expr MyValue -> expr ()
--  f0CallS :: expr Name -> expr ()
--  f1CallS :: expr Name -> expr Name -> expr ()
--  f2CallS :: expr Name -> expr Name -> expr Name -> expr ()

  --Expression
--  f0CallE :: Name -> (expr (MyValueWrap expr MyValue) -> expr ()) -> expr MyValue
--  f1CallE :: expr Name -> expr Name -> expr MyValue --int | str | float | none
--  f2CallE :: expr Name -> expr Name -> expr Name -> expr MyValue --int | str | float | none
  myTrue :: expr MyValue --bool
  myFalse :: expr MyValue --boolMyValue
  not :: expr MyValue -> expr MyValue  --bool
  add :: expr MyValue -> expr MyValue -> expr MyValue
  sub :: expr MyValue -> expr MyValue -> expr MyValue
  mul :: expr MyValue -> expr MyValue -> expr MyValue --int | floaf
  div :: expr MyValue -> expr MyValue -> expr MyValue --int | floaf
  and :: expr MyValue -> expr MyValue -> expr MyValue --bool
  or :: expr MyValue -> expr MyValue -> expr MyValue --bool
  eq :: expr MyValue -> expr MyValue -> expr MyValue
  lessThan :: expr MyValue -> expr MyValue -> expr MyValue
  lessThanEq :: expr MyValue -> expr MyValue -> expr MyValue
  greaterThan :: expr MyValue -> expr MyValue -> expr MyValue
  greaterThanEq :: expr MyValue -> expr MyValue -> expr MyValue
--  myFloat :: expr Float -> expr (MyValue Float)
--  myInt :: expr Int -> expr (MyValue Int)
--  str :: expr String -> expr (MyValue String)
  --var :: expr Name -> expr (MyValue a)
