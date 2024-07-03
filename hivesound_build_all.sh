rm -f stage0/SKIP
rm -f stage1/SKIP
rm -f stage2/SKIP
rm -f stage3/SKIP
rm -f stage4/SKIP
rm -f stage5/SKIP

docker rm -v pigen_work
PRESERVE_CONTAINER=1 PIGEN_DOCKER_OPTS="--env-file build_config/build.env" ./build-docker.sh
