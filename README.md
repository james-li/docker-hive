# docker hive & zookeeper
这是一个集成docker hive 3.1.2和zookeeper的docker项目。需要安装docker-compose
https://docs.docker.com/compose/
在这个docker项目里，包括三个zookeeper进程，分别映射到端口2181/2182/2183。

运行docker：
```
./run-docker-compose.sh up -d
```
停止docker：
```
./run-docker-compose.sh down
```

# 测试
客户端需要配置hive-server的hostname，指向docker服务器的ip
## 直接访问hive服务器
运行beeline:
```
 beeline
 SLF4J: Class path contains multiple SLF4J bindings.
 SLF4J: Found binding in [jar:file:/mnt/d/work/src/beeline/apache-hive-3.1.2-bin/lib/log4j-slf4j-impl-2.10.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
 SLF4J: Found binding in [jar:file:/mnt/d/work/src/beeline/hadoop-2.8.0/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
 SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
 SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
 Beeline version 3.1.2 by Apache Hive
 beeline> !connect jdbc:hive2://192.168.4.40:10000/default
 Connecting to jdbc:hive2://192.168.4.40:10000/default
 Enter username for jdbc:hive2://192.168.4.40:10000/default:
 Enter password for jdbc:hive2://192.168.4.40:10000/default:
 Enter password for jdbc:hive2://192.168.4.40:10000/default: Connected to: Apache Hive (version 3.1.2)
 Driver: Hive JDBC (version 3.1.2)
 Transaction isolation: TRANSACTION_REPEATABLE_READ
 0: jdbc:hive2://192.168.4.40:10000/default>
 ```
 ## 通过zookeeper访问hive服务器
 运行beeline:
 ```
  beeline
  SLF4J: Class path contains multiple SLF4J bindings.
  SLF4J: Found binding in [jar:file:/mnt/d/work/src/beeline/apache-hive-3.1.2-bin/lib/log4j-slf4j-impl-2.10.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
  SLF4J: Found binding in [jar:file:/mnt/d/work/src/beeline/hadoop-2.8.0/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
  SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
  SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
  Beeline version 3.1.2 by Apache Hive
  beeline> !connect jdbc:hive2://192.168.4.40:2181,192.168.4.40:2182,192.168.4.40:2183/;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2
  ```
  这里**192.168.4.40**是运行docker服务器的ip地址。

