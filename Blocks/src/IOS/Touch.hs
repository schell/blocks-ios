{-# LINE 1 "IOS/Touch.hsc" #-}
{-# LANGUAGE ForeignFunctionInterface, TypeSynonymInstances, FlexibleInstances #-}
{-# LINE 2 "IOS/Touch.hsc" #-}
module IOS.Touch where

import Foreign
import Foreign.C
import Data.Vector.Storable
import Control.Applicative


{-# LINE 10 "IOS/Touch.hsc" #-}

data CGPoint = CGPoint { _x :: Float
                       , _y :: Float
                       } deriving (Show, Eq, Ord, Enum)


instance Storable CGPoint where
    sizeOf _ = ((16))
{-# LINE 18 "IOS/Touch.hsc" #-}
    alignment _ = ((8)) 
{-# LINE 19 "IOS/Touch.hsc" #-}
    peek ptr = do
        x <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) ptr
{-# LINE 21 "IOS/Touch.hsc" #-}
        y <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) ptr
{-# LINE 22 "IOS/Touch.hsc" #-}
        return CGPoint x y
    poke ptr (CGPoint x y) = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) ptr x
{-# LINE 25 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 8)) ptr y
{-# LINE 26 "IOS/Touch.hsc" #-}


data IOSTouch = IOSTouch { _iosTouchTimestamp    :: Double
                         , _iosTouchPhase        :: Int
                         , _iosTouchTapCount     :: Int
                         , _iosTouchLocation     :: CGPoint
                         , _iosTouchPrevLocation :: CGPoint
                         } deriving (Show, Eq)


type IOSTouchPtr = Ptr IOSTouch


instance Storable IOSTouch where
    sizeOf _ = ((48))
{-# LINE 41 "IOS/Touch.hsc" #-}
    alignment _ = ((16)) 
{-# LINE 42 "IOS/Touch.hsc" #-}
    peek ptr = do
        t  <- ((\hsc_ptr -> peekByteOff hsc_ptr 0)) ptr
{-# LINE 44 "IOS/Touch.hsc" #-}
        p  <- ((\hsc_ptr -> peekByteOff hsc_ptr 8)) ptr
{-# LINE 45 "IOS/Touch.hsc" #-}
        tc <- ((\hsc_ptr -> peekByteOff hsc_ptr 12)) ptr
{-# LINE 46 "IOS/Touch.hsc" #-}
        l  <- ((\hsc_ptr -> peekByteOff hsc_ptr 16)) ptr 
{-# LINE 47 "IOS/Touch.hsc" #-}
        pl <- ((\hsc_ptr -> peekByteOff hsc_ptr 32)) ptr
{-# LINE 48 "IOS/Touch.hsc" #-}
        return $ IOSTouch t p tc l pl
    poke ptr (IOSTouch t p tc l pl) = do
        ((\hsc_ptr -> pokeByteOff hsc_ptr 0)) ptr t
{-# LINE 51 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 8)) ptr p
{-# LINE 52 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> pokeByteOff hsc_ptr 12)) ptr tc
{-# LINE 53 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> peekByteOff hsc_ptr 16)) ptr l
{-# LINE 54 "IOS/Touch.hsc" #-}
        ((\hsc_ptr -> peekByteOff hsc_ptr 32)) ptr pl
{-# LINE 55 "IOS/Touch.hsc" #-}

