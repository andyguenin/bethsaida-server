prod_version=`cat /backend/latest.txt`

ln -sfn /backend/archive/$prod_version.jar /backend/prod.jar
