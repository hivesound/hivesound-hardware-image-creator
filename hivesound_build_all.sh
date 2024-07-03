rm -f stage0/SKIP
rm -f stage1/SKIP
rm -f stage2/SKIP
rm -f stage3/SKIP
rm -f stage4/SKIP
rm -f stage5/SKIP

if [ -d "stage4/00-install-gateway-app/app/.git" ]; then
  echo "Directory contains a Git repository. Pulling the latest version..."
  git -C "stage4/00-install-gateway-app/app" fetch origin
  git -C "stage4/00-install-gateway-app/app" reset --hard origin/hivesound
else
  echo "Directory does not contain a Git repository. Cloning the repository..."
  rm -rf "stage4/00-install-gateway-app/app"
  git clone "git@github.com:hivesound/hivesound-gateway.git" "stage4/00-install-gateway-app/app"
  git -C "stage4/00-install-gateway-app/app" checkout hivesound
fi

docker rm -v pigen_work
PRESERVE_CONTAINER=1 PIGEN_DOCKER_OPTS="--env-file build_config/build.env" ./build-docker.sh
