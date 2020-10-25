echo django==$1 >> requirements.txt
echo djangorestframework==$2 >> requirements.txt
echo drf-yasg==$3 >> requirements.txt

docker-compose -f docker-compose.local.yml up --build
