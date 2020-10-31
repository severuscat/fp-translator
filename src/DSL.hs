{-# LANGUAGE TypeFamilies #-}

module DSL where

data MyValue = MInt Int | MBool Bool | MFloat Float | MString String | None

instance Show MyValue where
    show (MInt a) = show a
    show (MFloat a) = show a
    show (MString a) = show $ init $ tail a
    show (MBool a) = show a
    show None = "none"

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
  -- statement
  ifSt :: expr MyValue -> expr () -> expr ()
  while :: expr MyValue -> expr () -> expr ()
  pass :: expr ()
  mprint :: expr MyValue -> expr ()
  func0 :: (expr Name -> expr ()) -> expr MyValue
  func1 :: (expr Name -> expr Name -> expr ()) -> expr MyValue -> expr MyValue
  func2 :: (expr Name -> expr Name -> expr Name -> expr ()) -> expr MyValue -> expr MyValue -> expr MyValue
  getVar :: expr String -> expr MyValue

  --Expression
  fCall :: expr MyValue -> expr ()
  myTrue :: expr MyValue
  myFalse :: expr MyValue
  not :: expr MyValue -> expr MyValue
  add :: expr MyValue -> expr MyValue -> expr MyValue
  sub :: expr MyValue -> expr MyValue -> expr MyValue
  mul :: expr MyValue -> expr MyValue -> expr MyValue
  div :: expr MyValue -> expr MyValue -> expr MyValue
  and :: expr MyValue -> expr MyValue -> expr MyValue
  or :: expr MyValue -> expr MyValue -> expr MyValue
  eq :: expr MyValue -> expr MyValue -> expr MyValue
  lessThan :: expr MyValue -> expr MyValue -> expr MyValue
  lessThanEq :: expr MyValue -> expr MyValue -> expr MyValue
  greaterThan :: expr MyValue -> expr MyValue -> expr MyValue
  greaterThanEq :: expr MyValue -> expr MyValue -> expr MyValue
  returnSt :: expr MyValue -> expr MyValue

  myBool :: Bool -> expr MyValue
  myInt :: Int -> expr MyValue
  myStr :: String -> expr MyValue
  myFloat :: Float -> expr MyValue
  myNone :: expr MyValue

  next :: expr () -> expr () -> expr ()
  end :: expr ()
  forInitVar :: Name -> expr MyValue -> (expr String -> expr ()) -> expr ()
  readInt :: expr MyValue