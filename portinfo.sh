#!/bin/bash

PORT="$1"

if [ -z "$1" ]; then
    echo "Usage: portinfo --help for help."
    exit 1
fi

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Usage: portinfo <port> - Get information about the process occupying the specified port."
    echo ""
    echo "Options:"
    echo "  --kill, -k     Kill the process using the specified port. Example: portinfo 8080 --kill"
    echo "  --help, -h     Display this help message."
    echo "  --install      Make script accessible everywhere in the system. Doesnt actually install anything."
    echo "  --uninstall    Undo install."
    exit 0
elif [ "$1" == "--install" ]; then
    sudo cp portinfo.sh /usr/local/bin/portinfo
    sudo chmod +x /usr/local/bin/portinfo
    echo "Script installed successfully. You can now use 'portinfo' command from anywhere."
    exit 0
elif [ "$1" == "--uninstall" ]; then
    sudo rm /usr/local/bin/portinfo
    echo "Script uninstalled successfully."
    exit 0
fi

pid=$(lsof -i :"$1" | awk 'NR==2 {print $2}')
process=$(lsof -i :"$1" | awk 'NR==2 {print $1}')
user=$(lsof -i :"$1" | awk 'NR==2 {print $3}')

if [ -z "$pid" ]; then
    echo "No process is using port $1."
    exit 0
fi

if [ -z "$2" ]; then
    echo "Process: $process"
    echo "PID: $pid"
    echo "User: $user"
    exit 0
elif [ "$2" == "--kill" ] || [ "$2" == "-k" ]; then
    kill $pid;
    sleep 2
    if ! kill -0 $pid 2>/dev/null; then
        echo "Process $process killed successfully"
    else
        echo "Process failed to kill."
        read -p "Force kill process? (y/n) " confirm
  
        if [[ $confirm == "y" || $confirm == "Y" ]]; then
            kill -9 $pid
            echo "Process $pid force killed."
        else
            echo "Process $pid still running."
        fi
    fi
else
    echo "Invalid argument. Use --help for usage information."
    exit 1
fi

