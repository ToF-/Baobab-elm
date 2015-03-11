module Baobab where
import Graphics.Element (..)
import Graphics.Collage (..)
import Random (..)
import List


type alias Angle = Float
type alias Level = Int
type alias Point = (Float,Float)
type alias Size  = Float

baselessSquare : Point -> Size -> Path
baselessSquare (x,y) l = [(x+l,y),(x+l,y+l),(x,y+l),(x,y)]

baselessTriangle : Point -> Size -> Angle -> Path
baselessTriangle (x,y) l phi = [(x,y),(x + l * cos phi, y + l * sin phi),(x+l,y)]

baobab : Level -> Point -> Size -> Angle -> Seed -> (List Path, Seed)
baobab level (x,y) size alpha seed =
    case level of 
       0 -> ([],seed)
       _ -> let (rand, newSeed) = generate (float -15 15) seed
                phi  = degrees (45.0 + rand)
                origin= (x,y)
                second = (x,y+size)
                third  = thirdPoint second size phi
                path1 = squareAndTriangle (x,y) size phi
                (pathLeft,newNewSeed) = baobab (level-1) second (size * cos phi) (phi) newSeed
                path2 = List.concat <| pathLeft
                (pathRight,nextSeed) = baobab (level-1) third (size * sin phi) (phi-pi/2.0) newNewSeed
                path3 = List.concat <| pathRight

            in (List.map (rotate origin alpha) [path1,path3],nextSeed)

thirdPoint : (Float,Float) -> Float -> Float -> (Float,Float)
thirdPoint (x,y) h alpha = 
    let cosAlpha = cos alpha
        sinAlpha = sin alpha
        a = h * cosAlpha
    in (x + a * cosAlpha, y + a * sinAlpha)


squareAndTriangle : (Float,Float) -> Float -> Float -> Path
squareAndTriangle (x,y) h alpha =
    let (x4,y4) = thirdPoint (x,y+h) h alpha
    in [(x,y),(x+h,y),(x+h,y+h),(x4,y4),(x,y+h),(x+h,y+h),(x,y+h),(x,y)]


rotate : (Float,Float) -> Float -> Path -> Path
rotate (xc,yc) phi pts =
    let rotatePoint (x0,y0) phi (x,y) =
            let cosPhi = cos phi
                sinPhi = sin phi
                dx   = x0 - x0 * cosPhi + y0 * sinPhi
                dy   = y0 - x0 * sinPhi - y0 * cosPhi
            in (x * cosPhi - y * sinPhi + dx, x * sinPhi + y * cosPhi + dy)
    in List.map (rotatePoint (xc,yc) phi) pts


translate : (Float,Float) -> Path -> Path
translate (x0,y0) pts =
   let translatePoint (x0,y0) (x,y) = (x0+x, y0+y)
   in List.map (translatePoint (x0,y0)) pts

