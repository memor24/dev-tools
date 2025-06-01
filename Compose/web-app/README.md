Docker compose is used to manage multiple containers in one host:
Prepare the configs and secrets. \
Prepare the images:
```
cd site
docker pull docker/voting-app && docker tag docker/voting-app webapp
docker pull ubuntu/postgres && docker tag ubuntu/postgres database
```

Use docker compose commands:
```
docker compose up
docker compose log
docker compose ps
docker compose down
```
