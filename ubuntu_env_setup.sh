#
#
# NOTE: execute the file under parent directory
# Usage:
#   $ bash ubuntu_env_setup.sh -h
#


usage () {
    echo 'Usage: bash ubuntu_env_setup.sh <command>'
    echo 
    echo 'commands:'
    echo '  all     set up all env'
}


command=$1


#
# COLORs
#
# more info: https://www.shellhacks.com/Bash-Colors/
#


RED='\e[31m'
END='\e[0m'

red () {
    echo '\e[31m'$1'\e[0m'
}

green () {
    echo '\e[32m'$1'\e[0m'
}

# echo -e "[$(green 'OK')]"'pip install ok'


function pip_setup {
    # put the conf file in ~/.config/pip/
    echo 'pip config...'
    python -m pip config set global.index-url https://pypi.douban.com/simple
    if [ $? == 0 ]
    then
        echo -e "[$(green 'OK')]" "pip config"
    else
        echo -e "[$(red 'FAILED')]" "pip config"
    fi
}


setup_vim () {
    echo 'set up vim...'
    cp --backup=numbered vimrc ~/.vimrc
    if [ $? == 0 ]; then
        echo -e "[$(green 'OK')]" "vim setup"
    else
        echo -e "[$(red 'FAILED')]" "vim setup"
    fi

}


main () {
    if [ -z $command ] || [ $command == '-h' ] || [ $command == '--help' ]; then
        usage 
        exit 1
    elif [ $command == 'all' ]; then
        pip_setup
        setup_vim
    else
        echo -e "[$(red 'FAILED')] There is no such command ${command}"
        echo
        usage
        exit 1
    fi
}

main

