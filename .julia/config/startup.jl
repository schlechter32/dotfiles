# in your startup file, usually ~/.julia/config/startup.jl
if isinteractive()
    @eval using VimBindings
end
ENV["JULIA_PKG_USE_CLI_GIT"] = true
ENV["CPLEX_STUDIO_BINARIES"] = "/ext/cplex/cplex/bin/x86-64_linux"
using Revise
using OhMyREPL
colorscheme!("TomorrowNightBright")
using Logging
# using LoggingExtras
using Infiltrator

if isfile("Project.toml") && isfile("Manifest.toml")
    @eval import Pkg
    Pkg.activate(".")
end
# atreplinit() do repl
#   try
#     @eval using OhMyREPL
#   catch e
#     @warn "error while importing OhMyREPL" e
#   end
# end
# ENV["CPLEX_STUDIO_BINARIES"] = "/ext/cplex/cplex/bin/x86-64_linux"

function rr()
    Revise.retry()
end
function pluto()

    @eval using Pluto
    Pluto.run(threads=6, launch_browser=false, auto_reload_from_file=true)
end

function tool_activate()
    @eval import Pkg
    Pkg.activate(ENV["TOOL_PATH"])
    @eval using RL_RSA_MDPs, IKRNetBase
end

struct DebugModuleLogger <: AbstractLogger
    console_logger::ConsoleLogger
    debug_modules::Set{Symbol}
end

function Logging.shouldlog(logger::DebugModuleLogger, level, _module, group, id)
    if level == Logging.Debug
        return nameof(_module) in logger.debug_modules
    else
        return true
    end
end

function Logging.min_enabled_level(logger::DebugModuleLogger)
    return Logging.Debug
end

function Logging.catch_exceptions(logger::DebugModuleLogger)
    return false
end

function Logging.handle_message(logger::DebugModuleLogger, level, message, _module, group, id, file, line; kwargs...)
    if level == Logging.Debug && !(nameof(_module) in logger.debug_modules)
        return nothing
    end
    return Logging.handle_message(logger.console_logger, level, message, _module, group, id, file, line; kwargs...)
end

debug_modules = Set{Symbol}()
current_logger = DebugModuleLogger(ConsoleLogger(stderr, Logging.Debug), debug_modules)

function set_debug_logging(modules...)
    global debug_modules = Set(modules)
    update_logger()
end


function enable_debug_logging(module_name::Symbol)
    if !(module_name in debug_modules)
        push!(debug_modules, module_name)
    else
        println("Was already enabled")
    end
    update_logger()
    println("Debug logging is now $(module_name in debug_modules ? "enabled" : "disabled") for $module_name")
end
function disable_debug_logging(module_name::Symbol)
    if module_name in debug_modules
        delete!(debug_modules, module_name)
    else
        println("Was not enabled")
    end
    update_logger()
    println("Debug logging is now $(module_name in debug_modules ? "enabled" : "disabled") for $module_name")
end
function toggle_debug_logging(module_name::Symbol)
    if module_name in debug_modules
        delete!(debug_modules, module_name)
    else
        push!(debug_modules, module_name)
    end
    update_logger()
    println("Debug logging is now $(module_name in debug_modules ? "enabled" : "disabled") for $module_name")
end

function update_logger()
    global current_logger = DebugModuleLogger(ConsoleLogger(stderr, Logging.Debug), debug_modules)
    global_logger(current_logger)
end
