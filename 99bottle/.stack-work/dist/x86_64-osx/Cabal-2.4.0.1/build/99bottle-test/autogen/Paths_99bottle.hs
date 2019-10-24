{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_99bottle (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3de7eddd3a6f77a3602a6508b2e59da96df157e75e16f777ad3fbd45da99b297/8.6.5/bin"
libdir     = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3de7eddd3a6f77a3602a6508b2e59da96df157e75e16f777ad3fbd45da99b297/8.6.5/lib/x86_64-osx-ghc-8.6.5/99bottle-0.1.0.0-6PALakT3BvqJ5FSsEkxCwH-99bottle-test"
dynlibdir  = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3de7eddd3a6f77a3602a6508b2e59da96df157e75e16f777ad3fbd45da99b297/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3de7eddd3a6f77a3602a6508b2e59da96df157e75e16f777ad3fbd45da99b297/8.6.5/share/x86_64-osx-ghc-8.6.5/99bottle-0.1.0.0"
libexecdir = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3de7eddd3a6f77a3602a6508b2e59da96df157e75e16f777ad3fbd45da99b297/8.6.5/libexec/x86_64-osx-ghc-8.6.5/99bottle-0.1.0.0"
sysconfdir = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3de7eddd3a6f77a3602a6508b2e59da96df157e75e16f777ad3fbd45da99b297/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "99bottle_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "99bottle_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "99bottle_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "99bottle_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "99bottle_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "99bottle_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
