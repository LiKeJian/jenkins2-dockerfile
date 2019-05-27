Jenkins2 + Maven3 + JDK8 + Tomcat8
---

### 文件说明

* apache-tomcat-8.5.41.zip 为Tomcat + Jenkins压缩包，解压即可使用，Jenkins.war已经放置在Tomcat的webapps目录下

* settings.xml 为自定义Maven配置文件，如果需要设置私有仓库地址，修改此文件。此文件会替换掉Maven镜像的默认配置文件


### 挂载目录

* Jenkins配置目录为：```/root/.jenkins```，必须挂载到宿主机的磁盘下，否则重启容器之后Jenkins配置会被初始化

* Maven默认仓库目录为：```/root/.m2```，如果需要使用Maven构建项目，需要挂载到宿主机上，否则重启容器之后Maven本地仓库jar需与重新下载
