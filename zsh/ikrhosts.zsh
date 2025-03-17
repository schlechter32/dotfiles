BULK_HOME="/u/bulk/home/wima/$USER"
LAB_BULK_HOME="/home/bulk"
if [[ $(hostname) == *"cnode"* ]]; then

export JULIAUP_DEPOT_PATH="$BULK_HOME/julia/"
export JULIA_DEPOT_PATH="$BULK_HOME/julia/"
# export PYENV_ROOT="$BULK_HOME/.pyenv"

export ST_PATH=/u/home/wima/nclshrnk/source/SimTree_wrapper
function st(){
    source /u/home/wima/nclshrnk/source/SimTree_wrapper/st_wrapper.bash
}
elif [[ $(hostname) == *"pc"* ]]; then

export PATH="$HOME/.juliaup/bin/:$PATH"
export ST_PATH=/u/home/wima/nclshrnk/source/SimTree_wrapper
function st(){
    source /u/home/wima/nclshrnk/source/SimTree_wrapper/st_wrapper.bash
}

elif command -v nix &>/dev/null && nix --version &>/dev/null; then

export ST_PATH=/home/nclshrnk/source/simtree_wrapper
function st(){
    source /home/nclshrnk/source/simtree_wrapper/st_uv_wrapper.bash
}
elif [[ $(hostname) == *"cobra"* ]]; then

export PATH="$HOME/.juliaup/bin/:$PATH"

# export JULIAUP_DEPOT_PATH="$LAB_BULK_HOME/.julia/"
# export JULIA_DEPOT_PATH="$LAB_BULK_HOME/.julia/"

export ST_PATH=$HOME/source/simtree_wrapper
function st(){
    source $HOME/source/simtree_wrapper/st_wrapper.bash
}
else

# export JULIAUP_DEPOT_PATH="$HOME/.julia/"
# export JULIA_DEPOT_PATH="$HOME/.julia/"
fi
