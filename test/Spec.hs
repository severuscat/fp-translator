module Main where

import GrammarToDSL
import Lexer
import Lib
import Parser (parseTokens)
import Test.Hspec
import PPrinter

main :: IO ()
main = hspec $ do
  test1
  test2

test1 :: SpecWith ()
test1 = do
  it "[printer] test-pyfiles/simpletest.py"
    $ helperPrinter test1Text `shouldBe` test1Expected

test2 :: SpecWith ()
test2 = do
  it "[printer] test-pyfiles/verysimpletest.py"
    $ helperPrinter test2Text `shouldBe` test2Expected

test1Text :: String
test1Text = "print \"this is simpletest.py\"\n"++
            "def f(a1, a2):\n"++
            "    print \"arg1 is\"\n"++
            "    print a1\n"++
            "    print \"arg2 is\"\n"++
            "    print a2\n"++
            "f(\"arg1\", \"arg2\")\n"++
            "p = f(1, 2)\n"++
            "return p"

test1Expected :: String
test1Expected = "print \"this is simpletest.py\"\n"++
                "def f(a1, a2):\n"++
                "    print \"arg1 is\"\n"++
                "    print a1\n"++
                "    print \"arg2 is\"\n"++
                "    print a2\n"++
                "\n"++
                "f(\"arg1\", \"arg2\")\n"++
                "\"p\" = f(1, 2)\n"++
                "return p"

test2Text :: String
test2Text = "print \"this is test-pyfiles/verysimpletest.py\"\n"++
            "def x(c):\n"++
            "    while c < 10:\n"++
            "        c = c + 1\n"++
            "        c = c + 1\n"++
            "        print c\n"++
            "    return c\n"++
            "print \"300\"\n"++
            "print x(1)"

test2Expected :: String
test2Expected = "print \"this is test-pyfiles/verysimpletest.py\"\n"++
                "def x(c):\n"++
                "    while c < 10:\n"++
                "        \"c\" = c + 1\n"++
                "        \"c\" = c + 1\n"++
                "        print c\n"++
                "\n"++
                "    return c\n"++
                "print \"300\"\n"++
                "print x(1)\n"

helperPrinter :: String -> String
helperPrinter progText = toString (
  gToDSLBlock
  (parseTokens $ convertTokens $ alexScanTokens progText)
  initContextLib)
  0