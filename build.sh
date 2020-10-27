echo django==$1 > src/requirements.txt
echo djangorestframework==$2 >> src/requirements.txt
echo drf-yasg==$3 >> src/requirements.txt

docker build --build-arg appname=$4 -t django-project:builder src/
docker create -ti --name dummy django-project:builder bash

docker cp dummy:/src/manage.py $(pwd)/src/
docker cp dummy:/src/server $(pwd)/src/
docker cp dummy:/src/$4 $(pwd)/src/

docker rm -f dummy
docker rmi django-project:builder

mv src/dockerfile src/dockerfile.builder
mv src/dockerfile.development src/dockerfile
