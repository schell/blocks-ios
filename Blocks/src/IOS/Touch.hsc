{-# LANGUAGE ForeignFunctionInterface #-}
module IOS.Touch where

import Foreign
import Foreign.C
import Data.Vector.Storable

#include "TouchHS.h"

data IOSTouch = IOSTouch { _iostPhase     :: Int
                         , _iostTapCount  :: Int
                         , _iostTimestamp :: Double
                         , _iostLocX      :: Float
                         , _iostLocY      :: Float
                         } deriving (Show, Eq)


type IOSTouchPtr = Ptr (IOSTouch)


