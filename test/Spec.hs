import GrammarToDSL
import Lexer
import Lib
import Parser (parseTokens)
import Test

main :: IO ()
main = do
  print "TEST:"
  simpleTest <- readFile "test-pyfiles/simpletest.py"
  verySimpleTest <- readFile "test-pyfiles/verysimpletest.py"
  print "\n==============PARSER=============="
  print $ parseTokens $ convertTokens $ alexScanTokens verySimpleTest
  print $ parseTokens $ convertTokens $ alexScanTokens simpleTest
  print "\n==============INTERPRETOR=============="
  let prog = parseTokens $ convertTokens $ alexScanTokens verySimpleTest
  let prog1 = parseTokens $ convertTokens $ alexScanTokens simpleTest
  print "parsing was successful!"
  test $ gToDSLBlock prog initContextLib
  test $ gToDSLBlock prog1 initContextLib
  
