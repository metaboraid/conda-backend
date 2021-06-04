outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir
mkdir -p $outdir/bin
mkdir -p $outdir/lib
mkdir -p $outdir/chemdistiller
mkdir -p $PREFIX/bin

SHORT_OS_STR=$(uname -s)


if [ "${SHORT_OS_STR:0:5}" == "Linux" ]; then
  cp -a lib/. $outdir/lib
  cp -r bin/sirius $outdir/bin/sirius
  chmod +x $outdir/bin/sirius
  ln -s $outdir/bin/sirius $PREFIX/bin
fi
if [ "${SHORT_OS_STR}" == "Darwin" ]; then

    mkdir -p $outdir/sirius
    cp -r Contents $outdir/sirius

    chmod +x $outdir/sirius/Contents/MacOS/sirius
    rm $outdir/sirius/Contents/runtime/Contents/Home/lib/libjava.dylib
    cat $outdir/sirius/Contents/MacOS/sirius | awk '{gsub(/\$APP_HOME\/runtime\/Contents\/Home\/lib\:/,"")}1' | awk '{gsub(/\$JAVACMD/,"java")}1' > $outdir/sirius/Contents/MacOS/tmp && mv $outdir/sirius/Contents/MacOS/tmp $outdir/sirius/Contents/MacOS/sirius
    chmod +x $outdir/sirius/Contents/MacOS/sirius
    ln -s $outdir/sirius/Contents/MacOS/sirius  $PREFIX/bin

fi

cp metfrag.jar $PREFIX/bin
cp jni-inchi-0.8.jar $PREFIX/bin

cp metfrag.jar $outdir
cp jni-inchi-0.8.jar $outdir


cp $RECIPE_DIR/metfrag.py $outdir/metfrag
ln -s $outdir/metfrag $PREFIX/bin
chmod 0755 "${PREFIX}/bin/metfrag"

cp -r chemdistiller/. $outdir/chemdistiller
ln -s $outdir/chemdistiller/annotate.py $PREFIX/bin/annotate_ch
ln -s $outdir/chemdistiller/MGF2ChemDistiller.py $PREFIX/bin/mgf_convert



chmod +x $PREFIX/bin/annotate_ch
chmod +x $PREFIX/bin/mgf_convert
