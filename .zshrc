# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)


## TOOLS ##
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

ssp() {
    sudo netstat -ltnp | grep -w "$1"
}

alias reload='source ~/.zshrc'

## ALIAS GIT ##
alias gst='git status'
alias gps='git push'
alias gpl='git pull'
alias gpsf='git push --force-with-lease'
alias gft='git fetch'
alias grc='git rebase --continue'
alias gsm='git switch master'
alias glg='git log'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

gro() {
    git rebase origin/"$1"
}

##DOCKER
alias dc='docker compose up -d'
alias dcd='docker compose down'
alias dcp='docker compose pull'
alias dps='docker ps --format "ID\t{{.ID}}\nNAME\t{{.Names}}\nPORTS\t{{.Ports}}\nIMAGE\t{{.Image}}\nSTATUS\t{{.Status}}\n"' 
alias dl='docker logs -f'
alias ctop='docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest'

alias s='sudo'

source $ZSH/oh-my-zsh.sh

bp() {
    echo "🔄 Nettoyage du projet Maven..."
    sudo mvn clean

    echo "🔧 Compilation du projet (tests ignorés)..."
    mvn clean install -DskipTests

    echo "🐳 Démarrage des conteneurs Docker..."
    docker compose up -d

    echo "✅ Build terminé avec succès."
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/edgarrenaudier/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
