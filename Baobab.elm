module Baobab where
import Graphics.Element (..)
import Graphics.Collage (..)
import Random (..)
import List


type alias Angle = Float
type alias Level = Int
type alias Point = (Float,Float)
type alias Size  = Float

baobab : Level -> Point -> Size -> Angle -> Seed -> (List Path, Seed)
baobab level (x,y) size alpha seed =
    if | level == 0 -> ([],seed)
       | otherwise  -> 
           let (rand, newSeed) = generate (float 0 9) seed
               phi  = degrees (40.0 + rand)
               path = squareAndTriangle (x,y) size phi
           in ([path],newSeed)

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

