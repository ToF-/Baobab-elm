module Baobab where
import Graphics.Element (..)
import Graphics.Collage (..)
import Random (..)
import List

thirdPoint : (Float,Float) -> Float -> Float -> (Float,Float)
thirdPoint (x,y) h alpha = 
    let cosAlpha = cos alpha
        sinAlpha = sin alpha
        a = h * cosAlpha
    in (x + a * cosAlpha, y + a * sinAlpha)


squareAndTriangle : (Float,Float) -> Float -> Float -> Path
squareAndTriangle (x,y) h alpha =
    let
        (x4,y4) = thirdPoint (x,y+h) h alpha
    in [(x,y),(x+h,y),(x+h,y+h),(x4,y4),(x,y+h),(x+h,y+h),(x,y+h),(x,y)]

rotatePoint : (Float,Float) -> Float -> (Float,Float) -> (Float,Float)
rotatePoint (x0,y0) phi (x,y) =
    let
        cosPhi = cos phi
        sinPhi = sin phi
        dx   = x0 - x0 * cosPhi + y0 * sinPhi
        dy   = y0 - x0 * sinPhi - y0 * cosPhi
    in (x * cosPhi - y * sinPhi + dx, x * sinPhi + y * cosPhi + dy)

rotate : (Float,Float) -> Float -> Path -> Path
rotate (xc,yc) phi pts = List.map (rotatePoint (xc,yc) phi) pts

translatePoint : (Float,Float) -> (Float,Float) -> (Float,Float) 
translatePoint (x0,y0) (x,y) = (x0+x, y0+y)

translate : (Float,Float) -> Path -> Path
translate (x0,y0) pts = List.map (translatePoint (x0,y0)) pts

baobab : Int -> (Float,Float) -> Float -> Seed -> (List Path,Seed)
baobab n (x,y) h seed = 
    let
        (r,newSeed) = generate (float 0 9) seed
        alpha = degrees (40.0 + r)         
        p = squareAndTriangle (x,y) h alpha
    in ([p],newSeed)

