IMAGE_NAME="flaky_tests_image"
CONTAINER_NAME="flaky_tests_container"

# Stop and remove "flaky-tests" container if present
docker ps -q --filter "name=$CONTAINER_NAME" | grep -q . && docker stop $CONTAINER_NAME && docker rm -fv $CONTAINER_NAME

# Build the image
docker image build -t="$IMAGE_NAME" .

# Run the container
docker run --name $CONTAINER_NAME -d --cpus=1 --cpuset-cpus=1 --memory=1500m $IMAGE_NAME

# Enter the container's terminal
docker exec -it $CONTAINER_NAME /bin/sh
