#never ever beep ever
setopt NO_BEEP
setopt BASH_AUTO_LIST
setopt AUTO_MENU

PROMPT='%m:%3~$ '
autoload -U compinit && compinit
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

alias openk='open -a "Komodo Edit 9"'
alias opent='open -a "TextEdit"'
alias openp='open -a "PhpStorm"'
alias ls='ls -hF'
alias grep='grep --color'

alias gs='git status'
alias gc='git commit -a -m'
alias gca='git commit --amend'
alias gp='git push'
alias gb='git branch'
alias gu='git fetch; git pull; git submodule init; git submodule update'
alias gsu='git submodule init && git submodule update'
alias gm='git merge'
alias gd='git diff'
alias grevert='git stash && git stash drop'
alias ghide='git update-index --assume-unchanged'
alias gshow='git update-index --no-assume-unchanged'
alias glisthidden='git update-index --really-refresh'
alias rmorig='find . -name "*.orig" | xargs rm -f'
alias flushDns='sudo killall -HUP mDNSResponder'
alias usingDisk='sudo lsof -xf +d'

alias c='clear'
alias r='fc -e -'
alias rebash='source ~/.zprofile'

alias phpfind='find . -name "*.php" -print0 | xargs -0 grep --color -n $*'
alias phpfindnotests='find . -name "*.php" -and -not -path "*tests/*" -print0 | xargs -0 grep --color -n $*'

validateEnvironments() {
    cat ~/.ssh/config | grep "Host " | grep -o -E "\w+$" | xargs -I % ssh % 'cat /etc/motd; find /var/modo -name "environment.php" | xargs php -d display_errors=On' 2>&1 | grep -v -E "^\s*\*"
}

apiCall() {
    DATE=`date +%s`
    TIMESTAMP=`echo $((DATE*1000 - 9999))`

    BODY_HASH=`echo -n $POST_DATA | /usr/local/ssl/bin/openssl sha -sha256 -r | awk '{print $1;}'`

    SIGNING_KEY=`echo -n $TIMESTAMP | /usr/local/ssl/bin/openssl dgst -sha256 -hex -hmac 'MODO1'$SECRET -r | awk '{print $1;}'`
    STRING_TO_SIGN=$TIMESTAMP'&'$API'&'$BODY_HASH
    SIGNATURE=`echo -n $STRING_TO_SIGN | /usr/local/ssl/bin/openssl dgst -sha256 -hex -mac HMAC -macopt "hexkey:$SIGNING_KEY" -r | awk '{print $1;}'`

    curl -H 'X-Modo-Date:'$TIMESTAMP -H 'Authorization: MODO1 key='$KEY', sig='$SIGNATURE -d $POST_DATA $BASE_URL''$API | json_pp
}

lasthash() {
    REPO=`git config --get remote.origin.url | grep -o -E "git/.*" | cut -d'/' -f 2-`
    git log | head -n 1 | tr -d '\n' | awk 'BEGIN { FS = " " } ; {print "http://git.development.internal/?p='$REPO';a=commit;h="$2}' | pbcopy
}

alias modocordova='lipo -create Debug-iphoneos/ModoKit.framework/ModoKit Debug-iphonesimulator/ModoKit.framework/ModoKit -output ModoKit; lipo -info ModoKit; cp -Rp Debug-iphoneos/ModoKit.framework .; mv ModoKit ModoKit.framework/; codesign -s "Bion Oren" -f ModoKit.framework; codesign -vvvv ModoKit.framework'

#Dump everything coming in on port 1700 through eth0
#sudo tcpdump -i eth0 -A -s 0 "dst port 1700"
