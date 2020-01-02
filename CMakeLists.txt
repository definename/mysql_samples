cmake_minimum_required(VERSION 3.11.4)

project(mysql_samples)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

option(BUILD_WITH_MYSQL_CONNECTOR_C616 "Build with mysql connector c version 6.1.6" OFF)
option(BUILD_WITH_MYSQL_CONNECTOR_C6111 "Build with mysql connector c version 6.1.11" ON)

include(ExternalProject)
include(PCHSupport)
include(CRTLinkage)

# Executable output
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
# External directory
set(EXTERNAL_PATH ${CMAKE_SOURCE_DIR}/external)
# Patch directory
set(PATCH_PATH ${EXTERNAL_PATH}/patches)
# External install directory
set(EXTERNAL_INSTALL_PATH ${CMAKE_BINARY_DIR}/external)
# MYSQL connector C root
set(MYSQL_CONNECTOR_ROOT ${EXTERNAL_INSTALL_PATH}/MYSQL_CONNECTOR_C)

############################################################
# This version works up to Visual Studio 2013 ##############

if(BUILD_WITH_MYSQL_CONNECTOR_C616)
	ExternalProject_Add(
		mysql_connector_c
		URL "${EXTERNAL_PATH}/mysql-connector-c-6.1.6.zip"
		URL_MD5 4A380EB34990DD0E1D5AE16AF71D2D54
		CMAKE_ARGS
			-DCMAKE_INSTALL_PREFIX:PATH=${MYSQL_CONNECTOR_ROOT}
		)
endif()

############################################################
# This version works since Visual Studio 2017 ##############

if(BUILD_WITH_MYSQL_CONNECTOR_C6111)
	ExternalProject_Add(
		mysql_connector_c
		URL "${EXTERNAL_PATH}/mysql-connector-c-6.1.11.zip"
		URL_MD5 62de01beffc48348708c983a585b4dc1
		CMAKE_ARGS
			-DCMAKE_INSTALL_PREFIX:PATH=${MYSQL_CONNECTOR_ROOT}
		)
endif()

set(MYSQL_INCLUDE_DIR ${MYSQL_CONNECTOR_ROOT}/include)
set(MYSQL_LIBRARIES	${MYSQL_CONNECTOR_ROOT}/lib/libmysql.lib)
set(MYSQL_BINARY_FILENAME libmysql.dll)
set(MYSQL_BINARIES ${MYSQL_CONNECTOR_ROOT}/lib/${MYSQL_BINARY_FILENAME})

SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)
SET_PROPERTY(TARGET mysql_connector_c PROPERTY FOLDER "External")

add_subdirectory(modules/mysql_test)