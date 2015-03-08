import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Text (..)
import Baobab (..)

main : Element
main = collage 500 500 [traced (solid red) <| squareAndTriangle (0,0) 100 <| degrees 15
                       ,move (0,100) <| 
                        rotate (degrees 15) <|
                       traced (solid red) <| squareAndTriangle (0,0) (100 * cos (degrees 15))  <| degrees 60]
