{
{-# LANGUAGE DeriveAnyClass #- }
{-# LANGUAGE DeriveGeneric #- }
module Parser where
import GHC.Generics
import Lexer
import Control.DeepSeq
import Data.Char
}

%name parser Expr
%tokentype { Token }
%error { parseError }

%token
	"def"                   { DefFunc }
	":"                     { Colon }
	"return"                { ReturnStm }
	"while"                 { While }
	"if"                    { If }
	"else"                  { Else }
	"True"                  { TTrue }
	"False"                 { TFalse }
	"\+"                    { Plus }
	"\-"                    { Minus }
	"\/"                    { Div }
	"\*"                    { Mul }
	"=="                    { Equality }
	">"                     { Greater }
	"<"                     { Less }
	">="                    { GreaterEq }
	"<="                    { LessEq }
	"and"                   { And }
	"or"                    { Or }
	"not"                   { Not }
	"="                     { Assign }
	"("                     { OPar }
	")"                     { CPar }
	","                     { Comma }
	name 			{ Name $$ }
	int			{ Int $$ }
	float			{ Float $$ }
	str			{ Str $$ }
%%
Statements:
	Statement+
Statement:
	Function_def
	| If_stmt
	| While_stmt
	| "pass" { Pass }
	| Assignment
	| Return_stmt
Assignment:
	name "=" Expr ";" {}
If_stmt:
	"if" Named_expression ":" Block [Else_block] {}
Else_block:
	"else" ":" Block {}
While_stmt:
	"while" Named_expression ":" Block {}
Return_stmt:
	"return" [star_expressions] {}
Function_def:
	Function0
	| Function1
	| Function2
Function0:
	"def" name "(" ")" ":" Block {}
Function1:
	"def" name "(" name  ")" ":" Block {}
Function2:
	"def" name "(" name "," name ")" ":" Block {}

data Statement = Assignment
	       | IfStmt
	       | WhileStmt

{
parseError =  fail "Parse error"
}