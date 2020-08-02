FROM ubuntu:latest
RUN apt update
RUN apt install python3 python3-pip -y
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt 
CMD [ "python3", "app.py" ]
