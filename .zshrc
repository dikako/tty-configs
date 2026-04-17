# ─────────────────────────────────────────
# Colors & Readability
# ─────────────────────────────────────────
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced   # Colorful ls output

# ─────────────────────────────────────────
# Plugins (auto suggestions + highlighting)
# ─────────────────────────────────────────
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─────────────────────────────────────────
# Useful Aliases (easier commands)
# ─────────────────────────────────────────
alias ll="ls -la"           # List all files with details
alias la="ls -A"            # List hidden files too
alias c="clear"             # Quick clear screen
alias ..="cd .."            # Go up one folder
alias ...="cd ../.."        # Go up two folders
alias zshrc="code ~/.zshrc" # Open .zshrc in VS Code
alias zprofile="code ~/.zprofile" # Open .zprofile in VS Code
alias reload="source ~/.zprofile && source ~/.zshrc"  # Reload config
alias ai="claude"           # Quick access to AI assistant (claude code)
alias gs="git status -sb"   # Short git status
alias gf="git fetch --all"  # Fetch all git updates
alias gc="git commit -m"    # Quick git commit
alias ga="git add"          # Global alias for git add
alias gb="git branch"       # List git branches
alias gco="git checkout"    # Quick git checkout
alias gp="git push origin"  # Quick git push
alias gpull="git pull origin"  # Pull latest changes from main
alias gshowh="git show HEAD" # Show diff
alias gshow="git show" # Show diff specific commit hash
alias jb="./gradlew build"  # Build Java project with Gradle
alias jbr="./gradlew build --refresh-dependencies"  # Build Java project with Gradle and refresh dependencies
alias startpg="brew services start postgresql@17"
alias restartpg="brew services restart postgresql@17"
alias pg="psql postgres"
alias pgstatus="pg_isready"
alias sc="cat ~/.zshrc | grep 'alias'"
alias p="pwd"             # Print current directory

# ─────────────────────────────────────────
# History (easier command search)
# ─────────────────────────────────────────
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # No duplicate history
setopt AUTO_CD                # Type folder name to enter it
setopt CORRECT                # Auto suggest typo corrections
eval "$(atuin init zsh)"

# ─────────────────────────────────────────
# Custom prompt
# ─────────────────────────────────────────
git_branch() {
  local branch=$(git branch --show-current 2>/dev/null)
  local cat_clean="🐱"
  local cat_not_clean="😺"
  if [ -n "$branch" ]; then
    if git diff --quiet 2>/dev/null; then
      echo "$cat_clean $branch | ✓ clean"
    else
     echo "$cat_not_clean $branch | ✗ uncommitted changes"
    fi
  else
    echo ""
  fi
}

PS1='
%F{green}$(git_branch)%f
%F{white}>%f '
export TERM=xterm-256color

# ─────────────────────────────────────────
# nano editor settings (for better editing experience)
# ─────────────────────────────────────────
export EDITOR=nano
export VISUAL=nano

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
