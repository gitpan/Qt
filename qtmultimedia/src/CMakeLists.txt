include_directories(
    ${CMAKE_SOURCE_DIR}/generator
    ${CMAKE_SOURCE_DIR}/qtcore/src
    ${PERL_INCLUDE_PATH}
    ${QT_INCLUDES} )

# Run doxsubpp.pl to run xsubpp on QtMultimedia4.xs
add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/QtMultimedia4.c
                   COMMAND ${PERL_EXECUTABLE} ARGS ${CMAKE_SOURCE_DIR}/qtcore/src/doxsubpp.pl ${PERL_EXECUTABLE} QtMultimedia4.xs ${CMAKE_CURRENT_BINARY_DIR}/QtMultimedia4.c
                   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/QtMultimedia4.xs
                   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)
# Make sure we build QtMultimedia4.c as c++ code
set_source_files_properties( ${CMAKE_CURRENT_BINARY_DIR}/QtMultimedia4.c 
    PROPERTIES LANGUAGE CXX
)

set( CMAKE_CXX_FLAGS ${PERL_CXX_FLAGS} )

set(qtmultimedia4_LIBRARY_SRC
    ${CMAKE_CURRENT_BINARY_DIR}/QtMultimedia4.c
    qtmultimedia4handlers.cpp
)

set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/blib/arch/auto/QtMultimedia4)
add_library(perl_qtmultimedia4 MODULE ${qtmultimedia4_LIBRARY_SRC})

target_link_libraries(perl_qtmultimedia4
    ${SMOKE_QTMULTIMEDIA_LIBRARY}
    perlqtcore4)

set_target_properties(perl_qtmultimedia4 PROPERTIES OUTPUT_NAME "QtMultimedia4")
set_target_properties(perl_qtmultimedia4 PROPERTIES PREFIX "")

install(TARGETS perl_qtmultimedia4 DESTINATION ${CUSTOM_PERL_SITE_ARCH_DIR}/auto/QtMultimedia4/)