import System.IO
import Foreign.Marshal.Alloc (allocaBytes)

main = do
    withBinaryFile "../data" ReadMode $ \handle ->
      allocaBytes bufSize $ \buf -> do
        let go = do
              n <- hGetBuf handle buf bufSize
              hPutBuf stdout buf n
              if n < bufSize
                then pure ()
                else go
        hSetBuffering handle $ NoBuffering
        go
  where bufSize = 2 ^ 17
