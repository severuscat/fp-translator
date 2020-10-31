{
module Lexer
( Token(..)
, alexScanTokens
) where
}
%wrapper "basic"
$alpha = [a-zA-Z]
$digit = 0-9

tokens :-
    $white                  {\s -> tokenWhite s}
    "int(input())"          {\s -> ReadInt}
    "float(input())"        {\s -> ReadFloat}
    "input()"               {\s -> ReadStr}
    "def"                   {\s -> Def}
    ":"                     {\s -> Colon}
    "return"                {\s -> ReturnStm}
    "while"                 {\s -> While}
    "if"                    {\s -> If}
    "True"                  {\s -> TTrue}
    "False"                 {\s -> TFalse}
    "+"                     {\s -> Plus}
    "-"                     {\s -> Minus}
    "/"                     {\s -> Div}
    "*"                     {\s -> Mul}
    "=="                    {\s -> Equality}
    "print"                 {\s -> Print}
    ">"                     {\s -> Greater}
    "<"                     {\s -> Less}
    ">="                    {\s -> GreaterEq}
    "<="                    {\s -> LessEq}
    "and"                   {\s -> And}
    "or"                    {\s -> Or}
    "not"                   {\s -> Not}
    "="                     {\s -> Assign}
    "("                     {\s -> OPar}
    ")"                     {\s -> CPar}
    ","                     {\s -> Comma}
    "pass"                  {\s -> Pass}
    $alpha [$alpha $digit]* {\s -> Name s}
    $digit+                 {\s -> MyInt (read s :: Int)}
    $digit+ "\." $digit+    {\s -> MyFloat (read s :: Float)}
    \"[^\"]*\"               {\s -> Str s}
{
data Token =
  And
  | Def
  | Dedent --make it later
  | Assign
  | Colon
  | Comma
  | CPar
  | Div
  | Dots
  | Else
  | Equality
  | Greater
  | GreaterEq
  | If
  | Indent --make it later
  | Or
  | OPar
  | Less
  | LessEq
  | Minus
  | Mul
  | Not
  | Newline
  | Pass
  | Plus
  | Print
  | ReturnStm
  | TEmpty
  | TFalse
  | TTrue
  | While
  | Space
  | Name String
  | Str String
  | ReadInt
  | ReadFloat
  | ReadStr
  | MyInt Int
  | MyFloat Float
  | Tab Int
  deriving (Show, Eq)

tokenWhite :: String -> Token
tokenWhite "\n" = Newline
tokenWhite " " = Space
tokenWhite _ = TEmpty
}