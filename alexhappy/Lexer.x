{
module Lexer where
}

$word = [A-Za-z_]
$digit = 0-9

tokens :-
    "def"           {}
    ":"             {}
    "return"        {}
    "while"         {}
    "if"            {}
    "else"          {}
    "True"          {}
    "False"         {}
    "\"[^\"]\""     {}
    "\+"            {}
    "\-"            {}
    "\/"            {}
    "\*"            {}

    "=="            {}

    ">"             {}
    "<"             {}
    ">="            {}
    "<="            {}
    "and"           {}
    "or"            {}
    "not"           {}
    "="             {}
    "("             {}
    ")"             {}
    ","             {}


{
data Token = DefFunc
  | ReturnStm
  | Dots
  | While
  | If
  | Else
  | Str
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
}
