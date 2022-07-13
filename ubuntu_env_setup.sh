#
#
# NOTE: execute the file under parent directory
# Usage:
#   $ sudo bash ubuntu_env_setup.sh -h
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
# more info:
#   https://www.shellhacks.com/Bash-Colors/
#   https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4
#


RED='\e[31m'
END='\e[0m'

red () {
    echo '\e[31m'$1'\e[0m'
}

green () {
    echo '\e[32m'$1'\e[0m'
}

gray () {
    echo '\e[90m'$1'\e[0m'
}



# echo -e "[$(green 'OK')]"'pip install ok'


setup_pip () {
    # put the conf file in ~/.config/pip/
    echo 'pip config...'
    
    apt install python3-pip && python3 -m pip install -U pip

    python3 -m pip config set global.index-url https://pypi.douban.com/simple
    if [ $? == 0 ]
    then
        echo -e "[$(green 'OK')]" "pip config"
    else
        echo -e "[$(red 'FAILED')]" "pip config"
    fi
}


setup_vim () {
    echo 'set up vim...'

    # TODO: softcoding the path would be better as directory changes over time
    ret=$(diff ./files/vim/vimrc ~/.vimrc)

    if [ ! -z $ret ]; then
        cp --backup=numbered vimrc ~/.vimrc
        if [ $? == 0 ]; then
            echo -e "[$(green 'OK')]" "vim setup"
        else
            echo -e "[$(red 'FAILED')]" "vim setup"
        fi
    else
        echo -e "[$(gray 'NO CHANGE')]" "vim setup"
    fi
}


setup_ssh () {
    echo 'set up ssh'

    src_file_path='./files/ssh/sshd_config'
    dest_file_path='/etc/ssh/sshd_config'

    # TODO: need not generate id_rsa if it exists already
    apt install -y openssh-client && ssh-keygen -t rsa -C 'example@email.com'

    apt install -y openssh-server
    if [ $? == 0 ] && [ -z "$(diff ${src_file_path} ${dest_file_path})" ]; then
        cp --backup=numbered ${src_file_path} ${dest_file_path}
    fi
}


install () {
    apt update

    # install shell tools
    apt install -y tmux vim

    # install network tools
    apt install -y nmap iputils-ping net-tools

    # install miscs tools
    apt install -y tree
}


main () {
    if [ -z $command ] || [ $command == '-h' ] || [ $command == '--help' ]; then
        usage 
        exit 1
    elif [ $command == 'all' ]; then
        install
        setup_pip
        setup_vim
        setup_ssh
    else
        echo -e "[$(red 'FAILED')] There is no such command ${command}"
        echo
        usage
        exit 1
    fi
}

main

