alias gg='git log'
alias gs='git status'
alias gss='git status -s'
alias gf='git fetch origin'
alias gcm='gf && git checkout main'
alias gcd='gf && git checkout develop'
alias gc-='gf && git checkout'
alias gcb='git checkout -b'
alias gfpush='git push --force origin $(git branch --show-current)'
alias gpush='git push origin $(git branch --show-current)'
alias gpull='git pull origin $(git branch --show-current)'
alias gcp='git cherry-pick'
alias gclean='git checkout main && git pull origin main && git branch | grep -v "main" | xargs git branch -D && git fetch origin'
alias gr='git rebase'
alias gr='function _rebase(){ gf && gc- $1 && gpull && gc- - && git rebase $1};_rebase'
alias gri='function _rebase_i(){ git rebase -i HEAD~$1};_rebase_i'
alias gm='git merge'

alias git-config-user='git config user.name "yongholeeme" && git config user.email "yongholeeme@gmail.com"'