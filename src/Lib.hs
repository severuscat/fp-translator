module Lib where

import Lexer
import Data.List.Split (splitOn)

convertTokens :: [Token] -> [Token]
convertTokens lst = convertTokens2 $ markIndent 0 $ convertTokenSplitted (splitOn [Newline] lst)
  where
    markIndent :: Int -> [[Token]] -> [Token]
    markIndent level ((Tab newLvl : xss) : xs) =
      let dif = newLvl - level
       in case dif of
            0 -> xss ++ [Newline] ++ markIndent newLvl xs
            1 -> (Indent : xss) ++ [Newline] ++ markIndent newLvl xs
            _ ->
              if dif < 0
                then (replicate (- dif) Dedent ++ [Newline] ++ xss) ++ [Newline] ++ markIndent newLvl xs
                else error "incorrect number of spaces in the beginning of this line"
    markIndent _ _ = []
    convertTokenSplitted :: [[Token]] -> [[Token]]
    convertTokenSplitted (x : xs) = replaceWithNTabs 0 x : convertTokenSplitted xs
    convertTokenSplitted [] = []
    replaceWithNTabs :: Int -> [Token] -> [Token]
    replaceWithNTabs n (Space : xs) = replaceWithNTabs (n + 1) xs
    replaceWithNTabs n rest = case mod n 4 of
      0 -> Tab (n `Prelude.div` 4) : filter (\x -> x /= Space && x /= TEmpty) rest
      _ -> error "incorrect number of spaces in the beginning of this line"

convertTokens2 :: [Token] -> [Token]
convertTokens2 [] = []
convertTokens2 [x] = [x]
convertTokens2 tokens = helper (head tokens) (tokens !! 1) [] (tail $ tail tokens)
  where
    helper :: Token -> Token -> [Token] -> [Token] -> [Token]
    helper Newline Dedent acc [] = acc ++ [Dedent]
    helper Newline Dedent acc as = helper Dedent (head as) acc $ tail as
    helper x Newline acc [] = acc ++ [x]
    helper Newline Newline acc as = helper Newline (head as) acc $ tail as
    helper x y acc [] = acc ++ [x, y]
    helper x y acc as = helper y (head as) (acc ++ [x]) $ tail as