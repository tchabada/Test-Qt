find_package(Qt5Widgets REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

add_executable(example main.cpp example.cpp)
target_link_libraries(example project_warnings project_options Qt5::Widgets)
