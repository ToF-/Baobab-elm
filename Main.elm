import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Text (..)
import Baobab 

angle = degrees 40
tp = Baobab.thirdPoint (0,100) 100 angle
main : Element
main = collage 500 500 [traced (solid red) <| Baobab.squareAndTriangle (0,0) 100 <| angle
                       ,traced (solid red) <| Baobab.rotate (0,100) angle <| Baobab.translate (0,100) <| Baobab.squareAndTriangle (0,0) (100 * cos (angle))  <| degrees 60
                       ,traced (solid red) <| Baobab.rotate tp (angle-pi/2.0) <| Baobab.translate tp <| Baobab.squareAndTriangle (0,0) (100 * sin (angle))  <| degrees 60]
