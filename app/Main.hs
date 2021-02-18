import Control.DeepSeq

data Peano = Succ Peano | Zero deriving (Show)

add :: Peano -> Peano -> Peano
add Zero a = a
add (Succ a) b = add a (Succ b)

five = Succ $ Succ $ Succ $ Succ $ Succ $ Succ Zero

instance NFData Peano where
  rnf Zero = ()
  rnf (Succ a) = rnf a
