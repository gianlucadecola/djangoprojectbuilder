# Django Skeleton Project Builder  

This repository contains an up and running clean django/django rest framework environment with standard project structure.  
You can clone it, run the build and start building your django app.  

## Project Structure (after the build)

* ```src``` folder contains the full django project.  
* ```src/server``` folder contains the root django project with ```settings.py```.  
* A default db.qlite3 is created with its basic migrations.  
* Django admin need to be created manually.  
* API documentation can be found at the url: ```host:8000/swagger```

## Instructions  

```chmod +x build.sh```  

```./build.sh <django-version-number> <djangorestframework-version-number> <drf-yasg-version-number> <appname>```  

```docker-compose up```

## Example Build  

```./build.sh 3.0.6 3.11.0 1.17.1 app```


## Tested versions  
**Docker version** = 19.03.13  
**docker-compose version** = 1.17.1  

**Python packages**  
django==3.0.6  
djangorestframework==3.11.0  
drf-yasg==1.17.1
