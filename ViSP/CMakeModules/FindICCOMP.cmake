##
## Copyright Projet Lagadic / IRISA-INRIA Rennes, 2006
## www: http://www.irisa.fr/lagadic
##
## Author: Fabien Spindler email:Fabien.Spindler@irisa.fr
##
## Try to find Irisa's ICcomp framegrabber api 
## Once run this will define: 
##
## ICCOMP_FOUND
## ICCOMP_INCLUDE_DIR
## ICCOMP_LIBRARIES
##

IF(NOT UNIX)
  # MESSAGE("FindICCOMP.cmake: only available for Unix.")
  SET(ICCOMP_FOUND FALSE)
ELSE(NOT UNIX)
  
  FIND_PATH(ICCOMP_INCLUDE_DIR ic-comp2x.h
    $ENV{ICCOMP_HOME}/include
    /udd/fspindle/robot/IC-comp/current/include
    /local/soft/IC-comp/current/include
    )
  #MESSAGE("DBG ICCOMP_INCLUDE_DIR=${ICCOMP_INCLUDE_DIR}")  
  
  FIND_LIBRARY(ICCOMP_LIBRARY
    NAMES iccomp2x fl
    PATHS 
    $ENV{ICCOMP_HOME}/lib
    /udd/fspindle/robot/IC-comp/current/lib
    /local/soft/IC-comp/current/lib
    )
  FIND_LIBRARY(FL_LIBRARY
    NAMES fl
    PATHS 
    /usr/lib
    )
  #MESSAGE("DBG ICCOMP_LIBRARY=${ICCOMP_LIBRARY}")
  
  ## --------------------------------
  
  IF(ICCOMP_LIBRARY AND FL_LIBRARY)
    SET(ICCOMP_LIBRARIES ${ICCOMP_LIBRARY} ${FL_LIBRARY})
  ELSE(ICCOMP_LIBRARY AND FL_LIBRARY)
    MESSAGE(SEND_ERROR "ICcomp library not found.")
  ENDIF(ICCOMP_LIBRARY AND FL_LIBRARY)
  
  IF(NOT ICCOMP_INCLUDE_DIR)
    MESSAGE(SEND_ERROR "ICcomp include dir not found.")
  ENDIF(NOT ICCOMP_INCLUDE_DIR)
  
  IF(ICCOMP_LIBRARIES AND ICCOMP_INCLUDE_DIR)
    SET(ICCOMP_FOUND TRUE)
  ELSE(ICCOMP_LIBRARIES AND ICCOMP_INCLUDE_DIR)
    SET(ICCOMP_FOUND FALSE)
  ENDIF(ICCOMP_LIBRARIES AND ICCOMP_INCLUDE_DIR)
  
  MARK_AS_ADVANCED(
    ICCOMP_INCLUDE_DIR
    ICCOMP_LIBRARIES
    ICCOMP_LIBRARY
    FL_LIBRARY
    )
ENDIF(NOT UNIX)
