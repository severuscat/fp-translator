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
  = F0CallE Name  --int | str | float | none
  | F1CallE Name Name  --int | str | float | none
  | F2CallE Name Name Name --int | str | float | none
  | MyTrue  --bool
  | MyFalse  --bool
  | Not Expression  --bool
  | Add Expression Expression   --int | str | floaf
  | Sub Expression Expression  --int | floaf
  | Mul Expression Expression  --int | floaf
  | Div Expression Expression  --int | floaf
  | And Expression Expression  --bool
  | Or Expression Expression  --bool
  | Eq Expression Expression --bool
  | LessThan Expression Expression --bool
  | LessThanEq Expression Expression --bool
  | GreaterThan Expression Expression --bool
  | GreaterThanEq Expression Expression --bool
  | MyFloat Float --float
  | MyInt Int --int
  | Str String --str
  | Var Name --int | str | float | notExist
  | ReadInt
  | ReadFloat
  | ReadStr
  deriving (Eq, Show)
