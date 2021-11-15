export DOMAIN_NAME='com.gft'
export CUSTOMER_NAME='techoffice'
export PROJECT_NAME='techsnacks-20211104'

export DOMAIN="$DOMAIN_NAME"
export CUSTOMER="$DOMAIN.$CUSTOMER_NAME"
export PROJECT="$CUSTOMER.$PROJECT_NAME"

alias droot="docker run -i -t --rm --privileged --pid=host debian nsenter -t 1 -m -u -n -i "
alias dils='docker image ls --filter  "label=PROJECT=$PROJECT"'
alias dcls='docker container ls --filter "label=PROJECT=$PROJECT" '
alias dcr='docker container run --label="PROJECT=$PROJECT" -i -t '
alias dexec='docker container exec -i -t '


alias ms-random="/mnt/c/Users/tsbo/Projects/c_ipc/bin/ms-random --version 1.0.0 --name randomsvc --port 8081"
# alias ms-measure="/mnt/c/Users/tsbo/Projects/c_ipc/bin/ms-measure --version 1.0.0 --name th-1 --port 8080 --type thermometer --address 01:00 --randomsvc http://127.0.0.1:8081/random"
alias ms-measure="/mnt/c/Users/tsbo/Projects/c_ipc/bin/ms-measure --version 1.0.0 --name th-1 --port 8080 --type thermometer --address 01:00 --randomsvc '/mnt/c/Users/tsbo/Projects/com.gft.techoffice.techsnacks-20211104/bin/client -t mytopic myclient'"
alias server="/mnt/c/Users/tsbo/Projects/c_ipc/bin/server"
alias client="/mnt/c/Users/tsbo/Projects/c_ipc/bin/client"

alias ks1='kubectl --namespace step-1'
alias ks1a='kubectl --namespace step-1a'
alias ks2='kubectl --namespace step-2'
alias ks2a='kubectl --namespace step-2a'
alias ks3='kubectl --namespace step-3'
alias ks3a='kubectl --namespace step-3a'

function split_project() {
    local path="$1" ; shift
    local base="$1" ; shift

    if [[ -z $base ]] ; then base='/mnt/c/Users/tsbo/Projects' ; fi

    path=$(realpath -m --relative-to="$base" "$path" | sed "s%/.*$%%;" )
    # signature domain customer project
    echo "$path" $( echo "$path" |  sed "s%^\(.*\)\.%\1 %; s%^\([^.]*\.[^.]*\)\.%\1 %")
}

function nice_path() {
    local status=$?
    local path="$1" ; shift
    local base="$1" ; shift
    local nice_path=''

    if [[ $path =~ /home/* && -z $base ]] ; then base='/home' ; fi

    if [[ -z $base ]] ; then base='/mnt/c/Users/tsbo/Projects' ; fi

    if [[ $path =~ $base || $path =~ /home/* ]] ; then

        nice_path=$( realpath -m --relative-to="$base" "$path" | sed "s%/%|%; s%^\([^|/]*\)\.%\1|%" )

    else

       	nice_path=$( realpath -m "$path" ) 

    fi

    echo "$nice_path"
    return $status
}

export PS1='\[\e]0;\[\033[00;34m\]$(nice_path "\w")\[\033[00m\] $(if [[ $? == 0 ]]; then echo -en "\[\033[00;32m\]✓\[\033[00m\]"; else echo -en "\[\033[00;31m\]✗\[\033[00m\]"; fi) \$ '
