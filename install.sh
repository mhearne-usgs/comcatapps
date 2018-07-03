#!/bin/bash

VENV=apps
PYVER=3.5
env_file=environment.yml

prof=~/.bash_profile
source $prof

#if we're already in an environment called VENV, switch out of it so we can remove it
conda deactivate
    
# #create a new virtual environment called $VENV with the below list of dependencies installed into it
conda env create -f $env_file --force

# #activate the new environment
conda activate $VENV

# # This package
echo "Installing $VENV..."
pip install -e .

# #tell the user they have to activate this environment
echo "Type 'conda activate ${VENV}' to use this new virtual environment."
