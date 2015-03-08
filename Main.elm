import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Text (..)
import Baobab (..)

main : Element
main = collage 300 300 [ triangle (0,0) 100 (degrees 15)
                        ,triangle (0,0) 100 (degrees 30)
                        ,triangle (0,0) 100 (degrees 45)
                        ,triangle (0,0) 100 (degrees 60)
                        ,triangle (0,0) 100 (degrees 75)]

triangle : (Float,Float) -> Float -> Float -> Form
triangle (x0,y0) h a = 
    let 
        (x2,y2) = thirdPoint (x0,y0) h a 
        (x1,y1) = (x0+h,y0)
    in (traced (solid red) (path [(x0,y0),(x1,y1),(x2,y2),(x0,y0)]))
