import System.IO

newtype Sum a = Sum { getSum :: a}
  deriving (Eq, ord, ...)

instance Num a => Semigroup (Sum a) where
  (<>) = coerce ((+) :: a -> a  -> a)
  stimes n (Sum a) = Sum (fromIntegral n * a)

instance Num a => Monoid (Sum a) where
  mempty = Sum 0

main :: IO ()
main = do
  putStrLn $ mempty