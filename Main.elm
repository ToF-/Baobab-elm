import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Text (..)
import Baobab (..)

angle = degrees 40
main : Element
main = collage 500 500 [traced (solid red) <| squareAndTriangle (0,0) 100 <| angle
                       ,move (0,100) <| 
                        rotate (angle) <|
                       traced (solid red) <| squareAndTriangle (0,0) (100 * cos (angle))  <| degrees 60]
