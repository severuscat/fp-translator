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
	| "pass" NEWLINE				{ $1 }
	| return_stmt NEWLINE				{ $1 }
	| function_call					{ $1 }

compound_stmt
	: function_def					{$1}
	| if_stmt					{$1}
	| while_stmt					{$1}

function_call
	: f0call					{Pass}
	| f1call					{Pass}
	| f2call					{Pass}
f0call:
	name "(" ")"					{Pass}
f1call:
	name "(" name ")"				{Pass}
f2call:
	name "(" name "," name ")"			{Pass}
assignment:
	name "=" expression				{Pass}
if_stmt:
	"if" expression ":" block 			{Pass}
	| "if" expression ":" block else_block 		{Pass}
else_block:
	"else" ":" block	 			{Pass}
while_stmt:
	"while" expression ":" block 			{Pass}
return_stmt:
	"return" expression				{Pass}
function_def:
	function_def0					{Pass}
	| function_def1					{Pass}
	| function_def2					{Pass}
function_def0:
	"def" name "(" ")" ":" block	 		{Pass}
function_def1:
	"def" name "(" name  ")" ":" block	 	{Pass}
function_def2:
	"def" name "(" name "," name ")" ":" block	{Pass}

expression:
	disjunction					{Pass}
disjunction:
	conjunction "or" conjunction 			{Pass}
	| conjunction					{Pass}
conjunction:
	inversion "and" inversion 			{Pass}
	| inversion					{Pass}
inversion:
	"not" inversion					{Pass}
	| comparison					{Pass}
comparison
    : sum compare_op_sum_pair				{Pass}
    | sum						{Pass}
compare_op_sum_pair
    : eq_sum						{Pass}
    | lte_sum						{Pass}
    | lt_sum						{Pass}
    | gte_sum						{Pass}
    | gt_sum						{Pass}
eq_sum:
	"==" sum					{Pass}
lte_sum:
	"<=" sum					{Pass}
lt_sum:
	"<" sum						{Pass}
gte_sum:
	">=" sum					{Pass}
gt_sum:
	">" sum						{Pass}
sum:
	sum "+" term					{Pass}
	| sum "-" term					{Pass}
	| term						{Pass}
term:
	term "*" atom					{Pass}
	| term "/" atom					{Pass}
	| atom						{Pass}
atom:
	name						{Pass}
	| "True"					{Pass}
	| "False"					{Pass}
	| str						{Pass}
	| literal						{Pass}
block:
	NEWLINE INDENT statements DEDENT 		{concat $3}
	| simple_stmt					{$1}
{
parseError =  fail "Parse error"
}