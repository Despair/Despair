{-# LANGUAGE
    UnicodeSyntax
  #-}

module Despair
  ( despairQuote
  , despair ) where

import Control.Monad (liftM)
import Control.Exception (bracket_)

import System.Random (randomRIO)

weakQuotes ∷ [String]
weakQuotes = [
    " This is the way the world ends. Not with a bang but a whimper.                             ",
    "             Heaven Conceal                                                                 ",
    "    I have long since closed my eyes... My only goal is in the darkness.                    ",
    "              I want you to feel pain, to think about pain, to accept pain, to know pain.   ",
    "     To hope for nothing, to expect nothing, to demand nothing. This is analytical despair. ",
    "               Hope is a gift we give ourselves in our darkest despair.                     ",
    "         Pain to the world                                                                  ",
    "               Despair wishes their hope diminishes.                                        ",
    "       Some stories end in despair, some begin there                                        ",
    "               When You're Going Through the Hell, Just Keep Going                          ",
    "                   There is no love of life without despair of life.                        ",
    "                                           When all else is lost, the future still remains  ",
    "                My life is a perfect graveyard of buried hopes.                             ",
    "It is not despair, for despair is only for those who see the end beyond all doubt. We do not",
    "     Schizophrenia cannot be understood without understanding despair                       ",
    "                     To be Despair. It is a portrait. Only close your eyes and feel.        ",
    "           Sadness is the ambrosia of all art.                                              ",
    " You can't truly heal from a loss until you allow yourself to really FEEL the loss.         ",
    "                   I can't shove the dark out of my way.                                    ",
    "                         THERE IS NO LIGHT NO HOPE THERE IS ONLY DESPAIR!!!                 ",
    " Sleepless Despair!                                                                         ",
    "                   Pain is just the Rest from Pain                                          ",
    "   Physical pain is pure emotion, there are a lot of things we want but afraid to tell it   ",
    "        Once ,I had a dream... then I woke up                                               "
    ]

despairQuote ∷ IO String
despairQuote = liftM (weakQuotes !!)
    (randomRIO (0, length weakQuotes - 1))

despair ∷ IO () → IO ()
despair = bracket_ ( despairQuote >>= \q →
                        let cutLen = length $ takeWhile (== ' ') q
                            startQ = drop cutLen q
                        in putStrLn startQ
                    ) (    putStrLn =<< despairQuote )
