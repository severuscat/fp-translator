module Main where

import Control.Monad.Trans.State.Strict (evalStateT)
import Debug.Trace
import GrammarToDSL
import Interpreter (initContext, interpret)
import Lexer
import Lib
import PPrinter
import Parser (parseTokens)
import System.FilePath.Posix

runTest :: FilePath -> IO ()
runTest filePath = do
  putStrLn "enter <print | p> to run pretty printer or <interpret | i> to run interpretor"
  mode <- getLine
  codeStr <- readFile filePath
  let codeInterpretor = gToDSLBlock (parseTokens $ convertTokens $ alexScanTokens codeStr) initContextLib
  let codePPrinter = gToDSLBlock (parseTokens $ convertTokens $ alexScanTokens codeStr) initContextLib
  case mode of
    "interpret" -> evalStateT (interpret codeInterpretor) initContext
    "print" -> putStrLn $ toString codePPrinter 0
    "p" -> putStrLn $ toString codePPrinter 0
    _ -> trace "wrong mode, run default (interpretor)" $ evalStateT (interpret codeInterpretor) initContext

main :: IO ()
main = do
  putStrLn "enter the filepath"
  filePath <- getLine
  if not (hasExtension filePath)
    then do
      putStrLn "no such a filepath, run default (py-test/simpletest.py)"
      runTest "test-pyfiles/simpletest.py"
    else runTest filePath
