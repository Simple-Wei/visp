##
## Copyright Projet Lagadic / IRISA-INRIA Rennes, 2006
## www: http://www.irisa.fr/lagadic
##
## Author: Fabien Spindler email:Fabien.Spindler@irisa.fr
##
## Try to find libraries for Irisa's Ptu-46 pan-tilt head
## Once run this will define: 
##
## PTU46_FOUND
## PTU46_INCLUDE_DIR
## PTU46_LIBRARIES

IF(NOT UNIX)
  # MESSAGE("FindPTU46.cmake: Ptu-46 only available for Unix.")
  SET(PTU46_FOUND FALSE)
ELSE(NOT UNIX)
  
  FIND_PATH(PTU46_INCLUDE_DIR ptu.h
    $ENV{PTU46_HOME}/include
    /udd/fspindle/robot/Ptu-Evi/current/include
    /local/soft/Ptu-Evi/current/include
    )
  #MESSAGE("DBG PTU46_INCLUDE_DIR=${PTU46_INCLUDE_DIR}")  
  
  FIND_LIBRARY(PTUPTU46_LIBRARY
    NAMES ptu
    PATHS 
    $ENV{PTU46_HOME}/lib
    /udd/fspindle/robot/Ptu-Evi/current/lib
    /local/soft/Ptu-Evi/current/lib
    )
  FIND_LIBRARY(EVIPTU46_LIBRARY
    NAMES evi
    PATHS 
    $ENV{PTU46_HOME}/lib
    /udd/fspindle/robot/Ptu-Evi/current/lib
    /local/soft/Ptu-Evi/current/lib
    )
  FIND_LIBRARY(SERIALPTU46_LIBRARY
    NAMES serial
    PATHS 
    $ENV{PTU46_HOME}/lib
    /udd/fspindle/robot/Ptu-Evi/current/lib
    /local/soft/Ptu-Evi/current/lib
    )
  #MESSAGE("DBG PTU46_LIBRARY=${PTU46_LIBRARY}")
  
  ## --------------------------------
  
  IF(PTUPTU46_LIBRARY AND EVIPTU46_LIBRARY AND SERIALPTU46_LIBRARY)
    SET(PTU46_LIBRARIES ${PTUPTU46_LIBRARY} ${EVIPTU46_LIBRARY} 
      ${SERIALPTU46_LIBRARY})
  ELSE(PTUPTU46_LIBRARY AND EVIPTU46_LIBRARY AND SERIALPTU46_LIBRARY)
    MESSAGE(SEND_ERROR "Ptu-46 library not found.")
  ENDIF(PTUPTU46_LIBRARY AND EVIPTU46_LIBRARY AND SERIALPTU46_LIBRARY)
  
  IF(NOT PTU46_INCLUDE_DIR)
    MESSAGE(SEND_ERROR "Ptu-46 include dir not found.")
  ENDIF(NOT PTU46_INCLUDE_DIR)
  
  IF(PTU46_LIBRARIES AND PTU46_INCLUDE_DIR)
    SET(PTU46_FOUND TRUE)
  ELSE(PTU46_LIBRARIES AND PTU46_INCLUDE_DIR)
    SET(PTU46_FOUND FALSE)
  ENDIF(PTU46_LIBRARIES AND PTU46_INCLUDE_DIR)
  
  MARK_AS_ADVANCED(
    PTU46_INCLUDE_DIR
    PTU46_LIBRARIES
    PTUPTU46_LIBRARY
    EVIPTU46_LIBRARY
    SERIALPTU46_LIBRARY
    )
ENDIF(NOT UNIX)
