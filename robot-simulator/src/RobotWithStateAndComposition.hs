module RobotWithStateAndComposition
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

import Control.Monad.State

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot { orientation :: Bearing, position :: Coordinate }
type Coordinate = (Integer, Integer)

bearing :: Robot -> Bearing
bearing robot = orientation robot

coordinates :: Robot -> (Integer, Integer)
coordinates robot = position robot

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction coordinates = Robot direction coordinates

move :: Robot -> String -> Robot
move robot instructions = evalState (execute instructions) robot

execute :: String -> State Robot Robot
execute []     = do
    robot <- get
    return robot

execute (x:xs) = do
    robot <- get
    case x of
            'R' -> put $ turn robot toRight
            'L' -> put $ turn robot toLeft
            'A' -> put $ advance robot
    execute xs
        
turn :: Robot -> (Bearing -> Bearing) -> Robot
turn robot movement = (changeOrientation robot) . movement . orientation $ robot

advance :: Robot -> Robot
advance robot = (changePosition robot) . ($ position robot) . toMovement . orientation $ robot

toLeft :: Bearing -> Bearing
toLeft North = West
toLeft West = South
toLeft South = East
toLeft East = North

toRight :: Bearing -> Bearing
toRight North = East
toRight East = South
toRight South = West
toRight West = North

toMovement :: Bearing -> (Coordinate -> Coordinate)
toMovement North = increaseY
toMovement East = increaseX
toMovement South = decreaseY
toMovement West = decreaseX

changePosition :: Robot -> Coordinate -> Robot
changePosition robot position = robot { position = position }

changeOrientation :: Robot -> Bearing -> Robot
changeOrientation robot orientation = robot { orientation = orientation }

increaseX :: Coordinate -> Coordinate
increaseX coordinate = ((fst coordinate)+1, snd coordinate)

decreaseX :: Coordinate -> Coordinate
decreaseX coordinate = ((fst coordinate)-1, snd coordinate)

increaseY :: Coordinate -> Coordinate
increaseY coordinate = (fst coordinate, (snd coordinate)+1)

decreaseY :: Coordinate -> Coordinate
decreaseY coordinate = (fst coordinate, (snd coordinate)-1)