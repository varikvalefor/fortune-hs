import Data.List.Split;
import System.Environment;
import System.Random;

-- | @nthFortune n f@ returns the @n@th fortune which is fetched from
-- the 'String'-based fortune file content @f@.
--
-- If @n@ exceeds the number of available fortunes, then the
-- @n `mod` g@th fortune is output, where @g@ denotes the number of
-- fortunes which @f@ contains.
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
main = getArgs >>= readFile . head >>= randFortuneFrmFile >>= putStrLn;

-- | @randFortuneFrmFile k@ extracts and returns a pseudorandom
-- fortune from @k@.
randFortuneFrmFile :: FilePath -> IO String;
randFortuneFrmFile file = flip nthFortune file <$> randomIO;
