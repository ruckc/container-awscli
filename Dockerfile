FROM docker.io/library/ubuntu:jammy-20230816

RUN apt-get update && \
    apt-get install curl unzip -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install --bin-dir /usr/bin --install-dir /opt/aws-cli --update && \
    rm -rf ./aws

ENTRYPOINT ["aws"]
