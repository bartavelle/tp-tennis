module Tennis (Player (..), Outcome (..), Score, initial, step, score, student) where

data Player = P1 | P2 deriving (Show, Eq, Ord, Enum, Bounded)

data Outcome = Winner Player | Play Score deriving (Show)

-- start editing after this line, do not edit above!

student :: String
student = "DO NOT FORGET TO PUT YOUR NAME HERE"

data Score = ToBeDefined
  deriving (Show)

initial :: Score
initial = undefined

score :: Score -> String
score = undefined

step :: Player -> Score -> Outcome
step = undefined