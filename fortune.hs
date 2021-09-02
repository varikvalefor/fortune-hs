import Data.List.Split;
import System.Environment;
import System.Random;

-- | @nthFortune n f@ returns the @n@th fortune which is fetched from
-- the 'String'-based fortune file content @f@.
nthFortune :: Int
           -- ^ The index of the fortune which should be output
           -> String
           -- ^ The content of the fortune file from which a fortune
           -- should be fetched
           -> String;
nthFortune n f = g !! (n `mod` length g)
  where
  g :: [String]
  g = splitOn "\n%%\n" f;

main :: IO ();
main = getArgs >>= readFile . (!!0) >>= randomFortuneFrmFile >>= putStrLn;

-- | @randomFortuneFrmFile k@ extracts and returns a pseudorandom
-- fortune from @k@.
randomFortuneFrmFile :: FilePath -> IO ();
randomFortuneFrmFile file= flip nthFortune file <$> randomIO;
