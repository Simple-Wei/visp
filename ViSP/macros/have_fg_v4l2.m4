dnl Calls HAVE_FG_V4L2 (contained in this file) as a subroutine.
AC_DEFUN([HAVE_FG_V4L2],
[
#-----------------------------------------------------------------------
# check if video 4 Linux 2 is reachable
AC_MSG_CHECKING(whether Video For Linux Two api works)
AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include </usr/src/linux/include/linux/videodev2.h>]])],[have_include_videodev2=yes],[have_include_videodev2=no])

if test "x$have_include_videodev2" = "xyes"; then
  AC_DEFINE(VISP_HAVE_V4L2, 1, 
    [Define to 1 if the include linux/videodev2.h for Video4Linux2 acquisition is available])
  AC_MSG_RESULT(yes)
  CXXFLAGS="-I/usr/src/linux/include $CXXFLAGS"
else
  AC_MSG_RESULT(no)
fi
])
