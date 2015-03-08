module Baobab where
import Graphics.Element (..)
import Graphics.Collage (..)
import Random (..)

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

baobab : Int -> (Float,Float) -> Float -> Seed -> (List Path,Seed)
baobab n (x,y) h seed = 
    let
        (r,newSeed) = generate (float 0 9) seed
        alpha = degrees (40.0 + r)         
        p = squareAndTriangle (x,y) h alpha
    in ([p],newSeed)

