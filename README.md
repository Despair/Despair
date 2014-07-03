DESPAIR
=======

[![Build Status](https://travis-ci.org/Heather/Despair.png?branch=master)](https://travis-ci.org/Heather/Despair)

``` haskell
despairQuote :: IO()
despairQuote = 
    putStrLn =<< ( randomRIO (0, length weakQuotes - 1) 
                     >>= return . (weakQuotes !!)
                 )

despair :: IO() -> IO()
despair = bracket_ ( despairQuote )
                   ( despairQuote )
```

Hackage
=======

``` shell
cabal install despair
```