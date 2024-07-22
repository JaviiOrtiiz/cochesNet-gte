#!/bin/bash

# Navigate to the directory containing your repository
cd /home/orangepi

# Pull the latest changes from the Git repository
gh repo clone JaviiOrtiiz/cochesNet-GTE

# Navigate to the repository
cd cochesNet-GTE

# Stop and remove the old container if it exists
if [ "$(docker ps -q -f name=cochesnet-GTE)" ]; then
    docker stop cochesnet-GTE
    docker rm cochesnet-GTE
fi

# Remove the old Docker image if it exists
if [ "$(docker images -q cochesnet-GTE)" ]; then
    docker rmi cochesnet-GTE
fi

# Build the Docker image
docker build -t cochesnet-GTE .

# Run the run.sh script
sh run.sh
