FROM postgres:13.4-bullseye
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update -y && apt upgrade -y

RUN apt install git -y

RUN mkdir /tmp/extension
WORKDIR /tmp/extension

RUN git clone https://github.com/chimpler/postgres-aws-s3.git
WORKDIR /tmp/extension/postgres-aws-s3

RUN apt install -y python3 python3-pip postgresql-plpython3-13 make
RUN pip3 install boto3
RUN make install

RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN locale-gen en_US.UTF-8
