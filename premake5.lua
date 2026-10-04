workspace "TerminalChess"
    configurations { "Debug", "Release" }
    location "build"

project "TerminalChess"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++23"
    toolset "gcc"

    location "build"
    targetdir "build/bin/%{cfg.buildcfg}"
    objdir "build/obj/%{cfg.buildcfg}"

    files { "src/**.cpp", "include/**.h" }
    includedirs { "include", "external/asio/include" }
    defines { "ASIO_STANDALONE" }

    filter "configurations:Debug"
        symbols "On"
        optimize "Off"

    filter "configurations:Release"
        optimize "On"
        defines { "NDEBUG" }

    filter "system:windows"
        links { "ws2_32", "mswsock" }
        defines { "_WIN32_WINNT=0x0A00" }

    filter "system:not windows"
        links { "pthread" }
