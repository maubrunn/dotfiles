#!/bin/zsh

check_container_running() {
    container_name=$1
    if [ "$(docker ps -q -f name=$container_name)" ]; then
        echo "Container '$container_name' is running."
        return 0
    else
        echo "Container '$container_name' is not running."
        return 1
    fi
}

tmux display-message "Choose an option: 1) Attach to Docker container 2) SSH into server (or press Enter for a normal shell)"Prompt user to choose Docker or SSH
echo "Choose an option:"
echo "1) Attach to Race_stack Docker container"
echo "2) Attach to any docker container"
echo "3) SSH into server"
echo "Press Enter to open a normal shell"
read "choice?Enter 1, 2, 3 or hit Enter: "
if [[ "$choice" = "1" ]]; then
    # Prompt for Docker container name
    container_name=forzaeth_devcontainer
    if check_container_running "$container_name"; then
	tmux send-keys "~/pbl/f110/race_stack/.docker_utils/sec_dock.sh" C-m
    else
	echo "Docker container not running"
    fi
elif [[ "$choice" = "2" ]]; then
    container_names=($(docker ps --format "{{.Names}}"))
    echo "All runnning containers"$'\n'$container_names
    select cont in "${container_names[@]}"; do
	if [[ -n "$cont" ]]; then
	    echo "You selected: $cont"
    	    tmux send-keys "docker exec -it $cont /bin/bash" C-m
	    break
	else 
	    echo "Not running"
	fi 
   done
elif [[ "$choice" = "3" ]]; then
    # Prompt for SSH server details
    hosts=($(awk '/^Host / {print $2}' ~/.ssh/config))
    echo "Please select an SSH host:"
    select host in "${hosts[@]}"; do
	if [[ -n "$host" ]]; then
		echo "You selected: $host"
		# Here you could initiate an SSH connection
		ssh "$host"
		break
	else
		echo "Invalid selection, please try again."
	fi
    done
fi

