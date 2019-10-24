{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
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

bindir     = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3edeea4023e31684d5302826c203befde0a29d5332e764cca34c8107341e9de1/8.0.2/bin"
libdir     = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3edeea4023e31684d5302826c203befde0a29d5332e764cca34c8107341e9de1/8.0.2/lib/x86_64-osx-ghc-8.0.2/99bottle-0.1.0.0-J5DunXNGT9FGv25ccohq2Q"
dynlibdir  = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3edeea4023e31684d5302826c203befde0a29d5332e764cca34c8107341e9de1/8.0.2/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3edeea4023e31684d5302826c203befde0a29d5332e764cca34c8107341e9de1/8.0.2/share/x86_64-osx-ghc-8.0.2/99bottle-0.1.0.0"
libexecdir = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3edeea4023e31684d5302826c203befde0a29d5332e764cca34c8107341e9de1/8.0.2/libexec"
sysconfdir = "/Users/sdangelillo/Personal/haskell/99bottle/.stack-work/install/x86_64-osx/3edeea4023e31684d5302826c203befde0a29d5332e764cca34c8107341e9de1/8.0.2/etc"

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
