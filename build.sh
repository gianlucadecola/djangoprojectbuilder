if [[ -z "$1" ]]; then
    echo "Provide django version number as first argument"
    exit 1
fi

if [[ -z "$2" ]]; then
    echo "Provide djangorestframework version number as second argument"
    exit 1
fi

if [[ -z "$3" ]]; then
    echo "Provide drf-yasg version number as third argument"
    exit 1
fi

if [[ -z "$4" ]]; then
    echo "Provide django app name as fourth argument"
    exit 1
fi

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
