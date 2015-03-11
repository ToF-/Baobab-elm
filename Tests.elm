import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)
import List
import Random (..)
import Baobab as B


assertEqualPaths expected actual = 
    let roundCoords (x,y) = (round x*10000, round y*10000)
    in assertEqual (List.map roundCoords expected)  (List.map roundCoords actual)

tests = suite "Baobab function" 
    [test "given a point and a size, baseless square yields a path"
     <| assertEqual [(10,0),(10,10),(0,10),(0,0)] <| B.baselessSquare (0,0) 10

    ,test "given a point, a size, and an angle, baseless triangle yields a path"
     <| assertEqualPaths [(0,0),(sqrt 2, sqrt 2),(2,0)] <| B.baselessTriangle (0,0) 2 (degrees 45)
    ]

main = runDisplay tests
