macro(GroupSources curdir)
    file(GLOB children RELATIVE ${CMAKE_SOURCE_DIR}/${curdir}
            ${CMAKE_SOURCE_DIR}/${curdir}/*
            )
    # message(STATUS "curdir = ${curdir}")
    # message(STATUS "source_dir = ${CMAKE_SOURCE_DIR}")
    # message(STATUS "children = ${children}")
    foreach (child ${children})
        if (IS_DIRECTORY ${CMAKE_SOURCE_DIR}/${curdir}/${child})
            GroupSources(${curdir}/${child})
        else ()
            if (${child} MATCHES ".hpp$" OR
                    ${child} MATCHES ".cpp$" OR
                    ${child} MATCHES ".c$" OR
                    ${child} MATCHES ".h$")
                string(REPLACE "/" "\\" groupname ${curdir})
                # I would like to call the src root folder in a different name, only in visual studio (not mandatory requirement)
                # string(REPLACE "core" "Common" groupname ${groupname})
                # message(STATUS "source_group ${groupname} - ${CMAKE_SOURCE_DIR}/${curdir}/${child}")
                source_group(${groupname} FILES
                        ${CMAKE_SOURCE_DIR}/${curdir}/${child})
            endif ()
        endif ()
    endforeach ()
endmacro()