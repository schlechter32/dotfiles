using Revise
using DrWatson
using Pkg
if isfile("Project.toml") && isfile("Manifest.toml")
  Pkg.activate(".")
end
