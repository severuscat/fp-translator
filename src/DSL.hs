{-# LANGUAGE FlexibleInstances #-}

module DSL where

data MyValue a = MInt Int | MBool Bool | MFloat Float | MString String | None deriving (Show)

instance Eq (MyValue a) where
  (==) (MString a) (MString b) = a == b
  (==) (MInt a) (MInt b) = a == b
  (==) (MInt a) (MFloat b) = fromIntegral a == b
  (==) (MFloat a) (MInt b) = a == fromIntegral b
  (==) (MFloat a) (MFloat b) = a == b
  (==) _ _ = error "You can't compare values of this type"

instance Ord (MyValue a) where
  (<=) (MInt a) (MInt b) = a <= b
  (<=) (MInt a) (MFloat b) = fromIntegral a <= b
  (<=) (MFloat a) (MInt b) = a <= fromIntegral b
  (<=) (MFloat a) (MFloat b) = a <= b
  (<=) _ _ = error "You can't compare values of this type"

instance Num (MyValue a) where
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

--instance Fractional MyValue

type Name = String

--class (Show t) => MyType t where
--  extractValue :: t -> MyValue
--
--instance MyType Float where
--  extractValue x = MFloat x
--
--instance MyType Int where
--  extractValue x = MInt x
--
--type Declarations expr c = [expr (KtFunData c)]
--instance MyType String where
--  extractValue x = MString x
--
--instance MyType Bool where
--  extractValue x = MBool x

class PyDsl expr where
  -- root
  --  pyFile ::
  -- statement
  --  assignment :: expr Name -> expr MyValue -> expr ()
  --  ifSt :: expr Bool -> expr () -> expr ()
  --  ifElseSt :: expr Bool -> expr () -> expr () -> expr ()
  --  func0Def :: expr Name -> expr () -> expr ()
  --  func1Def :: expr Name -> expr Name -> expr () -> expr ()
  --  func2Def :: expr Name -> expr Name -> expr Name -> expr () -> expr ()
  --  while :: expr Bool -> expr () -> expr ()
  --  return :: expr MyValue -> expr ()
  --  expression :: expr MyValue -> expr ()
  --  pass :: expr ()
  --  mprint :: expr MyValue -> expr ()
  --  f0CallS :: expr Name -> expr ()
  --  f1CallS :: expr Name -> expr Name -> expr ()
  --  f2CallS :: expr Name -> expr Name -> expr Name -> expr ()

  --Expression
  --  f0CallE :: expr Name -> expr MyValue --int | str | float | none
  --  f1CallE :: expr Name -> expr Name -> expr MyValue --int | str | float | none
  --  f2CallE :: expr Name -> expr Name -> expr Name -> expr MyValue --int | str | float | none
  --  myTrue :: expr Bool --bool
  --  myFalse :: expr Bool --boolMyValue
  --  not :: expr Bool -> expr Bool --bool
  wrapMyValue :: MyValue a -> expr (MyValue a)
  add :: expr (MyValue a) -> expr (MyValue a) -> expr (MyValue a)
  sub :: expr (MyValue a) -> expr (MyValue a) -> expr (MyValue a)

--  mul :: expr MyValue -> expr MyValue -> expr MyValue --int | floaf
--  div :: expr MyValue -> expr MyValue -> expr MyValue --int | floaf
--  and :: expr Bool -> expr Bool -> expr Bool --bool
--  or :: expr Bool -> expr Bool -> expr Bool --bool
--  eq :: expr MyValue -> expr MyValue -> expr Bool --bool
--  lessThan :: expr MyValue -> expr MyValue -> expr Bool --bool
--  lessThanEq :: expr MyValue -> expr MyValue -> expr Bool --bool
--  greaterThan :: expr MyValue -> expr MyValue -> expr Bool --bool
--  greaterThanEq :: expr MyValue -> expr MyValue -> expr Bool --bool
--  myFloat :: expr Float -> expr Float --float
--  myInt :: expr Int --int
--  str :: expr String --str
--  var :: expr Name -> expr MyValue --int | str | float | notExist
