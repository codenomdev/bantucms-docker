container_id=$(docker ps -aqf "name=bantucms-php-apache")

docker exec -it ${container_id} bash