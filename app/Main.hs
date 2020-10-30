module Main where

import DSL
import Interpreter
import Lexer
import Lib
import Parser (parseTokens)
import Control.Monad.Trans.State.Lazy (runStateT, execStateT)
import Test

main :: IO ()
main = do
  print "==============TEST=============="
  -- file test lexer
  contents <- readFile "test-pyfiles/simpletest.py"
  print "\n==============LEXER=============="
  print (convertTokens $ alexScanTokens contents)
  print "==============lexer - check eq=============="
  print $
    [If, TTrue, Colon]
      ++ [Newline, Indent, If, TTrue, Colon]
      ++ [Newline, Indent, Pass]
      ++ [Dedent, Dedent, Newline, Name "x", Assign, MyInt 3]
      
  print "\n==============PARSER=============="
  print $ parseTokens $ convertTokens $ alexScanTokens contents
  print "\n==============INTERPRETOR=============="
  test tprog1
  verySimpleTest <- readFile "test-pyfiles/verysimpletest.py"
  print verySimpleTest
  print $ alexScanTokens verySimpleTest
  print $ convertTokens $ alexScanTokens verySimpleTest
  print $ parseTokens $ convertTokens $ alexScanTokens verySimpleTest
  let prog = parseTokens $ convertTokens $ alexScanTokens verySimpleTest
  test $ gToDSLBlock prog initContextLib
