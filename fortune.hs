import Data.List.Split;
import System.Environment;
import System.Random;

nthFortune :: Int -> String -> String;
nthFortune n f = g !! (mod n $ length g)
  where g = splitOn "\n%%\n" f

rando :: IO [Int];
rando = newStdGen >>= return . randoms;

main :: IO ();
main = getArgs >>= readFile . (!!0) >>= putStrLn . randomFortuneFrmFile;

-- | @randomFortuneFrmFile k@ extracts and returns a pseudorandom
-- fortune from @k@.
randomFortuneFrmFile :: FilePath -> IO ();
randomFortuneFrmFile file= flip nthFortune file <$> randomIO;
