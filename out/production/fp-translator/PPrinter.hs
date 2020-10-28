module PPrinter
  ( Printer (..),
  )
where

import DSL
import Data.STRef.Lazy (STRef)
import Data.Typeable

data Printer a = Printer {toString :: STRef Int -> String -> ST String}

instance PyDsl Printer where
--  type (Var Printer) = String
--  assignment :: expr Name -> expr MyType -> expr ()
--  ifSt :: expr Bool -> expr () -> expr ()
--  ifElseSt :: expr Bool -> expr () -> expr () -> expr ()
--  func0Def :: expr Name -> expr () -> expr ()
--  func1Def :: expr Name -> expr Name -> expr () -> expr ()
--  func2Def :: expr Name -> expr Name -> expr Name -> expr () -> expr ()
--  while :: expr Bool -> expr () -> expr ()
--  return :: expr MyType -> expr ()
--  expression :: expr MyType -> expr ()
--  pass :: expr ()
--  print :: expr MyType -> expr ()
--  f0CallS :: expr Name -> expr ()
--  f1CallS :: expr Name -> expr Name -> expr ()
--  f2CallS :: expr Name -> expr Name -> expr Name -> expr ()