# make the prompt less ugly
PS1=": \W$ "


####################################################################

# general utils


alias trash="sh ~/.functions/trash"     ## move files to trash instead of hard rm
alias lh="ls -lah"                      ## ls list with options for long format, hidden files, and human readable
alias targz="tar -czvf"                 ## unzip tar files with gzip options

alias bashprofile="open ~/.bash_profile" # quick open bash profile from any terminal

alias cwd="pwd | pbcopy"                ## copy working directory to clipboard


# Add Visual Studio Code (code)
PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH

# from homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"



####################################################################

# python


# set alias for python for version display
alias python="python3"

# overwrite requirements file with pip freeze
alias update_requirements="pip freeze > requirements.txt" # note: for use in an active env

# print and copy command to start env, can tab complete envs saved in ~/.envs/
alias startenv="echo to start env: && echo source \~/.envs/env-name-here/bin/activate && echo -n source \~/.envs/ | pbcopy"



# from python installs

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH


# from bigquery

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/maxinenajle/.google-cloud-sdk/path.bash.inc' ]; then . '/Users/maxinenajle/.google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/maxinenajle/.google-cloud-sdk/completion.bash.inc' ]; then . '/Users/maxinenajle/.google-cloud-sdk/completion.bash.inc'; fi



####################################################################

# git


alias gb="git branch"
alias gs="git status"

## git completion               # see https://github.com/git/git/blob/master/contrib/completion/
source ~/.git-completion.bash   # branch completion
source ~/.git-prompt.sh	        # branch in prompt (update PS1 to use)

## github url
alias giturl="sh ~/.functions/giturl.sh"

## quick cd to git repos
shopt -s cdable_vars                        # makes vars usable in cd
export repos_dir=$HOME/Documents/GitHub     # git dir
alias cd_repos="cd repos_dir"

# alias repos="echo ~/Documents/GitHub/ && echo repos: && ls ~/Documents/GitHub/"
alias repos="echo $repos_dir && echo repos: && ls $repos_dir"

