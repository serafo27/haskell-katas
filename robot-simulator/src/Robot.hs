module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

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
move robot instructions = foldl singleMove robot instructions

singleMove :: Robot -> Char -> Robot
singleMove robot action
        | action == 'R' = turnRight robot (orientation robot)
        | action == 'L' = turnLeft robot (orientation robot)
        | action == 'A' = advance robot

        
turnLeft :: Robot -> Bearing -> Robot
turnLeft robot North = robot { orientation = West }
turnLeft robot West = robot { orientation = South }
turnLeft robot South = robot { orientation = East }
turnLeft robot East = robot { orientation = North }

turnRight :: Robot -> Bearing -> Robot
turnRight robot North = robot { orientation = East }
turnRight robot East = robot { orientation = South }
turnRight robot South = robot { orientation = West }
turnRight robot West = robot { orientation = North }

advance ::  Robot -> Robot
advance robot
    |  orientation robot == North = robot { position = increaseY $ position robot }
    |  orientation robot == East = robot { position = increaseX $ position robot }
    |  orientation robot == South = robot { position = decreaseY $ position robot }
    |  orientation robot == West = robot { position = decreaseX $ position robot }

increaseX :: Coordinate -> Coordinate
increaseX coordinate = ((fst coordinate)+1, snd coordinate)

decreaseX :: Coordinate -> Coordinate
decreaseX coordinate = ((fst coordinate)-1, snd coordinate)

increaseY :: Coordinate -> Coordinate
increaseY coordinate = (fst coordinate, (snd coordinate)+1)

decreaseY :: Coordinate -> Coordinate
decreaseY coordinate = (fst coordinate, (snd coordinate)-1)