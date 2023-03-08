container_id=$(docker ps -aqf "name=bantucms-mysql")

docker exec -it ${container_id} bash