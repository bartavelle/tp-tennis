module Main (main) where

import Tennis
import Test.Hspec

test :: (Int, [(Player, String)]) -> Spec
test (n, lst) = it ("test " ++ show n) (go initial lst)
  where
    go _ [] = pure ()
    go curscore ((x, dsc) : xs) = case step x curscore of
      Winner p -> dsc `shouldBe` ("winner " ++ drop 1 (show p))
      Play newscore -> do
        score newscore `shouldBe` dsc
        go newscore xs

tests :: [[(Player, String)]]
tests =
  [ [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P1, "40-30"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P2, "winner 2")],
    [(P2, "0-15")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40")],
    [(P2, "0-15"), (P2, "0-30")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce")],
    [(P1, "15-0"), (P1, "30-0")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2")],
    [(P1, "15-0"), (P1, "30-0"), (P1, "40-0"), (P2, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P1, "30-0"), (P2, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P1, "40-15"), (P2, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P2, "15-40")],
    [(P1, "15-0"), (P2, "15-15"), (P1, "30-15"), (P2, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P1, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P2, "0-30"), (P2, "0-40"), (P1, "15-40"), (P1, "30-40"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P1, "30-15"), (P2, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P1, "15-0"), (P2, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P1, "winner 1")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P1, "40-30"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P2, "advantage 2"), (P2, "winner 2")],
    [(P2, "0-15"), (P1, "15-15"), (P2, "15-30"), (P1, "30-30"), (P2, "30-40"), (P1, "deuce"), (P2, "advantage 2"), (P1, "deuce"), (P1, "advantage 1"), (P2, "deuce"), (P2, "advantage 2"), (P2, "winner 2")]
  ]

main :: IO ()
main = hspec (mapM_ test (zip [0..] tests))
