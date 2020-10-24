module DSL where

class Statement expr where
  assignment :: expr Name -> expr MyType -> expr ()
  ifSt :: expr Bool -> expr () -> expr ()
  ifElseSt :: expr Bool -> expr () -> expr () -> expr ()
  func0Def :: expr Name -> expr () -> expr ()
  func1Def :: expr Name -> expr Name -> expr () -> expr ()
  func2Def :: expr Name -> expr Name -> expr Name -> expr () -> expr ()
  while :: expr Bool -> expr () -> expr ()
  return :: expr MyType -> expr ()
  expression :: expr MyType -> expr ()
  pass :: expr ()
  print :: expr MyType -> expr ()
  f0CallS :: expr Name -> expr ()
  f1CallS :: expr Name -> expr Name -> expr ()
  f2CallS :: expr Name -> expr Name -> expr Name -> expr ()

type Name = String

data MyType = Int | Bool | String | Float | None

class Expression expr where
  f0CallE :: expr Name -> expr MyType --int | str | float | none
  f1CallE :: expr Name -> expr Name -> expr MyType --int | str | float | none
  f2CallE :: expr Name -> expr Name -> expr Name -> expr MyType --int | str | float | none
  myTrue :: expr Bool --bool
  myFalse :: expr Bool --bool
  not :: expr Bool -> expr Bool --bool
  add :: expr MyType -> expr MyType -> expr MyType --int | str | floaf
  sub :: expr MyType -> expr MyType -> expr MyType --int | floaf
  mul :: expr MyType -> expr MyType -> expr MyType --int | floaf
  div :: expr MyType -> expr MyType -> expr MyType --int | floaf
  and :: expr Bool -> expr Bool -> expr Bool --bool
  or :: expr Bool -> expr Bool -> expr Bool --bool
  eq :: expr MyType -> expr MyType -> expr Bool --bool
  lessThan :: expr MyType -> expr MyType -> expr Bool --bool
  lessThanEq :: expr MyType -> expr MyType -> expr Bool --bool
  greaterThan :: expr MyType -> expr MyType -> expr Bool --bool
  greaterThanEq :: expr MyType -> expr MyType -> expr Bool --bool
  myFloat :: expr Float -> expr Float --float
  myInt :: expr Int --int
  str :: expr String --str
  var :: expr Name -> expr MyType --int | str | float | notExist
