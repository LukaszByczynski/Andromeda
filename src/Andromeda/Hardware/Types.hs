module Andromeda.Hardware.Types where

import qualified Data.ByteString.Char8 as BS

type PhysicalAddress = BS.ByteString
type ComponentIndex = BS.ByteString



-- TODO: tagged:
-- type ComponentInstanceIndex tag = (PhysicalAddress, ComponentIndex)
type ComponentInstanceIndex = (PhysicalAddress, ComponentIndex)



