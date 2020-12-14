# System
alias startssh='sudo systemctl start ssh'
alias stopssh='sudo systemctl stop ssh'
alias dbadmin='php -S localhost:8080 -t /usr/share/phpmyadmin/'
alias copyssh='xclip -sel clip < ~/.ssh/id_rsa.pub && echo 'Copied''
alias expose='ssh -R 80:test.web:80 serveo.net'
alias myip='curl ifconfig.io'
alias cat='batcat'

# Directories
alias apps='cd $HOME/Documents/apps'
alias phptin='cd $HOME/Documents/php_tinkering'
alias brainster='cd $HOME/Documents/brainster'
alias dotfiles='cd $HOME/Documents/dotfiles'
alias til='cd $HOME/Documents/til'

# JS
alias nrd='npm run dev'
alias nrw='npm run watch'

# Git
alias gaa='git add .'
alias gc='git commit -m'
alias gpush='git push -u origin'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Misc
alias test='vendor/bin/phpunit --colors=always'
alias ftest='vendor/bin/phpunit --colors=always --filter'
# if you want to use pulse VPN
alias vpn=/usr/local/pulse/pulseUi
