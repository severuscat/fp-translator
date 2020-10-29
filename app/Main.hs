module Main where

import DSL
import Interpreter
import Lexer
import Lib
import Parser (parseTokens)
import Control.Monad.Trans.State.Lazy (runStateT, execStateT)

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
      --  print $ interpret $ DSL.or (lessThan (wrapMyValue (MInt 6)) (wrapMyValue (MInt 10))) myTrue
  print "\n==============INTERPRETOR=============="
  test tprog1