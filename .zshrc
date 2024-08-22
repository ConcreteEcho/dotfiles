# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export DOTNET_ROOT=/usr/share/dotnet

path+=('$HOME/yandex-cloud/bin')
path+=('$HOME/.dotnet/tools')

ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd-mm-yyyy"

plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting gh fzf web-search terraform aws)

source $ZSH/oh-my-zsh.sh
source $HOME/yandex-cloud/completion.zsh.inc

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim"
alias lzd=lazydocker
alias dotfiles='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
alias dotnettu="dotnet tool list -g | awk '{ print \$1 }' | tail +3 | xargs -I % sh -c 'dotnet tool update -g %;'"

# The next line updates PATH for CLI.
if [ -f "${HOME}/yandex-cloud/path.bash.inc" ]; then source "${HOME}/yandex-cloud/path.bash.inc"; fi

# The next line enables shell command completion for yc.
if [ -f "${HOME}/yandex-cloud/completion.zsh.inc" ]; then source "${HOME}/yandex-cloud/completion.zsh.inc"; fi

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
