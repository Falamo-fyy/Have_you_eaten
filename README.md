下面说明不完善，待修改
解压Have you eaten.zip和nodeMysqlDemo.zip文件到同一目录下
Have you eaten.zip为程序源码
nodeMysqlDemo.zip为程序后端使用的Node.js和Express搭建的HTTP服务器

首先确保你已经安装MySQL、Node.js和微信小程序开发者工具
管理员身份打开node.js command prompt命令行
先跳转到解压后的文件夹nodeMysqlDemo下
安装Express框架
npm install express --save

安装nodemon监控文件修改
npm install nodemon -g

除此之外需要在node中安装mysql或mysql2，以支持连接

打开server.js文件，修改服务器配置为你的MySQL数据库信息
最后在命令行使用命令运行本地服务器
node server.js

在MySQL中，创建数据库elm
运行数据库文件elm.sql导入数据库文件

在微信小程序开发者工具中关闭域名校验

提示Error: ER_NOT_SUPPORTED_AUTH_MODE: Client does not support authentication protocol解决方案
启动数据库 net start mysql
登录数据库 mysql -u root -p
use elm
alter user 'root'@'localhost' identified with mysql_native_password by '123456'; //123456为数据库密码
flush privileges;  //即可解决 

初始账号密码为
peadmin
admin
