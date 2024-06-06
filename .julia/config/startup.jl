ENV["JULIA_PKG_USE_CLI_GIT"]=true
ENV["CPLEX_STUDIO_BINARIES"] = "/ext/cplex/cplex/bin/x86-64_linux"

using Revise
using DrWatson
using Pkg
using OhMyREPL
using Infiltrator

using Pluto
if isfile("Project.toml") && isfile("Manifest.toml")
  Pkg.activate(".")
end
# atreplinit() do repl
#   try
#     @eval using OhMyREPL
#   catch e
#     @warn "error while importing OhMyREPL" e
#   end
# end
ENV["CPLEX_STUDIO_BINARIES"] = "/ext/cplex/cplex/bin/x86-64_linux"

function rr()
  Revise.retry()
end
function pluto()
  Pluto.run(threads=6)
end
