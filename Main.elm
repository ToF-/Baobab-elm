import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Text (..)
import Baobab 

angle = degrees 40
main : Element
main = collage 500 500 [traced (solid red) <| Baobab.squareAndTriangle (0,0) 100 <| angle
                       ,traced (solid red) <| Baobab.rotate (0,100) angle <| Baobab.squareAndTriangle (00,100) (100 * cos (angle))  <| degrees 60]
