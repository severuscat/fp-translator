module Spec where

import Control.Monad.Trans.State
import Data.Char (toUpper)
import GrammarToDSL
import Lexer
import Lib
import Parser (parseTokens)
import System.IO
import Test
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit
import Test.HUnit.Base ((@?), Test (..), (~:), (~=?))


