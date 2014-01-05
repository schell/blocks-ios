{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.Ptr
import Foreign.C.Types
import Foreign.Marshal.Array
import Foreign.Storable
import IOS.Touch

type GetUpdateFunc = (CDouble -> IO ())
type GetTouchesFunc = (CInt -> HTouchPtr -> IO ()) 
type GetTapFunc = (HTouchPtr -> IO ())

-- | Our calls back to C land.
foreign import ccall safe "c_main" c_main :: FunPtr (IO ())
                                          -> FunPtr GetTapFunc
                                          -> FunPtr GetTouchesFunc
                                          -> FunPtr GetTouchesFunc
                                          -> FunPtr GetTouchesFunc
                                          -> FunPtr GetUpdateFunc
                                          -> FunPtr (IO ())
                                          -> IO ()
foreign import ccall safe "addTapRecognizer" addTapRecognizer :: CInt -> CInt -> IO ()
foreign import ccall "wrapper" wrapIO :: IO () -> IO (FunPtr (IO ()))
foreign import ccall "wrapper" wrapTapIO :: GetTapFunc -> IO (FunPtr GetTapFunc)
foreign import ccall "wrapper" wrapDoubleIO :: GetUpdateFunc -> IO (FunPtr GetUpdateFunc)
foreign import ccall "wrapper" wrapTouchesIO :: GetTouchesFunc -> IO (FunPtr GetTouchesFunc)


main :: IO ()
main = do
    putStrLn "Haskell time."
    setup    <- wrapIO setupApp
    tap      <- wrapTapIO tapped
    tbegan   <- wrapTouchesIO beganTouches
    tmoved   <- wrapTouchesIO movedTouches
    tended   <- wrapTouchesIO endedTouches
    update   <- wrapDoubleIO (updateApp . realToFrac)
    tearDown <- wrapIO tearDownApp
    c_main setup tap tbegan tmoved tended update tearDown


setupApp :: IO ()
setupApp = do
    putStrLn "Startup GL."
    addTapRecognizer 2 2


tapped :: GetTapFunc
tapped ptr = peek ptr >>= print


beganTouches :: GetTouchesFunc
beganTouches cint ptr = do
    _ <- peekArray (fromIntegral cint) ptr
    --print a
    return ()


movedTouches :: GetTouchesFunc
movedTouches = beganTouches


endedTouches :: GetTouchesFunc
endedTouches = beganTouches


updateApp :: Double -> IO ()
updateApp = const $ return ()


tearDownApp :: IO ()
tearDownApp = putStrLn "Tear down GL."

