#!/usr/bin/env stack runhaskell
-- tex4ht-cleanup.hs
import Text.Pandoc.JSON

main :: IO ()
main = toJSONFilter cleanup
  where cleanup (Header n _ xs) = (Header n ("", [], []) xs)
        -- cleanup (Span cls xs) = Emph xs
        cleanup x = x

