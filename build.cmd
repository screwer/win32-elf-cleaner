@echo off

rem cl /GS /GL /analyze- /W3 /Gy /Zc:wchar_t /Zi /Gm- /O2 /sdl /Zc:inline /fp:precise /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_USING_V110_SDK71_" /D "_UNICODE" /D "UNICODE" /errorReport:prompt /WX- /Zc:forScope /Gd /Oy- /Oi /MT /Fa"Release\" /EHsc /nologo /Fo"Release\" /Fp"Release\android-elf-cleaner.pch" 
rem link /OUT:"C:\Work\Test\android-elf-cleaner\Release\android-elf-cleaner.exe" /MANIFEST /LTCG:incremental /NXCOMPAT /PDB:"C:\Work\Test\android-elf-cleaner\Release\android-elf-cleaner.pdb" /DYNAMICBASE "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /DEBUG /MACHINE:X86 /OPT:REF /SAFESEH /INCREMENTAL:NO /PGD:"C:\Work\Test\android-elf-cleaner\Release\android-elf-cleaner.pgd" /SUBSYSTEM:CONSOLE",5.01" /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /ManifestFile:"Release\android-elf-cleaner.exe.intermediate.manifest" /OPT:ICF /ERRORREPORT:PROMPT /NOLOGO /TLBID:1 

set CL=/GS /GL /analyze- /W3 /Gy /Zc:wchar_t /Zi /Gm- /O2 /sdl /Zc:inline /fp:precise /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /WX- /Zc:forScope /Gd /Oy- /Oi /MT /link /NXCOMPAT /OPT:REF /OPT:ICF /SAFESEH

rem /GS /GL /analyze- /W3 /Gy /Zc:wchar_t /Zi /Gm- /O2 /sdl /Fd"Release\vc140.pdb" /Zc:inline /fp:precise /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_USING_V110_SDK71_" /D "_UNICODE" /D "UNICODE" /errorReport:prompt /WX- /Zc:forScope /Gd /Oy- /Oi /MT /Fa"Release\" /EHsc /nologo /Fo"Release\" /Fp"Release\android-elf-cleaner.pch" 

rem /OUT:"C:\Work\Test\android-elf-cleaner\Release\android-elf-cleaner.exe" /MANIFEST /LTCG:incremental /NXCOMPAT /PDB:"C:\Work\Test\android-elf-cleaner\Release\android-elf-cleaner.pdb" /DYNAMICBASE "kernel32.lib" "user32.lib" "gdi32.lib" "winspool.lib" "comdlg32.lib" "advapi32.lib" "shell32.lib" "ole32.lib" "oleaut32.lib" "uuid.lib" "odbc32.lib" "odbccp32.lib" /DEBUG /MACHINE:X86 /OPT:REF /SAFESEH /INCREMENTAL:NO /PGD:"C:\Work\Test\android-elf-cleaner\Release\android-elf-cleaner.pgd" /SUBSYSTEM:CONSOLE",5.01" /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /ManifestFile:"Release\android-elf-cleaner.exe.intermediate.manifest" /OPT:ICF /ERRORREPORT:PROMPT /NOLOGO /TLBID:1 

if defined LIBPATH (
    cl android-elf-cleaner.cpp w32supp.cpp
) else (
    echo Run build from Visual Studio command promt.
)

rem cl android-elf-cleaner.cpp w32supp.cpp
