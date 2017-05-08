VERSION=0.9.22

export DISABLE_SYSLOG=1
export DISABLE_SSH=1
export DISABLE_CRON=0

sudo make build NAME=baseimage

docker tag baseimage:${VERSION} localhost:5000/baseimage:${VERSION}
docker push localhost:5000/baseimage:${VERSION}
