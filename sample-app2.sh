#!/bin/bash

cd /home/devasc/labs/
mkdir PAG_GAMO
mkdir PAG_GAMO/templates
mkdir PAG_GAMO/static

cp sample_app2.py PAG_GAMO/.
cp -r templates/* PAG_GAMO/templates/.
cp -r static/* PAG_GAMO/static/.

echo "FROM python" >> PAG_GAMO/Dockerfile
echo "RUN pip install flask" >> PAG_GAMO/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> PAG_GAMO/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> PAG_GAMO/Dockerfile
echo "COPY  sample_app2.py /home/myapp/" >> PAG_GAMO/Dockerfile
echo "EXPOSE 9000" >> PAG_GAMO/Dockerfile
echo "CMD python /home/myapp/sample_app2.py" >> PAG_GAMO/Dockerfile

cd PAG_GAMO
docker build -t paggamo .
docker run -t -d -p 9000:9000 --name paggamorunning paggamo
docker ps -a 
