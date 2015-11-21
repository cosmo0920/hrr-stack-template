module Lib
    ( someFunc
    , helloWorld
    ) where
import Data.Int (Int32)
import Database.Relational.Query

hello :: Relation () (Int32, String)
hello = relation $ return (value 0 >< value "Hello")

world :: Relation () (Int32, String)
world = relation $ return (value 0 >< value "World!")

helloWorld :: Relation () (Int32, (String, String))
helloWorld = relation $ do
    h <- query hello
    w <- query world
    on $ h ! fst' .=. w ! fst'
    return $ h ! fst' >< (h ! snd' >< w ! snd')

someFunc :: IO ()
someFunc = putStrLn "someFunc"
