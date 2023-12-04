module Main where
import Data.Char (isDigit, isSpace, toLower)
import Data.List (isPrefixOf)

firstAndLast :: String -> String
firstAndLast str = do
    let digits = filter isDigit str
    case digits of
        [] -> "Nothing"
        _ -> [head digits, last digits]


main :: IO ()
main = do
    -- Get file name from the user
    putStrLn "Enter a string: "
    fileName <- getLine
    -- Read file
    fileContents <- readFile fileName
    -- Iterate over each line
    let linesOfFile = lines fileContents
    let firstAndLasts = map firstAndLast linesOfFile
    let validFirstAndLasts = filter (\x -> x /= "Nothing") firstAndLasts
    -- print out the validFirstAndLasts
    putStrLn $ "Valid first and last digits: " ++ show validFirstAndLasts
    let sumOfFirstAndLasts = sum $ map (\x -> read x :: Int) validFirstAndLasts
    putStrLn $ "Sum: " ++ show sumOfFirstAndLasts