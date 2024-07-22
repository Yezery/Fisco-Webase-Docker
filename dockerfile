# 使用基于 Ubuntu 20.04 的基础镜像
FROM ubuntu:20.04

# 安装OpenJDK 11和OpenSSL 1.1.1f，并设置JAVA_HOME环境变量
RUN echo export JAVA_HOME=/usr >> ~/.bashrc && \
    bash -c "source ~/.bashrc" && \
    apt-get update && \
    apt-get install -y openjdk-11-jdk openssl curl wget unzip cron && \
    cd / && mkdir -p fisco && cd fisco && \
    wget https://osp-1257653870.cos.ap-guangzhou.myqcloud.com/WeBASE/releases/download/v1.5.5/webase-front.zip && \
    unzip webase-front.zip && \
    rm webase-front.zip && \
    curl -#LO https://osp-1257653870.cos.ap-guangzhou.myqcloud.com/FISCO-BCOS/FISCO-BCOS/releases/v2.9.1/build_chain.sh && chmod u+x build_chain.sh && \
    bash build_chain.sh -l 127.0.0.1:4 -p 30300,20200,8545 && \
    cp -r nodes/127.0.0.1/sdk/* webase-front/conf/ && \
    apt-get remove -y curl unzip wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# 设置容器内工作目录
WORKDIR /fisco

# 拷贝自动执行脚本
COPY ./scripts/startup.sh /fisco

COPY ./scripts/clearLog.sh /

COPY ./scripts/crontab.text /etc/cron.d/

# 指定容器启动时执行的命令
CMD ["/bin/bash","startup.sh"]
