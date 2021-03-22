project "glslang"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "glslang/**.h",
        "glslang/**.cpp",
        "SPIRV/**.h",
        "SPIRV/**.cpp",
	}
    excludes
    {
        "glslang/OSDependent/Windows/**.cpp",
        "glslang/OSDependent/Web/**.cpp",
        "glslang/OSDependent/Unix/**.cpp",
        "glslang/HLSL/**.cpp",
        "glslang/HLSL/**.h",

    }

    includedirs
    {
        "%{prj.location}",
    }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

        files
        {
            "glslang/OSDependent/Windows/**.cpp",
            "OGLCompilersDLL/InitializeDll.cpp",
        }
        includedirs
        {
            "OGLCompilersDLL/",
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"