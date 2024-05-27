touch stage0/SKIP
touch stage1/SKIP
touch stage2/SKIP
touch stage3/SKIP
touch stage4/SKIP

PRESERVE_CONTAINER=1 CONTINUE=1 CLEAN=1 PIGEN_DOCKER_OPTS="-e NGROK_TOKEN=token_value" ./build-docker.sh
