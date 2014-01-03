{-# LANGUAGE ForeignFunctionInterface, TypeSynonymInstances, FlexibleInstances #-}
module IOS.Touch where

import Foreign
import Foreign.C
import Data.Vector.Storable
import Control.Applicative

#include "TouchHS.h"

data CGPoint = CGPoint { _x :: Float
                       , _y :: Float
                       } deriving (Show, Eq, Ord, Enum)


instance Storable CGPoint where
    sizeOf _ = (#size CGPoint)
    alignment _ = (#size CGFloat) 
    peek ptr = do
        x <- (#peek CGPoint, x) ptr
        y <- (#peek CGPoint, y) ptr
        return CGPoint x y
    poke ptr (CGPoint x y) = do
        (#poke CGPoint, x) ptr x
        (#poke CGPoint, y) ptr y


data IOSTouch = IOSTouch { _iosTouchTimestamp    :: Double
                         , _iosTouchPhase        :: Int
                         , _iosTouchTapCount     :: Int
                         , _iosTouchLocation     :: CGPoint
                         , _iosTouchPrevLocation :: CGPoint
                         } deriving (Show, Eq)


type IOSTouchPtr = Ptr IOSTouch


instance Storable IOSTouch where
    sizeOf _ = (#size iostouch)
    alignment _ = (#size CGPoint) 
    peek ptr = do
        t  <- (#peek iostouch, timestamp) ptr
        p  <- (#peek iostouch, phase) ptr
        tc <- (#peek iostouch, tapCount) ptr
        l  <- (#peek iostouch, loc) ptr 
        pl <- (#peek iostouch, prevLoc) ptr
        return $ IOSTouch t p tc l pl
    poke ptr (IOSTouch t p tc l pl) = do
        (#poke iostouch, timestamp) ptr t
        (#poke iostouch, phase) ptr p
        (#poke iostouch, tapCount) ptr tc
        (#peek iostouch, loc) ptr l
        (#peek iostouch, prevLoc) ptr pl

