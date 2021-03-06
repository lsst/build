packageName('m4_PACKAGE-m4_VERSION')
m4_ifdef([m4_ABOUTURL], description('m4_PACKAGE','m4_ABOUTURL'))m4_dnl

m4_define([m4_PKGURL],m4_BASEURL)m4_dnl
m4_define([m4_CACHE],m4_BASEURL/pm)m4_dnl
m4_ifdef([m4_PKGPATH], [], [m4_define([m4_PKGPATH],m4_PACKAGE/m4_VERSION)m4_dnl ])m4_dnl
version('m4_VERSION')
m4_ifdef([m4_TAG], tag('m4_TAG'))m4_dnl

envIsSet('EUPS_PATH')
setenvShellTemp('EUPS_FLAVOR', 'if [[ -n "$EUPS_FLAVOR" ]]; then echo $EUPS_FLAVOR; else eups flavor; fi')

setenvTemp('LSST_HOME', '$PWD')
setenvTemp('LSST_BUILD', '$LSST_HOME/external/build')
shell('mkdir -p $LSST_BUILD')

m4_define([m4_ENSURE_SCONS], setenvShellTemp('SCONSUTILS_DIR', 'export SHELL=sh; source $EUPS_DIR/bin/setups.sh; setup scons; echo $SCONSUTILS_DIR')
envIsSet('SCONSUTILS_DIR')
echo('Using SCONSUTILS_DIR=$SCONSUTILS_DIR')
shell('[[[ -d "$SCONSUTILS_DIR" ]]]'))m4_dnl
m4_define([m4_SCONS_BUILD], shell('export SHELL=sh; source $EUPS_DIR/bin/setups.sh; setup build; setup -M ups/m4_PACKAGE.table; scons install'))m4_dnl
