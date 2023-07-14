#Instruction Argument
#Start from a base OS or another image
FROM ubuntu 

#Install all dependenciees
RUN apt-get update
RUN apt-get install -y python-is-python3
RUN apt-get install -y python3-pip

RUN pip3 install flask

WORKDIR /opt/source-code

#Copy files from local system current folder to docker image
COPY app.py /opt/source-code

EXPOSE 5000

#Specify Entrypoint
ENTRYPOINT ["flask","run","--host=0.0.0.0"]
# ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run --host=0.0.0.0