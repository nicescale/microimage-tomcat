
![logo](http://192.168.1.102:7777/assets/ca571ff5-c630-45e8-897e-825fa2eb7ba5)

## 如何使用该镜像

运行默认的tomcat服务器 (`CMD ["catalina.sh", "run"]`):

```console
$ docker run -it --rm index.csphere.cn/microimages/tomcat:8.0
```

你可以打开 `http://container-ip:8080` 进行测试，或者你需要将端口映射到宿主机上的8888端口:

```console
$ docker run -it --rm -p 8888:8080 index.csphere.cn/microimages/tomcat:8.0
```

然后你就可以在浏览器地址栏里输入 `http://localhost:8888` 或 `http://host-ip:8888` 来看到效果了。

该镜像的默认Tomcat环境变量有:

	CATALINA_BASE:   /usr/local/tomcat
	CATALINA_HOME:   /usr/local/tomcat
	CATALINA_TMPDIR: /usr/local/tomcat/temp
	JRE_HOME:        /usr
	CLASSPATH:       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar

配置文件位于 `/usr/local/tomcat/conf/`. 默认情况下没有在 "manager-gui" 角色里配置用户，如果你需要使用该应用，则必须定在 `tomcat-users.xml` 配置中定义这样一个用户。

## 授权和法律

该镜像由希云制造，未经允许，任何第三方企业和个人，不得重新分发。违者必究。

## 支持和反馈

该镜像由希云为企业客户提供技术支持和保障，任何问题都可以直接反馈到: `docker@csphere.cn`
