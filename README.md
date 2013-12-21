blocks-ios
==========
This is an attempt to port my tetris clone to the iphone.

building
--------
[First you'll need a cross-compiling GHC that targets iOS(arm)](https://ghc.haskell.org/trac/ghc/wiki/Building/CrossCompiling/iOS)

Currently I'm trying to build the Haskell portion of the project with cabal.

    arm-apple-darwin10-cabal --config-file=path/to/a/new/arm-config build

Then add the resulting `dist-arm/build/Blocks/Blocks.a` to the Xcode project
and build as normal.

I'm running into linking errors currently but should have it figured out over
the holidays.
