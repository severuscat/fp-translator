{
{-# LANGUAGE DeriveAnyClass #- }
{-# LANGUAGE DeriveGeneric #- }
module Parser where
import GHC.Generics
import Lexer
import Control.DeepSeq
import Data.Char
import Lib as L
}

%name parseTokens input
%tokentype { Lexer.Token }
%error { parseError }

%token
	"def"                   		{ Keyword "def" }
	"return"                		{ Keyword "return" }
	"while"                 		{ Keyword "while" }
	"if"                    		{ Keyword "if" }
	"True"                  		{ Keyword "True" }
	"False"                 		{ Keyword "False" }
	"pass"					{ Keyword "pass" }
	"+"                    			{ Operator "+" }
	"-"                    			{ Operator "-" }
	"/"                    			{ Operator "/" }
	"*"                    			{ Operator "*" }
	"=="                    		{ Operator "==" }
	">"                     		{ Operator ">" }
	"<"                     		{ Operator "<" }
	">="                    		{ Operator ">=" }
	"<="                    		{ Operator "<=" }
	"and"                   		{ Keyword "and" }
	"or"                    		{ Keyword "or" }
	"not"                   		{ Keyword "not" }
	"else"                   		{ Keyword "else" }
	"="                     		{ Delimiter "=" }
	"("                     		{ Delimiter "(" }
	")"                     		{ Delimiter ")" }
	":"         				{ Delimiter ":" }
	","                     		{ Delimiter ","  }
	NEWLINE					{ Newline }
	INDENT					{ Indent }
	DEDENT					{ Dedent }
	name 					{ Identifier $$ }
	literal     				{ Literal $$ }
	str      				{ StringLiteral $$ }

%%
input
	: NEWLINE					{[Pass]}
	| statements					{ foldl' (++) [] (rights $1) }

statements
	: statement					{$1}
	| statement NEWLINE statements			{$1:$2}
statement
	: compound_stmt					{[$1]}
	| simple_stmt					{$1}

simple_stmt
	: assignment NEWLINE				{ $1 }
	| "pass" NEWLINE				{ Pass }
	| return_stmt NEWLINE				{ $1 }
	| function_call					{ $1 }

compound_stmt
	: function_def					{$1}
	| if_stmt					{$1}
	| while_stmt					{$1}

function_call
	: f0call					{$1}
	| f1call					{$1}
	| f2call					{$1}
f0call:
	name "(" ")"					{F0Call $1}
f1call:
	name "(" name ")"				{F1Call $1 $3}
f2call:
	name "(" name "," name ")"			{F2Call $1 $3 $5}
assignment:
	name "=" expression				{Assignment $1 $3}
if_stmt:
	"if" expression ":" block 			{If ((IfClause $2 $4):$5 [] }
	| "if" expression ":" block else_block 		{If ((IfClause $2 $4):$5 $6}
else_block:
	"else" ":" block	 			{$3}
while_stmt:
	"while" expression ":" block 			{ While $2 $4 }
return_stmt:
	"return" expression				{Return $2}
function_def:
	function_def0					{ $1 }
	| function_def1					{ $2 }
	| function_def2					{ $3 }
function_def0:
	"def" name "(" ")" ":" block	 		{FuncDef (T.pack $2) [] $6}
function_def1:
	"def" name "(" name  ")" ":" block	 	{FuncDef (T.pack $2) [$4] $7}
function_def2:
	"def" name "(" name "," name ")" ":" block	{FuncDef (T.pack $2) [$4, $5] $9}

expression:
	disjunction					{$1}
disjunction:
	conjunction "or" conjunction 			{BinOp (BoolOp Or) $1 $3}
	| conjunction					{$1}
conjunction:
	inversion "and" inversion 			{BinOp (BoolOp And) $1 $3}
	| inversion					{$1}
inversion:
	"not" inversion					{UnaryOp Not $2}
	| comparison					{$1}
comparison
	: sum "==" sum					{ BinOp (CompOp Eq) $1 $3 }
	| sum "<=" sum					{ BinOp (CompOp LessThanEq) $1 $3 }
	| sum "<" sum					{ BinOp (CompOp LessThan) $1 $3 }
	| sum ">=" sum					{ BinOp (CompOp GreaterThanEq) $1 $3 }
	| sum ">" sum					{ BinOp (CompOp GreaterThan) $1 $3 }
	| sum						{ $1 }
sum:
	sum "+" term					{BinOp (ArithOp Add) $1 $3}
	| sum "-" term					{BinOp (ArithOp Sub) $1 $3}
	| term						{$1}
term:
	term "*" atom					{BinOp (ArithOp Mul) $1 $3 }
	| term "/" atom					{BinOp (ArithOp Div) $1 $3 }
	| atom						{$1}
atom:
	name						{Name . T.pack $ s}
	| "True"					{ Constant $ ConstantBool True }
	| "False"					{ Constant $ ConstantBool False}
	| literal					{Constant $1}
block:
	NEWLINE INDENT statements DEDENT 		{concat $3}
	| simple_stmt					{$1}
{
parseError =  fail "Parse error"
}