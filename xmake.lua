add_rules("mode.debug", "mode.release")
target("cspice")
    set_kind("shared")
    add_files("src/cspice/**.c")
    add_headerfiles("include/*.h|f2c.h")
    add_includedirs("include", {public = true})
    if is_plat("windows", "mingw") then
        add_defines("MSDOS", "USE_CLOCK", "NO_ONEXIT", "NO_My_ctype", "NO_ISATTY")
        add_defines("_COMPLEX_DEFINED", "NON_ANSI_STDIO", "OMIT_BLANK_CC")
    end
    if is_plat("mingw") then 
        set_languages("c99")
        add_cflags("-Wno-implicit-int")
    end 