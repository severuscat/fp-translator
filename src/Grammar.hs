module Grammar
  ( Statement (..),
    Expression (..),
    Name,
  )
where

data Statement
  = Assignment Name Expression
  | If Expression [Statement]
  | IfElse Expression [Statement] [Statement]
  | Func0Def Name [Statement]
  | Func1Def Name Name [Statement]
  | Func2Def Name Name Name [Statement]
  | While Expression [Statement]
  | Return Expression
  | Expression Expression
  | Pass
  | Print Expression
  | F0CallS Name
  | F1CallS Name Name
  | F2CallS Name Name Name
  deriving (Eq, Show)

type Name = String

data Expression
  = F0CallE Name
  | F1CallE Name Name
  | F2CallE Name Name Name
  | MyTrue
  | MyFalse
  | Not Expression
  | Add Expression Expression
  | Sub Expression Expression
  | Mul Expression Expression
  | Div Expression Expression
  | And Expression Expression
  | Or Expression Expression
  | Eq Expression Expression
  | LessThan Expression Expression
  | LessThanEq Expression Expression
  | GreaterThan Expression Expression
  | GreaterThanEq Expression Expression
  | MyFloat Float
  | MyInt Int
  | Str String
  | Var Name
  deriving (Eq, Show)
