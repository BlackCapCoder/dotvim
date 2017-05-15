module Main where

import Control.Monad
import System.IO
import System.Environment
import System.Process
import Control.Concurrent

main :: IO ()
main = do
  putStrLn "codify v 0.2"
  getArgs >>= f

f (p:ps) = do
  putStr "> "
  hFlush stdout
  ln  <- getLine
  res <- readProcess p (ps ++ [ln]) ""
  putStrLn ""
  putStrLn res
  threadDelay 100000
  f (p:ps)

g n = do
  putStr "> "
  hFlush stdout
  ln  <- getLine
  putStrLn ""
  print n
  g $ n + 1
