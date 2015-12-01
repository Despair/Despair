DESPAIR
=======

[![Build Status](https://travis-ci.org/Heather/Despair.png?branch=master)](https://travis-ci.org/Heather/Despair)

``` haskell
despair ∷ IO () → IO ()
despair = bracket_ ( putStrLn =<< despairQuote )
                   ( do q ← despairQuote
                        offset ← despairOffset q
                        putStrLn $ offset ++ q )
```
