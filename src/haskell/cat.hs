import System.IO

main = do
    withBinaryFile "../data" ReadMode (\handle -> do
        -- hSetBuffering handle $ NoBuffering
        -- hSetBuffering handle $ BlockBuffering Nothing
        hSetBuffering handle $ BlockBuffering (Just (2 ^ 17))
        contents <- hGetContents handle
        putStr contents)
