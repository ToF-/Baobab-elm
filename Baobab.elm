module Baobab
    where

thirdPoint : (Float,Float) -> Float -> Float -> (Float,Float)
thirdPoint (x,y) h alpha = 
    let cosAlpha = cos alpha
        sinAlpha = sin alpha
        a = h * cosAlpha
    in (x + a * cosAlpha, y + a * sinAlpha)

