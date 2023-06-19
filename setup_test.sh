export GREEN='\033[0;32m'
export RED=$'\e[0;31m'

# Cleaning up the environment

docker system prune -f
docker image ls

HELM_CHART_NAME="flask-app"
HELM_RELEASE_NAME="test-flask"
IMAGE_NAME="flaskapp"
EXISTING_IMAGE=$(docker images -q $IMAGE_NAME)


if [[ -z $EXISTING_IMAGE ]]; then
  echo " '$IMAGE_NAME' {$RED} not found.{$GREEN} Building the image..."

  docker build -t $IMAGE_NAME .
else
  echo "{$GREEN} Docker image '$IMAGE_NAME' already exists."

  read -p "{$GREEN} Do you want to remove the existing image and build a new one? (y/n): " choice

  if [[ $choice =~ ^[Yy]$ ]]; then
    echo "{$RED} Removing existing image '$IMAGE_NAME'"
    docker rmi $EXISTING_IMAGE
    docker build -t $IMAGE_NAME .
  else
    echo "{$GREEN}Proceeding with the existing image."
  fi
fi

# Check if the Helm release exists
helm get manifest $HELM_RELEASE_NAME >/dev/null 2>&1

if [[ $? -eq 0 ]]; then
  echo "Helm release '$HELM_RELEASE_NAME' already exists. Upgrading..."
  helm upgrade $HELM_RELEASE_NAME $HELM_CHART_NAME
else
  echo "Helm release '$HELM_RELEASE_NAME' not found. Installing..."
  helm install $HELM_RELEASE_NAME $HELM_CHART_NAME
fi

