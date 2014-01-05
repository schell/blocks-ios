{-# LANGUAGE ForeignFunctionInterface, TypeSynonymInstances, FlexibleInstances #-}
module IOS.Touch where

import Foreign
import Foreign.C
import Data.Vector.Storable
import Control.Applicative

#include "TouchHS.h"

type Point = (Float, Float)


instance Storable Point where
    sizeOf _ = (#size hpoint)
    alignment _ = alignment (undefined :: CFloat)
    peek ptr = do
        x <- (#peek hpoint, x) ptr
        y <- (#peek hpoint, y) ptr
        return (x, y)
    poke ptr (x, y) = do
        (#poke hpoint, x) ptr x
        (#poke hpoint, y) ptr y


data HTouch = HTouch { _hTouchTimestamp    :: Double
                     , _hTouchPhase        :: Int
                     , _hTouchTapCount     :: Int
                     , _hTouchLocation     :: Point
                     , _hTouchPrevLocation :: Point
                     } deriving (Show, Eq)


type HTouchPtr = Ptr HTouch


instance Storable HTouch where
    sizeOf _ = (#size htouch)
    alignment _ = alignment (undefined :: CDouble)
    peek ptr = do
        t  <- (#peek htouch, timestamp) ptr
        p  <- (#peek htouch, phase) ptr
        tc <- (#peek htouch, tapCount) ptr
        l  <- (#peek htouch, loc) ptr :: IO Point
        pl <- (#peek htouch, prevLoc) ptr :: IO Point
        return $ HTouch t p tc l pl
    poke ptr (HTouch t p tc l pl) = do
        (#poke htouch, timestamp) ptr t
        (#poke htouch, phase) ptr p
        (#poke htouch, tapCount) ptr tc
        (#poke htouch, loc) ptr l
        (#poke htouch, prevLoc) ptr pl

