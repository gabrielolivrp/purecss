module Main where

import Effect (Effect)
import Effect.Console (log)
import Parsing (Parser, runParser)
import Parsing.Combinators ((<|>))
import Parsing.String (char)
import Prelude (Unit, bind, pure, show, (==))

ayebee :: Parser String Boolean
ayebee = do
  _ <- char 'a'
  b <- char 'b' <|> char 'B'
  pure (b == 'B')

main :: Effect Unit
main = do 
  let r = runParser "aB" ayebee
  log (show r)
