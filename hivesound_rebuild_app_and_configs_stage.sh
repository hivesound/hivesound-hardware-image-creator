touch stage0/SKIP
touch stage1/SKIP
touch stage2/SKIP
touch stage3/SKIP
rm -f stage4/SKIP

PRESERVE_CONTAINER=1 CONTINUE=1 CLEAN=1 PIGEN_DOCKER_OPTS="--env-file build_config/build.env" ./build-docker.sh
