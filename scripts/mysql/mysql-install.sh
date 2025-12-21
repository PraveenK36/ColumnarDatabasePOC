docker run -d \
  --name mysql-app \
  -e MYSQL_ROOT_PASSWORD=test123 \
  -e MYSQL_DATABASE=app \
  -e MYSQL_USER=praveen \
  -e MYSQL_PASSWORD=test123 \
  -p 3306:3306 \
  mysql:8.0