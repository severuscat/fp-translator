module Main where
import Data.Char (toUpper)
import GrammarToDSL
import Lexer
import Lib
import Parser (parseTokens)
import System.IO
import Test

main :: IO ()
main = do
    simpleTest <- readFile "test-pyfiles/simpletest.py"
    verySimpleTest <- readFile "test-pyfiles/verysimpletest.py"
    print "==============PARSER=============="
    print $ parseTokens $ convertTokens $ alexScanTokens verySimpleTest
    print $ parseTokens $ convertTokens $ alexScanTokens simpleTest
    print "==============INTERPRETOR=============="
    let prog = parseTokens $ convertTokens $ alexScanTokens verySimpleTest
    let prog1 = parseTokens $ convertTokens $ alexScanTokens simpleTest
    print "parsing was successful!"
    test $ gToDSLBlock prog1 initContextLib
    test $ gToDSLBlock prog initContextLib