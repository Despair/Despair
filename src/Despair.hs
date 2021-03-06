{-# LANGUAGE
    UnicodeSyntax
  , Safe
  #-}

module Despair
  ( despairQuote
  , despair ) where

import Control.Monad (liftM)
import Control.Exception (bracket_)

import System.Random (randomRIO)

weakQuotes ∷ [String]
weakQuotes = [
    "This is the way the world ends. Not with a bang but a whimper.",
    "I have long since closed my eyes... My only goal is in the darkness.",
    "I want you to feel pain, to think about pain, to accept pain, to know pain.",
    "To hope for nothing, to expect nothing, to demand nothing. This is analytical despair.",
    "Hope is a gift we give ourselves in our darkest despair.",
    "Pain to the world", "Despair wishes their hope diminishes.",
    "Some stories end in despair, some begin there", "Heaven Conceal",
    "When You're Going Through the Hell, Just Keep Going",
    "There is no love of life without despair of life.", "Sadness is the ambrosia of all art.",
    "When all else is lost, the future still remains", "My life is a perfect graveyard of buried hopes.",
    "It is not despair, for despair is only for those who see the end beyond all doubt. We do not",
    "Schizophrenia cannot be understood without understanding despair",
    "To be Despair. It is a portrait. Only close your eyes and feel.",
    "You can't truly heal from a loss until you allow yourself to really FEEL the loss.",
    "I can't shove the dark out of my way.", "Pain is just the Rest from Pain",
    "THERE IS NO LIGHT NO HOPE THERE IS ONLY DESPAIR!", "Sleepless Despair!",
    "Physical pain is pure emotion, there are a lot of things we want but afraid to tell it",
    "Once ,I had a dream... then I woke up",
    "You bring the darkness in my mind, in my life",
    "You bring the darkness in my heart, the poisoned side",
    "You bring the darkness in my time, in my light",
    "You bring the darkness in my words, a nameless rhyme",
    "And we hear and we cry They shattered our dreaming...",
    "And I cry out in this Mud And I fear it in the Night And I look up in this All And I feed on this Pain",
    "Aching and hoping - no Secrets to hide"
    ]

despairQuote ∷ IO String
despairQuote = liftM (weakQuotes !!)
    (randomRIO (0, length weakQuotes - 1))

despairOffset ∷ String → IO String
despairOffset q = do
    r ← randomRIO (0, lim) :: IO Int
    return $ replicate r ' '
  where lim ∷ Int
        lim = if length q > 40 then 5
                               else 10

despair ∷ IO () → IO ()
despair = bracket_ ( putStrLn =<< despairQuote )
                   ( do q ← despairQuote
                        offset ← despairOffset q
                        putStrLn $ offset ++ q )
