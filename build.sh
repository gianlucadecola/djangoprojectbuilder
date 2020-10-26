echo django==$1 > src/requirements.txt
echo djangorestframework==$2 >> src/requirements.txt
echo drf-yasg==$3 >> src/requirements.txt

docker build -t django-project:latest src/
docker create -ti --name dummy django-project:latest bash
docker cp dummy:/src/* $(pwd)/src/
docker rm -f dummy
