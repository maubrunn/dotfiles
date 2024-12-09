#!/bin/bash

# List all running Docker containers
containers=$(docker ps --format "{{.ID}}: {{.Names}}")

# Print the list of containers
echo "Running Docker containers:"
echo "$containers"
echo ""

# Prompt for action
echo "What would you like to do?"
echo "1. Do nothing (default)"
echo "2. Stop all containers"
echo "3. Stop a single container"

# Read the user input
read -p "Enter your choice (1, 2, or 3): " choice

case "$choice" in
  1)
    echo "Doing nothing..."
    ;;
  2)
    echo "Stopping all containers..."
    docker stop $(docker ps -q)
    ;;
  3)
    # Prompt the user to select a container to stop
    container_to_stop=$(echo "$containers" | awk '{print $2}' | fzf)
    if [ -n "$container_to_stop" ]; then
      echo "Stopping container: $container_to_stop"
      docker stop "$container_to_stop"
    else
      echo "No container selected."
    fi
    ;;
  *)
    echo "Invalid choice. Doing nothing."
    ;;
esac

