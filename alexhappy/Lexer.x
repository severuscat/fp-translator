{
module Lexer where
}

$alpha = [a-zA-Z]
$digit = 0-9

tokens :-
    "def"                   {\s -> Token DefFunc}
    ":"                     {\s -> Token Colon}
    "return"                {\s -> Token ReturnStm}
    "while"                 {\s -> Token While}
    "if"                    {\s -> Token If}
    "else"                  {\s -> Token Else}
    "True"                  {\s -> Token TTrue}
    "False"                 {\s -> Token TFalse}
    "\+"                    {\s -> Token Plus}
    "\-"                    {\s -> Token Minus}
    "\/"                    {\s -> Token Div}
    "\*"                    {\s -> Token Mul}
    "=="                    {\s -> Token Equality}
    "print"                 {\s -> Token Print}
    ">"                     {\s -> Token Greater}
    "<"                     {\s -> Token Less}
    ">="                    {\s -> Token GreaterEq}
    "<="                    {\s -> Token LessEq}
    "and"                   {\s -> Token And}
    "or"                    {\s -> Token Or}
    "not"                   {\s -> Token Not}
    "="                     {\s -> Token Assign}
    "("                     {\s -> Token OPar}
    ")"                     {\s -> Token CPar}
    ","                     {\s -> Token Comma}
    $alpha [$alpha $digit]* {\s -> Token Name s}
    $digit+                 {\s -> Token Int s}
    $digit+ "\." $digit+    {\s -> Token Float s}
    \"[^\"]\"               {\s -> Token Str s}
{
data Token = DefFunc
  | ReturnStm
  | Colon
  | While
  | If
  | Else
  | Str !String
  | Plus
  | Minus
  | Div
  | Mul
  | Equality
  | Greater
  | Less
  | GreaterEq
  | LessEq
  | Tab
  | Comma
  | TTrue
  | TFalse
  | And
  | Or
  | Not
  | Assign
  | OPar
  | CPar
  | Pass
  | Print
  | Name !String
  | Int !String
  | Float !String
  deriving (Show, Eq)
}
