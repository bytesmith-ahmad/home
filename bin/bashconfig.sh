#!bin/bash

# BASH SETTINGS

# VARIABLES ****************************************************************************************

# Path to my scripts
export PATH="$HOME/bin:$PATH"

# Defaults
export VISUAL="code --wait"
export EDITOR="micro"

# Prompt string (PS to make PS1 dynamic)
export PS="\[\e[5;92m\]\$(date +'%H:%M')\[\e[0m\] \[\033[01;34m\]\w\[\033[00m\] \[\e[5m\]⚡\[\e[0m\]"
export PS1=$PS

# Web links
export github="https://github.com/bytesmith-ahmad"

#TaskWarrior
export wksp="$HOME/workspace"
lim=10    # limits the number of tasks shown

# COMMANDS ******************************************************************************************

# Config files

alias config="$EDITOR ~/bin/bashconfig.sh"      # extension of ~/.bashrc
alias taskconfig="$EDITOR ~/bin/taskconfig.sh"  # extension of ~/.taskrc

# TaskWarrior

alias tasks='task limit:10'
add()   { task add    "$@" && task last_insert; }
mod()   { task modify "$@" && task limit:$lim; }
del()   { task delete "$@" && task limit:$lim; }
start() { task start  "$@" && task limit:$lim; }
stop()  { task stop   "$@" && task limit:$lim; }
undo()  { task undo   "$@" && task limit:$lim; }
complete(){ task done "$@" && task limit:$lim; }
alias edit='task edit'
alias goto='source goto.sh '
alias errands='source errands'
alias switch='source switch_task_context.sh'
sync-tasks() {
	cd .task
	git pull
	git add .
	git commit -m "updating tasks"
	git push
	cd ..
}

# File handling

alias peek="tree -L 1"
alias note="notepad.exe" 
alias open-db=sqlitebrowser

# Web

alias chrome="/mnt/c/'Program Files'/Google/Chrome/Application/chrome.exe"
alias cgpt='chrome https://chat.openai.com/c/cc6e1725-5fee-454d-a15f-9477655cbc29/ 2>/dev/null &'

# Utilities

alias c='xclip -selection clipboard'
