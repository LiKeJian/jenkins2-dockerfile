FROM maven:3-jdk-8

LABEL maintainer="mayh0991@126.com"

# 设置时区
ENV TZ=Asia/Shanghai
# Tomcat目录
ARG APP_PATH=/data
ARG TOMCAT_APP_NAME=apache-tomcat-8.5.41
ARG JENKINS_CONFIG_PATH=/root/.jenkins
# Maven配置文件目录
ARG MAVEN_CONFIG_PATH=/usr/share/maven/conf
# Maven默认仓库目录
ARG MAVEN_REPOSITORY_PATH=/root/.m2

# 将项目复制到工作目录中来
COPY . ${APP_PATH}

# 替换Maven配置文件
RUN mv -f ${APP_PATH}/settings.xml ${MAVEN_CONFIG_PATH}

# 解压
RUN tar -xf ${APP_PATH}/${TOMCAT_APP_NAME}.tar -C ${APP_PATH}

# 进入工作目录
WORKDIR ${APP_PATH}/${TOMCAT_APP_NAME}/bin

# 挂载Jenkins配置目录
VOLUME ${JENKINS_CONFIG_PATH}
# 挂载Maven默认仓库目录
VOLUME ${MAVEN_REPOSITORY_PATH}

# Tomcat默认端口
EXPOSE 8080

# 启动Tomcat
CMD ["sh", "catalina.sh", "run"]
