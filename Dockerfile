# Pull base image depending on the machine name
#FROM resin/%%RESIN_MACHINE_NAME%%-python
FROM resin/raspberry-pi-python
#FROM resin/%%RESIN_MACHINE_NAME%%-debian

#switch on systemd init system in container
ENV INITSYSTEM on

RUN apt-get update && apt-get install -y build-essential python3 python3-pip htop \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV READTHEDOCS=True
RUN pip install picamera

COPY . /usr/src/app
WORKDIR /usr/src/app


# CMD curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# CMD python get-pip.py
# CMD pip install picamera
# CMD ["pip", "install picamera"]
CMD ["python3", "hello.py"]
# CMD chmod +x netcatStream.sh
# CMD ./netcatStream.sh
