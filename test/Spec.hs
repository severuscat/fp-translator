module Spec where

import GrammarToDSL
import Lexer
import Lib
import Parser (parseTokens)
import Test.Hspec
import DSL
import PPrinter
import Interpreter
import Control.Monad.Trans.State.Strict (evalStateT, execStateT)
import Data.Functor.Identity (runIdentity)

test1Text :: String
test1Text = undefined


main :: IO ()
main = hspec $ do
  test1

test1 :: SpecWith ()
test1 = do
  it "[interpretor] test-pyfiles/simpletest.py" 
    $ helperInterpretor test1Text `shouldBe` ""
  
  where
    helperInterpretor :: String -> String
    helperInterpretor progText =
      toString (runIdentity $ gToDSLBlock  (parseTokens $ convertTokens $ alexScanTokens progText) initContextLib ) 0