import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)
import List
import Random (..)
import Baobab (..)

roundCoord : (Float, Float) -> (Int,Int)
roundCoord (x,y) = (round x, round y)

tests = suite "Baobab function" 
        [suite "thirdPoint"
            [test "should calculate the third point coordinates for 45°" 
                 (assertEqual (5,5) (roundCoord (thirdPoint (0,0) 10 (degrees 45))))
            ,test "should calculate the third point coordinates for 60°" 
                 (assertEqual (3,4) (roundCoord (thirdPoint (0,0) 10 (degrees 60))))
            ]
        ,suite "squareAndTriangle"
            [test "should calculate the path for a square and a triangle"
                (assertEqual [(0,0),(10,0),(10,10),(5,15),(0,10),(10,10),(0,10),(0,0)]
                  (List.map roundCoord (squareAndTriangle (0,0) 10 (degrees 45))))
            ]
        ,suite "rotate" 
            [test "should rotate a path around a point" 
                (assertEqual [(0,0),(1,1)] (List.map roundCoord (rotate (0,0) (degrees 45) [(0,0),(1,0)])))]
        ]

main = runDisplay tests
