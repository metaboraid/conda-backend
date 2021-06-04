set outdir=%LIBRARY_PREFIX%\share\%PKG_NAME%-%PKG_VERSION%-%PKG_BUILDNUM%

mkdir %outdir%
mkdir %outdir%\chemdistiller
mkdir %PREFIX%\Scripts
xcopy /s /e metfrag.jar %outdir%
copy %RECIPE_DIR%\metfrag.py %outdir%\metfrag

mklink /h %PREFIX%\Scripts\metfrag.jar %outdir%\metfrag.jar
mklink /h %PREFIX%\Scripts\metfrag %outdir%\metfrag


xcopy /s /e  chemdistiller\ %PREFIX%\Scripts\


move /y %PREFIX%\Scripts\annotate.py %PREFIX%\Scripts\annotate

move /y %PREFIX%\Scripts\MGF2ChemDistiller.py %PREFIX%\Scripts\MGF2ChemDistiller

mklink /h %PREFIX%\Scripts\annotate_ch %PREFIX%\Scripts\annotate
mklink /h %PREFIX%\Scripts\mgf_convert %PREFIX%\Scripts\MGF2ChemDistiller



Xcopy /E /I *.* %LIBRARY_BIN%
