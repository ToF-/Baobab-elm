import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Text (..)
import List
import Baobab as B 

angle = degrees 30
height = 80
origin = (0,0)
second = (fst origin,snd origin + height)
third  = B.thirdPoint second height angle
main : Element
main = collage 1000 1200 <| List.map (traced (solid red)) 
    [B.squareAndTriangle origin height <| angle
    ,B.rotate second angle <| B.translate second <| B.squareAndTriangle origin (height * cos (angle))  <| angle
    ,B.rotate third (angle-pi/2.0) <| B.translate third <| B.squareAndTriangle origin (height * sin (angle))  <| angle]
