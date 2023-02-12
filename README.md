# tp-tennis

## Description

You must write a tennis scoring system for a single game. In order to do so, you will have to:

 * define a `Score` type that will represent the current game score (such as *15-0*, *deuce*, etc.)
 * define the `initial` function, that will return the initial *0-0* score
 * define a `score` function that will give a textual representation for the scores, using the following convention:
   - `X-X` for standard scores, such as `15-0` or `30-40`
   - `deuce` for deuces (ie. `40-40`)
   - `advantage 1` if the first player has the advantage
   - `advantage 2` if the second player has the advantage
 * define a `step` function, that takes a score, the player that has just score a point, and will return the outcome (updated score, or winner).
   The outcome can be either `Winner Player` if this was a winning point, or `Play Score` if the game continues, with the updated score

For example:

```haskell
score score1 = "15-30"
Play score2 = step P1 score1
score score2 = "30-30"

score score3 = "15-40"
Winner P2 = step P2 score3
```

Do not forget to keep the `deriving (Show)` line for the `Score` type.

## Testing

Test your implementation using:

```shell
$ stack test --file-watch
```

It will automatically run the tests every time you save.

## Grading

In order to get the minimal score (10/20), you must pass all the tests. In order to get the maximum grade, make sure that your `Score` type does not allow representing invalid states.
For example, the following type would be bad, as it would allow defining nonsense scores such as `Score 12 (-5)`.

```haskell
data Score = Score Int Int
```

In particular, you might want to check that each possible value of type `Score` correspond to a distinct description when using the `score` function.