#!/bin/bash
# creo carpeta
mkdir tempdir/

#copiamos 
cp -r static/ tempdir/
cp -r templates/ tempdir/
cp desafio2_app.py tempdir/

#construyo docker file
touch Dockerfile

#agrego informacion pasada por la profe
echo "FROM python
RUN pip install flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY desafio2_app.py /home/myapp/
EXPOSE 5050
CMD python3 /home/myapp/desafio2_app.py" >> Dockerfile


 #construyo la app
 sudo docker build -t desafio2 .

 #inicio la app
 sudo docker run -t -d -p 5050:5050 --name desafio2_JM desafio2

 #mostramos todos los contenedores, esten o no corriendo
 docker ps -a