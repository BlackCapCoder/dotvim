syntax keyword typescriptGlobal console nextgroup=typescriptGlobalconsoleDot,typescriptFuncCallArg
syntax match   typescriptGlobalconsoleDot /\./ contained nextgroup=typescriptConsoleStaticMethod
syntax keyword typescriptConsoleStaticMethod contained count dir error group groupCollapsed nextgroup=typescriptFuncCallArg
syntax keyword typescriptConsoleStaticMethod contained groupEnd info log time timeEnd nextgroup=typescriptFuncCallArg
syntax keyword typescriptConsoleStaticMethod contained trace warn nextgroup=typescriptFuncCallArg
if exists("did_typescript_hilink") | HiLink typescriptConsoleStaticMethod Keyword
endif