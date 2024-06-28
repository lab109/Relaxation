cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

project(project_name LANGUAGES CXX)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(CMAKE_EXPORT_COMPILE_COMMANDS)
endif()

# =============================================

# Список таргетов проекта ...


# =============================================

set_target_properties(
  PROPERTIES CXX_STANDARD 20
             CXX_STANDARD_REQUIRED on
             CXX_EXTENSIONS off)

# =============================================

# Подключение директории с исходным файлом
add_subdirectory(source)
