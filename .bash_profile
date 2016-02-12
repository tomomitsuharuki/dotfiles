eval "$(rbenv init -)"

export PS1="[\u \W]\\$ "

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

