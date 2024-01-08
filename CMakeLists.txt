cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME "QtQuickDemo")
project(${PROJECT_NAME} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

#set(CMAKE_PREFIX_PATH "C:/App/Qt/Qt6/6.4.3/msvc2019_64")

#导入Qt相关依赖包
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Gui Multimedia Quick Svg Network )
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Gui Multimedia Quick Svg Network )

#find_package(Qt6 COMPONENTS Core Quick REQUIRED)

#check version，上面的find_package必须酱紫写，且必须写成一行，不然${QT_VERSION}无法识别
message(STATUS "[${PROJECT_NAME}] Qt version: ${QT_VERSION}   QT_VERSION_MAJOR: ${QT_VERSION_MAJOR}.${QT_VERSION_MINOR}")

add_executable(${PROJECT_NAME} src/main.cpp
        src/MyTest.h
        src/MySingleTest.cpp
        src/MySingleTest.h)



if(QT_VERSION VERSION_GREATER_EQUAL "6.2")

    #导入exmaple的QML位置，不然import example有时候会爆红
    set(QML_IMPORT_PATH ${CMAKE_BINARY_DIR}/test CACHE STRING "Qt Creator extra QML import paths" FORCE)
    message("QML_IMPORT_PATH:"  ${QML_IMPORT_PATH})


    #遍历所有qml文件
    file(GLOB_RECURSE QML_PATHS "*.qml")
    foreach(filepath ${QML_PATHS})
        message("add qml file: " ${filepath})
        string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath}) #.+/(.+)\\\\..*" "\\\\1
        list(APPEND qml_files ${filename})
    endforeach(filepath)
    list(REMOVE_DUPLICATES qml_files) #表示删除非第一个重名值


    #遍历所有资源文件
    file(GLOB_RECURSE RES_PATHS *.png *.jpg  *.gif *.svg *.ico *.ttf *.webp)
    foreach(filepath ${RES_PATHS})
        message("add res file: " ${filepath})
        string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
        list(APPEND resource_files ${filename})
    endforeach(filepath)

    #如果是Qt6.2以上，则使用qt_add_qml_module添加资源文件
    #如果是Qt6.2以下，则使用qrc添加资源文件
    qt_add_qml_module(${PROJECT_NAME}
            URI test
            VERSION 1.0
            QML_FILES ${qml_files}
            RESOURCES ${resource_files}
            RESOURCE_PREFIX "/"
    )

endif()


#qt_add_qml_module(${PROJECT_NAME}
#        URI test
#        VERSION 1.0
#        QML_FILES qml/toast.qml
#)


target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt${QT_VERSION_MAJOR}::Core
        Qt${QT_VERSION_MAJOR}::Gui
        Qt${QT_VERSION_MAJOR}::Quick
        Qt${QT_VERSION_MAJOR}::Svg
        Qt${QT_VERSION_MAJOR}::Multimedia
        Qt${QT_VERSION_MAJOR}::Network
)

#target_link_libraries(${PROJECT_NAME}
#        PRIVATE
#        Qt6::Core
#        Qt6::Quick
#)


#
#if (WIN32 AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
#    set(DEBUG_SUFFIX)
#    if (MSVC AND CMAKE_BUILD_TYPE MATCHES "Debug")
#        set(DEBUG_SUFFIX "d")
#    endif ()
#    set(QT_INSTALL_PATH "${CMAKE_PREFIX_PATH}")
#    if (NOT EXISTS "${QT_INSTALL_PATH}/bin")
#        set(QT_INSTALL_PATH "${QT_INSTALL_PATH}/..")
#        if (NOT EXISTS "${QT_INSTALL_PATH}/bin")
#            set(QT_INSTALL_PATH "${QT_INSTALL_PATH}/..")
#        endif ()
#    endif ()
#    if (EXISTS "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll")
#        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
#                COMMAND ${CMAKE_COMMAND} -E make_directory
#                "$<TARGET_FILE_DIR:${PROJECT_NAME}>/plugins/platforms/")
#        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
#                COMMAND ${CMAKE_COMMAND} -E copy
#                "${QT_INSTALL_PATH}/plugins/platforms/qwindows${DEBUG_SUFFIX}.dll"
#                "$<TARGET_FILE_DIR:${PROJECT_NAME}>/plugins/platforms/")
#    endif ()
#    foreach (QT_LIB Core Gui Widgets)
#        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
#                COMMAND ${CMAKE_COMMAND} -E copy
#                "${QT_INSTALL_PATH}/bin/Qt6${QT_LIB}${DEBUG_SUFFIX}.dll"
#                "$<TARGET_FILE_DIR:${PROJECT_NAME}>")
#    endforeach (QT_LIB)
#endif ()
