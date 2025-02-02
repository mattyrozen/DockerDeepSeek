docker stop deepseek
docker rm deepseek
docker build -t deepseek .
docker tag deepseek:latest keystonealfisti/deepseek:prod
docker run --privileged --memory 8192m --name deepseek  -p 8080:8080 -d deepseek

exit