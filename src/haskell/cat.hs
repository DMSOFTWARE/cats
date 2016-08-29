import System.IO
import qualified Data.ByteString as BS

main = do
    withBinaryFile "../data" ReadMode $ \handle -> do
        let bufSize = 2 ^ 17
            go = do
                block <- BS.hGet handle bufSize
                BS.hPut stdout block
                if BS.null block
                then pure ()
                else go
        hSetBuffering handle $ BlockBuffering (Just bufSize)
        go