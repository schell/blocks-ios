{-# LINE 1 "IOS/Touch.hsc" #-}
{-# LANGUAGE ForeignFunctionInterface, TypeSynonymInstances, FlexibleInstances #-}
{-# LINE 2 "IOS/Touch.hsc" #-}
module IOS.Touch where

import Foreign
import Foreign.C
import Data.Vector.Storable
import Control.Applicative


{-# LINE 10 "IOS/Touch.hsc" #-}

type Point = (Float, Float)


instance Storable Point where
    sizeOf _ = ((8))
{-# LINE 16 "IOS/Touch.hsc" #-}
    alignment _ = alignment (undefined :: CFloat)
    peek ptr = do
        x <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) ptr
{-# LINE 19 "IOS/Touch.hsc" #-}
        y <- ((\hsc_ptr -> peekByteOff hsc_ptr 4)) ptr
{-# LINE 20 "IOS/Touch.hsc" #-}
        return (x, y)
    poke ptr (x, y) = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) ptr x
{-# LINE 23 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 4)) ptr y
{-# LINE 24 "IOS/Touch.hsc" #-}


data HTouch = HTouch { _hTouchTimestamp    :: Double
                     , _hTouchPhase        :: Int
                     , _hTouchTapCount     :: Int
                     , _hTouchLocation     :: Point
                     , _hTouchPrevLocation :: Point
                     } deriving (Show, Eq)


type HTouchPtr = Ptr HTouch


instance Storable HTouch where
    sizeOf _ = ((32))
{-# LINE 39 "IOS/Touch.hsc" #-}
    alignment _ = alignment (undefined :: CDouble)
    peek ptr = do
        t  <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) ptr
{-# LINE 42 "IOS/Touch.hsc" #-}
        p  <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) ptr
{-# LINE 43 "IOS/Touch.hsc" #-}
        tc <- ((\hsc_ptr -> peekByteOff hsc_ptr 12)) ptr
{-# LINE 44 "IOS/Touch.hsc" #-}
        l  <- ((\hsc_ptr -> peekByteOff hsc_ptr 16)) ptr :: IO Point
{-# LINE 45 "IOS/Touch.hsc" #-}
        pl <- ((\hsc_ptr -> peekByteOff hsc_ptr 24)) ptr :: IO Point
{-# LINE 46 "IOS/Touch.hsc" #-}
        return $ HTouch t p tc l pl
    poke ptr (HTouch t p tc l pl) = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) ptr t
{-# LINE 49 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 8)) ptr p
{-# LINE 50 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 12)) ptr tc
{-# LINE 51 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 16)) ptr l
{-# LINE 52 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 24)) ptr pl
{-# LINE 53 "IOS/Touch.hsc" #-}

