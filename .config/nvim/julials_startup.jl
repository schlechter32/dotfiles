# ~/.config/nvim/julials_startup.jl
# ----------------------------------
# Julia LSP launcher
# - Always loads LanguageServer etc. from @nvim-lspconfig
# - Finds the nearest parent Project.toml
# - Recursively scans all nested Project.toml under that project
# - Mutates LOAD_PATH (instead of assigning) to include all envs
# - Activates the main environment before running the server

# --- 1. Load LSP dependencies from @nvim-lspconfig
ls_install_path = joinpath(
    get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),
    "environments", "nvim-lspconfig",
)
pushfirst!(LOAD_PATH, ls_install_path)
using LanguageServer, SymbolServer, StaticLint
popfirst!(LOAD_PATH)

# --- 2. Detect depot and working directory
depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
pwd_path   = pwd()

# --- 3. Find nearest project (walk upwards)
function find_root_project(path::AbstractString)
    while !isempty(path) && path != dirname(path)
        proj = joinpath(path, "Project.toml")
        if isfile(proj)
            return path
        end
        path = dirname(path)
    end
    return nothing
end

root_project = let
    env_proj = let p = get(ENV, "JULIA_PROJECT", nothing)
        (p === nothing || isempty(p)) ? nothing : Base.load_path_expand(p)
    end
    something(env_proj, find_root_project(pwd_path))
end

if root_project === nothing
    fallback_env = joinpath(
        get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),
        "environments", "nvim-lspconfig",
    )
    root_project = isdir(fallback_env) ? fallback_env : Base.load_path_expand("@v#.#")
    @warn "No local Project.toml found; using fallback environment" root_project
end

# --- 4. Recursively collect nested Project.toml directories
function find_nested_projects(root::AbstractString)
    nested = String[]
    for (dir, _, files) in walkdir(root)
        if "Project.toml" in files && dir != root
            push!(nested, dir)
        end
    end
    return nested
end

nested_projects = isdir(root_project) ? find_nested_projects(root_project) : String[]

# --- 5. Mutate LOAD_PATH to include all envs (root + nested + stdlib)
empty!(LOAD_PATH)
append!(LOAD_PATH, [root_project; nested_projects; "@stdlib"])

# --- 6. Activate main project
using Pkg
Pkg.activate(root_project, io=devnull)

@info "Starting Julia LSP" VERSION pwd=pwd_path project=root_project nested=nested_projects depot=depot_path load_path=LOAD_PATH
@info "Nested envs are"
@info nested_projects

# --- 7. Run the LanguageServer
@info "root project is: $root_project"
server = LanguageServer.LanguageServerInstance(stdin, stdout, root_project, depot_path)
server.runlinter = true
run(server)
