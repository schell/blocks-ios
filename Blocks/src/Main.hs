{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.Ptr
import Foreign.C.Types
import IOS.Touch

type GetUpdateFunc = (CDouble -> IO ())
type GetTapFunc = (IOSTouchPtr -> IO ())

-- | Our calls back to C land.
foreign import ccall safe "c_main" c_main :: FunPtr (IO ())
                                          -> FunPtr GetTapFunc
                                          -> FunPtr GetUpdateFunc
                                          -> FunPtr (IO ())
                                          -> IO ()
foreign import ccall "wrapper" wrapIO :: IO () -> IO (FunPtr (IO ()))
foreign import ccall "wrapper" wrapDoubleIO :: GetUpdateFunc -> IO (FunPtr GetUpdateFunc)
foreign import ccall "wrapper" wrapTapIO :: GetTapFunc -> IO (FunPtr GetTapFunc)


data Tap = Tap { _tapTouchesReq :: Int
               , _tapTapsReq    :: Int
               , _tapLoc        :: (Double, Double)
               } deriving (Show, Eq)

main :: IO ()
main = do
    putStrLn "Haskell time."
    setup    <- wrapIO setupApp
    input    <- wrapTapIO inputApp
    update   <- wrapDoubleIO (updateApp . realToFrac)
    tearDown <- wrapIO tearDownApp
    c_main setup input update tearDown


setupApp :: IO ()
setupApp = putStrLn "Startup GL."


inputApp :: GetTapFunc
inputApp = print





updateApp :: Double -> IO ()
updateApp = const $ return ()


tearDownApp :: IO ()
tearDownApp = putStrLn "Tear down GL."

