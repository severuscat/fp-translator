module Lib where

import Data.Text (Text)

data Statement
    = Assignment Expression Expression
    | Expression Expression
    | If [IfClause] [Statement]
    | FuncDef Name [Param] [Statement]
    | Return Expression
    | While Expression Statements
    | Pass
    deriving(Eq, Show)

data Param
    = FormalParam Name
    | DefaultParam Name Expression
    | SplatParam Name
    | DoubleSplatParam Name
    deriving (Eq, Show)

data Arg
    = Arg Expression
    | KeywordArg Name Expression
    | StarArg Expression
    | DoubleStarArg Expression
    deriving (Eq, Show)

data IfClause = IfClause Expression [Statement] deriving (Eq, Show)

type Name           = Text
type Statements     = [Statement]
type IfClauses      = [IfClause]

type Expressions = [Expression]

data Expression
    = Call Expression [Arg]
    | Attribute Expression Name
    | Name Name
    | Constant Constant
    | Subscript Expression Expression
    | UnaryOp UnaryOperator Expression
    | BinOp Operator Expression Expression
    deriving(Eq, Show)

data Constant
    = ConstantInt Integer
    | ConstantBytes String
    | ConstantFloat Double
    | ConstantBool Bool
    | ConstantNone
    deriving(Eq, Show)

data UnaryOperator
    = Not
    | Pos
    | Neg
    | Complement
    deriving(Eq, Show)

data Operator
    = ArithOp ArithmeticOperator
    | BoolOp BooleanOperator
    | CompOp ComparisonOperator
    deriving(Eq, Show)

data ArithmeticOperator
    = Add
    | Sub
    | Mul
    | Div
    | Mod
    deriving(Eq, Show)

data BooleanOperator
    = And
    | Or
    deriving(Eq, Show)

data ComparisonOperator
    = Eq
    | LessThan
    | LessThanEq
    | GreaterThan
    | GreaterThanEq
    deriving(Eq, Show)