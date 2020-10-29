{
{-# LANGUAGE DeriveAnyClass #- }
{-# LANGUAGE DeriveGeneric #- }
module Parser where
import GHC.Generics
import Lexer
import Control.DeepSeq
import Data.Char
import Grammar as G
}

%name parseTokens input
%tokentype { Lexer.Token }
%error { parseError }

%token
    "def"                   			{Lexer.Def}
    ":"                     			{Lexer.Colon}
    "return"                			{Lexer.ReturnStm}
    "while"                 			{Lexer.While}
    "if"                    			{Lexer.If}
    "else"                  			{Lexer.Else}
    "True"                  			{Lexer.TTrue}
    "False"                 			{Lexer.TFalse}
    "+"                     			{Lexer.Plus}
    "-"                     			{Lexer.Minus}
    "/"                     			{Lexer.Div}
    "*"                     			{Lexer.Mul}
    "=="                    			{Lexer.Equality}
    "pass"                  			{Lexer.Pass}
    "print"                 			{Lexer.Print}
    ">"                     			{Lexer.Greater}
    "<"                     			{Lexer.Less}
    ">="                    			{Lexer.GreaterEq}
    "<="                    			{Lexer.LessEq}
    "and"                   			{Lexer.And}
    "or"                    			{Lexer.Or}
    "not"                   			{Lexer.Not}
    "="            			        {Lexer.Assign}
    "("                     			{Lexer.OPar}
    ")"                     			{Lexer.CPar}
    ","                     			{Lexer.Comma}
    NEWLINE					{ Lexer.Newline }
    INDENT					{ Lexer.Indent }
    DEDENT					{ Lexer.Dedent }
    str      					{ Lexer.Str $$ }
    float					{ Lexer.MyFloat $$ }
    int						{ Lexer.MyInt $$ }
    name 					{ Lexer.Name $$ }
    "input()" 					{ Lexer.ReadStr }
    "int(input())" 				{ Lexer.ReadInt }
    "float(input())" 				{ Lexer.ReadFloat }

%%
input
	: NEWLINE					{[G.Pass]}
	| statements					{ $1 }
statements
	: statement 					{ [$1] }
	| statement NEWLINE statements			{ $1:$3 }
statement
	: compound_stmt					{ $1 }
	| simple_stmt					{ $1 }
simple_stmt
	: assignment					{ $1 }
	| "pass"					{ G.Pass }
	| return_stmt					{ $1 }
	| name "(" ")"					{ F0CallS $1 }
        | name "(" name ")"				{ F1CallS $1 $3 }
        | name "(" name "," name ")"			{ F2CallS $1 $3 $5 }
compound_stmt
	: function_def					{ $1 }
	| if_stmt					{ $1 }
	| while_stmt					{ $1 }
assignment:
	name "=" expression				{G.Assignment $1 $3}
if_stmt:
	"if" expression ":" block 			{G.If $2 $4 }
	| "if" expression ":" block "else" ":" block    {G.IfElse $2 $4 $7}
while_stmt:
	"while" expression ":" block 			{ G.While $2 $4 }
return_stmt:
	"return" expression				{G.Return $2}
function_def:
	"def" name "(" ")" ":" block	 		{G.Func0Def $2 $6}
	| "def" name "(" name  ")" ":" block	 	{G.Func1Def $2 $4 $7}
	| "def" name "(" name "," name ")" ":" block	{G.Func2Def $2 $4 $6 $9}
expression:
	disjunction					{ $1 }
disjunction:
	conjunction "or" conjunction 			{G.Or $1 $3}
	| conjunction					{$1}
conjunction:
	inversion "and" inversion 			{G.And $1 $3}
	| inversion					{$1}
inversion:
	"not" inversion					{G.Not $2}
	| comparison					{$1}
comparison
	: sum "==" sum					{ G.Eq $1 $3 }
	| sum "<=" sum					{ G.LessThanEq $1 $3 }
	| sum "<" sum					{ G.LessThan $1 $3 }
	| sum ">=" sum					{ G.GreaterThanEq $1 $3 }
	| sum ">" sum					{ G.GreaterThan $1 $3 }
	| sum						{ $1 }
sum:
	sum "+" term					{ G.Add $1 $3}
	| sum "-" term					{ G.Sub $1 $3}
	| term						{ $1 }
term:
	term "*" atom					{ G.Mul $1 $3 }
	| term "/" atom					{ G.Div $1 $3 }
	| atom						{ $1 }
atom:
	"int(input())"					{ G.ReadInt }
	| "float(input())"				{ G.ReadFloat }
	| "input()"					{ G.ReadStr }
	| name						{ G.Var $1 }
	| name "(" ")"					{ G.F0CallE $1 }
        | name "(" name ")"				{ G.F1CallE $1 $3 }
        | name "(" name "," name ")"			{ G.F2CallE $1 $3 $5 }
	| "True"					{ G.MyTrue }
	| "False"					{ G.MyFalse}
	| int						{ G.MyInt $1}
	| float						{ G.MyFloat $1}
block:
	NEWLINE INDENT statements DEDENT	 	{ $3 }
{
parseError =  error "Parse error"
}