#!bin/bash

# BASH SETTINGS

# VARIABLES ****************************************************************************************

# Path to my scripts
export PATH="$HOME/bin:$PATH"

# Defaults
export VISUAL="code --wait"
export EDITOR="micro"

# Prompt string (PS to make PS1 dynamic)

PS="\[\e[5;92m\]\$(date +'%H:%M')\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\] \[\e[5m\]⚡\[\e[0m\]"

# new version
export PROMPT_COMMAND=__prompt_command
function __prompt_command() {
    local EXIT="$?"   # This needs to be first
    PS1=""

    if [ $EXIT != 0 ]; then
        exit_color="\[\e[31m\]" #  Red for error
    else
        exit_color="\[\e[0m\]"  # None for success
    fi
    
    PS1="\[\e[5;92m\]\$(date +'%H:%M')\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\] ${exit_color}\[\e[5m\]⚡\[\e[0m\]"

    # Show git status as well
    git status -s
}

# Web links
export github="https://github.com/bytesmith-ahmad"

#TaskWarrior
export wksp="$HOME/workspace"
export LIM=10    # limits the number of tasks shown

# COMMANDS ******************************************************************************************

# Config files

alias config="$EDITOR ~/bin/bashconfig.sh"      # extension of ~/.bashrc
alias taskconfig="$EDITOR ~/bin/taskconfig.sh"  # extension of ~/.taskrc

# TaskWarrior MOVED TO SCRIPTS

alias tasks='task limit:10'
alias add='source task-add'
alias mod='source task-mod'
alias del='source task-del'
alias start='source task-start'
alias open='source task-open'
alias stop='source task-stop'
alias undo='source task-undo'
alias done='source task-done'
alias edit='task edit'
alias errands='source errands'
alias switch='source switch_task_context.sh'

# File handling

alias peek="tree -L 1"
alias note="notepad.exe" 
alias open-db=sqlitebrowser

# Web

alias chrome="/mnt/c/'Program Files'/Google/Chrome/Application/chrome.exe"
alias cgpt='chrome https://chat.openai.com/c/cc6e1725-5fee-454d-a15f-9477655cbc29/ 2>/dev/null &'

# Utilities

alias c='xclip -selection clipboard'
