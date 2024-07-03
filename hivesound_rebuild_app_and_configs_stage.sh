touch stage0/SKIP
touch stage1/SKIP
touch stage2/SKIP
touch stage3/SKIP
rm -f stage4/SKIP

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

PRESERVE_CONTAINER=1 CONTINUE=1 CLEAN=1 PIGEN_DOCKER_OPTS="--env-file build_config/build.env" ./build-docker.sh
