{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_fp_translator (
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

bindir     = "/home/severuscat/.cabal/bin"
libdir     = "/home/severuscat/.cabal/lib/x86_64-linux-ghc-8.0.2/fp-translator-0.1.0.0-IkK3Mn3MvTD6c2juUv1K9S"
dynlibdir  = "/home/severuscat/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/severuscat/.cabal/share/x86_64-linux-ghc-8.0.2/fp-translator-0.1.0.0"
libexecdir = "/home/severuscat/.cabal/libexec"
sysconfdir = "/home/severuscat/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "fp_translator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "fp_translator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "fp_translator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "fp_translator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "fp_translator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "fp_translator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
