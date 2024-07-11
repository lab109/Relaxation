cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

project(project_name LANGUAGES Fortran)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(CMAKE_EXPORT_COMPILE_COMMANDS)
endif()

# =============================================

# Список таргетов проекта ...

# =============================================

target_include_directories(
  PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/source>
         $<INSTALL_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/source>)

# =============================================

set_target_properties(
  PROPERTIES Fortran_STANDARD 2018
             Fortran_STANDARD_REQUIRED on
             Fortran_EXTENSIONS off)

# =============================================

# Подключение директории с исходным файлом
add_subdirectory(source)
