{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_purescript (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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
version = Version [0,15,11] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/georgejames/juspay/purescript/.stack-work/install/x86_64-osx/801b62dafbe94b16a404af8c17ad2bbde6804483b768cdcff3913443ca08bec8/9.2.5/bin"
libdir     = "/Users/georgejames/juspay/purescript/.stack-work/install/x86_64-osx/801b62dafbe94b16a404af8c17ad2bbde6804483b768cdcff3913443ca08bec8/9.2.5/lib/x86_64-osx-ghc-9.2.5/purescript-0.15.11-E1zwnLPLLvFDhnKx7k0ts4"
dynlibdir  = "/Users/georgejames/juspay/purescript/.stack-work/install/x86_64-osx/801b62dafbe94b16a404af8c17ad2bbde6804483b768cdcff3913443ca08bec8/9.2.5/lib/x86_64-osx-ghc-9.2.5"
datadir    = "/Users/georgejames/juspay/purescript/.stack-work/install/x86_64-osx/801b62dafbe94b16a404af8c17ad2bbde6804483b768cdcff3913443ca08bec8/9.2.5/share/x86_64-osx-ghc-9.2.5/purescript-0.15.11"
libexecdir = "/Users/georgejames/juspay/purescript/.stack-work/install/x86_64-osx/801b62dafbe94b16a404af8c17ad2bbde6804483b768cdcff3913443ca08bec8/9.2.5/libexec/x86_64-osx-ghc-9.2.5/purescript-0.15.11"
sysconfdir = "/Users/georgejames/juspay/purescript/.stack-work/install/x86_64-osx/801b62dafbe94b16a404af8c17ad2bbde6804483b768cdcff3913443ca08bec8/9.2.5/etc"

getBinDir     = catchIO (getEnv "purescript_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "purescript_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "purescript_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "purescript_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "purescript_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "purescript_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
