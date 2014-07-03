DESPAIR
=======

[![Build Status](https://travis-ci.org/Heather/Despair.png?branch=master)](https://travis-ci.org/Heather/Despair)

``` haskell
despairQuote :: IO String
despairQuote = randomRIO (0, length weakQuotes - 1) 
                    >>= return . (weakQuotes !!)

despair :: IO() -> IO()
despair = bracket_ ( despairQuote >>= \q ->
                        let cutLen = length $ takeWhile (== ' ') q
                            startQ = drop cutLen q
                        in putStrLn startQ
                    ) (    putStrLn =<< despairQuote )
```

Hackage
=======

``` shell
cabal install despair
```