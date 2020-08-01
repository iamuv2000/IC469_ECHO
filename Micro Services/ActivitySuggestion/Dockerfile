FROM ubuntu:latest
RUN apt update
RUN apt install python3 python3-pip -y
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt 
EXPOSE 9090 
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ] 
