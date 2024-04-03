using Revise
using DrWatson
using Pkg
using OhMyREPL
if isfile("Project.toml") && isfile("Manifest.toml")
  Pkg.activate(".")
end
atreplinit() do repl
  try
    @eval using OhMyREPL
  catch e
    @warn "error while importing OhMyREPL" e
  end
end
