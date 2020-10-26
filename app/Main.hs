module Main where

import DSL
import Interpreter
import Lexer
import Lib
import Parser (parseTokens)

main :: IO ()
main = do
  contents <- readFile "test-pyfiles/simpletest.py"
  -- file test lexer
  --  print (convertTokens $ alexScanTokens contents)
  -- working
  --  print
  --    ([If, TTrue, Colon, Newline, Indent, Pass, Newline, If, TTrue, Colon, Newline, Indent, Pass, Dedent, Dedent, Newline, Name "x", Assign, MyInt 3, Newline])
  --file + parser
  --  print $ parseTokens
  --    ([If, TTrue, Colon, Newline, Indent, Pass, Newline, If, TTrue, Colon, Newline, Indent, Pass, Dedent, Dedent, Newline, Name "x", Assign, MyInt 3, Newline])
  print "==============TEST=============="
  print $
    [If, TTrue, Colon]
      ++ [Newline, Indent, If, TTrue, Colon]
      ++ [Newline, Indent, Pass]
      ++ [Dedent, Dedent, Newline, Name "x", Assign, MyInt 3]
  print $ parseTokens $
    [If, TTrue, Colon]
      ++ [Newline, Indent, If, TTrue, Colon]
      ++ [Newline, Indent, Pass]
      ++ [Dedent, Dedent, Newline, Name "x", Assign, MyInt 3]

  print "==============FILE=============="
  print $ convertTokens $ alexScanTokens contents
  print $ parseTokens $ convertTokens $ alexScanTokens contents
--  print $ interpret $ DSL.or (lessThan (wrapMyValue (MInt 6)) (wrapMyValue (MInt 10))) myTrue
  print "==============INTERPRETOR=============="
  res <- test
  print res