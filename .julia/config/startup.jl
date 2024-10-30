# in your startup file, usually ~/.julia/config/startup.jl
if isinteractive()
    @eval using VimBindings
end
ENV["JULIA_PKG_USE_CLI_GIT"] = true
ENV["CPLEX_STUDIO_BINARIES"] = "/ext/cplex/cplex/bin/x86-64_linux"
using Revise
using OhMyREPL
colorscheme!("TomorrowNightBright")
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
