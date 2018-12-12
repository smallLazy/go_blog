/*
Navicat MySQL Data Transfer

Source Server         : my_online
Source Server Version : 50722
Source Host           : 128.1.136.233:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-12-11 13:47:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `pwd` char(32) NOT NULL COMMENT '密码',
  `header` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'lazy', 'ccc364491277eed5f5e628480c6742ac', 'http://flazy-blog-images.test.upcdn.net//2017/11/28/upload_kz8lns0tjkbmi885f6gjoevzcx9cqhif.jpg', null, null);
INSERT INTO `admin_user` VALUES ('2', 'felix', '4c6435a7958e8bdf674bb3fd00f8bc52', null, null, null);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cat_id` int(11) NOT NULL,
  `art_title` varchar(255) NOT NULL COMMENT '文章id',
  `article_short_detail` text COMMENT '分类id',
  `article_long_detail` text COMMENT '详情',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', '3', '搭建LAMP', 'Ubuntu 16.04 安装php，mysql，nginx', '###### Ubuntu 16.04安装mysql\n\n>使用 `root`账号\n\n```php\n	apt-get install mysql-server\n	apt-get install mysql-client\n	apt-get install libmysqlclient-dev\n```\n如果中途有问题就执行 `apt-get update`\n\n>  以上3个软件包安装完成后，使用如下命令查询是否安装成功\n\n```php\n	netstat -tap | grep mysql\n```\n查询结果如下图所示，表示安装成功。\n```shell\nroot@ubuntu:~# netstat -tap | grep mysql\ntcp6      0      0 [::]:mysql              [::]:*                  LISTEN      7510/mysqld    \nroot@ubuntu:~#\n```\n>设置mysql远程访问\n\n 编辑mysql配置文件 `vim /etc/mysql/my.cnf`，将其中 `bind-address = 127.0.0.1` 注释\n\n 使用 `root` 进入mysql命令行，执行如下2个命令，示例中mysql的 `root` 账号密码：`root`\n```SQL\nroot@ubuntu:~# mysql -uroot -proot\nmysql>grant all on *.* to root@\'%\' identified by \'root\' with grant option;\n```\n` *.*` ：第一个*代表数据库名；第二个*代表表名。这里的意思是所有数据库里的所有表都授权给用户。 `root` ：授予root账号。`%`：表示授权的用户IP可以指定，这里代表任意的IP地址都能访问MySQL数据库。`password`：分配账号对应的密码，这里密码自己替换成你的  `mysql root` 帐号密码。\n\n 刷新权限信息 `mysql>flush privileges; `\n\n重启mysql  `/etc/init.d/mysql restart`\n\n###### Ubuntu 安装Nginx\n```php\n	apt-get -y install nginx\n	service nginx start\n```\n输入您的Web服务器的IP地址或主机名到浏览器（例如`http://192.168.1.100`），如果看到`nginx`欢迎页，则说明安装成功。\n\n在`Ubuntu16.04`的默认`nginx`的文档根目录为`/var/www/html`\n\n###### Ubuntu 安装 PHP\n```php\napt-get -y install php7.0-fpm\n```\n###### 配置 Nginx\n>打开配置文件  `vim  /etc/nginx/nginx.conf`\n\n配置是很容易理解 (你可以点击 [nginx官网](http://wiki.nginx.org/NginxFullExample \"nginx\"))\n\n>重新加载 php-fpm\n\n`service php7.0-fpm reload`\n\n>在默认目录`/var/www/html` 下建立探针文件(`vim /var/www/html/info.php`)\n\n```php\n<?php\n	phpinfo();\n?>\n```\n>浏览器访问 (e.g. http://192.168.1.100/info.php)\n>重新加载Nginx`service nginx reload`\n\n\n\n', '2017-11-15 10:32:55', '2018-05-15 09:49:40');
INSERT INTO `article` VALUES ('3', '3', 'Git 常用命令', '史上最浅显易懂的Git教程！', '```shell\n	git --help #git 帮助列表 \n	git add <file> #将工作文件修改提交到本地暂存区\n	git add . #将所有修改过的工作文件提交暂存区\n	git commit -m\'说明\' #将暂存区文件提交到当前分支\n	git status #查看当前仓库状态\n	git pull # 抓取远程仓库所有分支更新并合并到本地\n	git push # push所有分支\n	git push origin master # 将本地主分支推到远程主分支\n	git diff <file> #查看文件的改动\n	git log #查看提交日志\n	git reset --hard HEAD^ # 把当前版本回退到上一个版本\n	git reset --hard 提交点id #回到指定提交点\n	git reset HEAD 文件 #把暂存区的文件修改撤销掉并放回工作区\n	git reflog #git reflog用来记录你的每一次命令,而git log记录的是每一次提交\n	git checkout 文件名 #撤销操作\n	git branch #查看主分支\n	git checkout -b sh #创建病切换到sh分支(分支名称随意)\n	git checkout master #切换到主分支（想要切换哪个分支就写哪个分支名）\n	git branch -D sh #删除本地分支\n```', '2017-11-15 10:32:55', '2017-11-28 16:55:38');
INSERT INTO `article` VALUES ('4', '4', 'PHP 常用函数', 'PHP 常用函数', '###### PHP 常用的函数\n详细更多函数请参考 [phpmanual手册](http://php.net/manual/zh/funcref.php \"phpmanual手册\")\n\n1.`array_splice ( $arr , $offest, $count )`	#去掉数组中某个元素\n`$arr`传入的数组，`$offest`从哪个位置开始，`$count`取多少个\n\n2.`json_encode`	# 数组转json\n\n3.`json_decode`	json转数组', '2017-11-16 16:06:19', '2017-11-16 16:06:19');
INSERT INTO `article` VALUES ('5', '5', 'mysql之sql_mode', 'MySQL数据类型：SQL_MODE设置不容忽视', '`SQL_MODE`可能是比较容易让开发人员和DBA忽略的一个变量，默认为`空`。`SQL_MODE`的设置其实是比较冒险的一种设置，因为在这种设置下可以允许一些非法操作，比如可以将`NULL`插入`NOT NULL`的字段中，也可以插入一些非法日期，如“`2012-12-32`”。因此在生产环境中强烈建议开发人员将这个值设为严格模式，这样有些问题可以在数据库的设计和开发阶段就能发现，而如果在生产环境下运行数据库后发现这类问题，那么修改的代价将变得十分巨大。此外，正确地设置SQL_MODE还可以做一些约束(`Constraint`)检查的工作。\n> 查询当前的设置\n\n`select @@sql_mode`或`select @@global.sql_mode`\n\n>重新设置\n\n`set sql_mode=\'NO_ENGINE_SUBSTITUTION`或`set global sql_mode=\'NO_ENGINE_SUBSTITUTION\'`\n\n注意：\n重新设置后如果没有立马生效，请关闭数据库连接后再打开', '2017-11-20 09:51:59', '2017-11-20 09:52:17');
INSERT INTO `article` VALUES ('6', '4', 'php检查是否中文姓名', 'php检查是否中文姓名', '```php\nfunction isChineseName($v)\n{\n    $pattern = \'/^[\\x{4e00}-\\x{9fa5}]{2,4}$/u\';\n    return preg_match($pattern, $v);\n}\n```', '2017-11-20 10:19:03', '2017-11-20 10:19:03');
INSERT INTO `article` VALUES ('7', '3', 'ubuntu下安装常用的软件', '更快更方便的操作linux', '1. 安装vim（ `vim` 是Unix及类Unix系统文本编辑器）\n`sudo apt-get install -y vim`\n\n2. 安装openssh-server（SSH协议族可以用来进行远程控制， 或在计算机之间传送文件）\n`sudo apt-get install -y openssh-server`\n\n3. 安装virtualbox(虚拟机)\n`sudo apt-get install -y virtualbox` \n或\n进入`virtualbox` 下载页面 [virtualbox下载](https://www.virtualbox.org/wiki/Downloads \"virtualbox\")，根据自己电脑操作系统选择不同的版本下载即可。\n\n4. 安装chrome浏览器\n`sudo apt-get install -y chromium-browser`\n\n5. 安装`netstat`（如果没有netstart命令的话）\n`sudo apt-get install -y net-tools`\n', '2017-11-20 13:57:30', '2017-11-20 14:17:33');
INSERT INTO `article` VALUES ('8', '3', 'ssh设置免密码登录另一台电脑', 'ssh设置免密码登录另一台电脑', '>假如本地电脑为A，远程电脑为B，通过ssh 连接远程，打开命令行执行以下代码\n\n`ssh root@12.34.45`\n\n`root`为远程的用户名，`12.34.56`是远程的ip\n\n执行该命令后，会出现以下情况\n\n![输入密码](http://www.flazy.top/images/front/command/2.png)\n\n输入远程密码即可登录到远程\n\n注意：\n\n如果是第一次连接，则会提示如下情况\n\n![是否连接](http://www.flazy.top/images/front/command/1.png)\n\n输入`yes`，然后输入远程的密码即可登录远程\n\n>现在我们来免密码登录远程\n\n进入本地电脑`家目录/.ssh`, 查看`id_rsa.pub`内容\n```shell\ncd ~/.ssh\ncat id_rsa.pub\n```\n将该内容复制\n\n问题：如果A或者B上当前用户名的家目录下没有`.ssh`目录则可以用\n`ssh-keygen -t rsa -P`来生成\n\n然后登录远程，进入到`家目录/.ssh`,编辑`authorized_keys`,粘贴到该文件中\n```shell\nssh root@127.0.0.1\ncd ~/.ssh\nvim authorized_keys\n```\n然后退出，再次登录远程时候就不需要输入密码了。\n\n', '2017-11-21 11:54:30', '2017-11-21 13:30:22');
INSERT INTO `article` VALUES ('9', '4', 'php上传文件到upyun', '将静态文件放到upyun中，减轻该项目的笨重', '> 注册 [upyun](https://www.upyun.com/ \"upyun\") 账号, 注册完毕后登录 `upyun`, 查看文档创建项目。\n\n###### html页面\n```html\n<div class=\"form-group\">\n        <label class=\"col-sm-2 control-label\">上传头像</label>\n        <div class=\"input-group\">\n            <input type=\"text\" class=\"form-control\" id=\"file_url\">\n            <span class=\"input-group-btn\">\n                <input type=\"file\" id=\"file_upload\" style=\"display: none\" onchange=\"upload(this)\" name=\"file\"/>\n                <button type=\"button\" class=\"btn btn-primary\" onclick=\"$(this).parent(\'span\').find(\'#file_upload\').click();\">上传</button>\n            </span>\n        </div>\n    </div>\n```\n注释： 本人用的是bootstrap 框架，感兴趣的可以看看[bootstrap](http://www.bootcss.com/\")\n\n效果如下：\n![上传头像](http://www.flazy.top/images/front/command/3.png)\n\n###### php 代码\n获得上传到upyun的密钥\n```php\npublic function getApiKey($file_type_limit)\n    {\n        $bucket = \'flazy\';//又拍云服务名称\n        $apiKey = \'dsdSdafasdf\';//又拍云API密钥\n        $timeout = 1800;//过期时间\n        $data = array(\n            \'bucket\' => $bucket,\n            \'expiration\' => time() + $timeout,\n            \'allow-file-type\'       =>  $file_type_limit,\n            \'save-key\' => \'/{year}/{mon}/{day}/upload_{random32}{.suffix}\',\n        );\n        $policy = base64_encode(json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));\n        $signature = md5(\"{$policy}&{$apiKey}\");\n        $apiKey = array(\n            \'policy\'    =>  $policy,\n            \'signature\' =>  $signature,\n            \'bucket\'    =>  $bucket\n        );\n        return $apiKey;\n    }\n```\n\n又拍云上传有很多参数，根据你所需要的要求设定不同的参数。\n\n###### js 代码\n```JavaScript\nfunction upload(obj){\n    var formData = new FormData();\n    var url = new getUrl();\n    $.ajax({\n        url : url.apiUploadLimitUrl,\n        type: \'POST\',\n        data: formData,\n        processData : false,\n        contentType : false,\n        async: false,\n        success: function(data) {\n            var data = JSON.parse(data);\n            if(data.code == 200) {\n                formData.append(\"policy\", data[\'policy\']);\n                formData.append(\"signature\", data[\'signature\']);\n                formData.append(\"file\", $(obj)[0].files[0]);\n                var res = $.upload_upyun(url, data, formData);\n                res = JSON.parse(res);\n                if(res[\'code\'] == 200) {\n                    alert(res[\'message\']);\n                }else{\n                    alert(res[\'message\']);\n                }\n            }else{\n                alert(data.msg);\n            }\n        }\n    });\n};\n\n$.upload_upyun = function upload_upyun(url, data, formData) {\n    var result;\n    $.ajax({\n        url: url.upyunApiUrl + data[\'bucket\'],\n        type: \"POST\",\n        data: formData,\n        processData: false,\n        contentType: false,\n        async: false,\n        success: function (data) {\n            result = data;\n        },\n        error: function (responseText) {\n            result = responseText[\'responseText\'];\n        }\n    });\n    return result;\n}\n\nfunction getUrl() {\n    this.upyunApiUrl = \"http://v0.api.upyun.com/\"; //请求upyun接口\n    this.apiUploadLimitUrl = \"\"; // 请求后台得到上传又拍云的参数\n}\n```', '2017-11-27 17:12:57', '2017-11-29 17:37:05');
INSERT INTO `article` VALUES ('11', '3', '终端下有趣的命令合集', '终端下有趣的命令合集', '`sl`简介：\n\n你可能了解Linux的ls命令，并经常使用它来查看文件夹的内容。但是，有些时候你可能会拼写成sl ,这时我们应该如何获得一些乐趣而不是看见“command not found”呢？ \n某编程牛人也经常犯把ls敲成sl的错误，所以他自己编了一个程序娱乐一下,这个程序的作用很简单，就是当你输入sl的时候终端会出现一个火车呼啸而过～～\n安装`apt-get install sl`\n\n`cmatrix` 简介：\n《黑客帝国》的代码雨视觉特效。\n安装 `apt-get install cmatrix`', '2017-11-30 15:13:25', '2017-11-30 15:13:25');
INSERT INTO `article` VALUES ('12', '5', 'MySQL 开发', 'MySQL 使用技巧', '去', '2018-01-09 14:20:40', '2018-01-09 14:20:40');
INSERT INTO `article` VALUES ('13', '7', '切换场景传参数问题', 'Cocos creator 切换场景如何传参以及接收参数', '1、在场景1中创建一个节点，该节点与Canvas同级目录下。\n2、然后在场景1中添加如下代码\n```javascript\ncc.game.addPersistRootNode(this.node.parent.getChildByName(\'is_open_music\'));\n```\n3、在场景2中添加如下代码\n```javascript\ncc.director.getScene().getChildByName(\'is_open_music\')```\n', '2018-08-31 10:44:05', '2018-08-31 10:44:05');
INSERT INTO `article` VALUES ('14', '7', 'cocos creator 屏幕分辨率适配问题', '解决 iPhoneX,Mix 2 屏幕不适配问题', '## iPhoneX，MIX2 屏幕分辨率(宽高比例 w:h)\n| IPhoneX  | MIX2  |\n| :------------: | :------------: |\n| 1:2  | 9:18  |\n## 设计分辨率\n    设计分辨率 是内容生产者在制作场景时使用的分辨率蓝本，而 屏幕分辨率 是游戏在设备上运行时的实际屏幕显示分辨率\n	市场上普遍分辨率为 750*1334， 宽高比例为 375：667\n\n## 简单粗暴的方式解决iPhoneX 和 MIX2 出现黑边现象\n    假设 我们默认设计分辨率为 750 * 1334，即 375：667\n	要使背景不出现黑边只要固定高度即可\n\n', '2018-11-20 16:03:04', '2018-11-20 16:03:04');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Html', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `category` VALUES ('2', 'Yii', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `category` VALUES ('3', 'Linux', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `category` VALUES ('4', 'PHP', '2017-11-16 13:59:09', '2017-11-16 15:08:46');
INSERT INTO `category` VALUES ('5', 'Mysql', '2017-11-20 09:44:56', '2017-11-20 09:44:56');
INSERT INTO `category` VALUES ('6', 'UI', '2017-11-23 10:05:49', '2017-11-23 10:05:49');
INSERT INTO `category` VALUES ('7', 'Cocos Creator', '2018-08-31 10:38:09', '2018-08-31 10:38:09');
INSERT INTO `category` VALUES ('8', 'Server', '2018-12-06 14:10:12', '2018-12-06 14:10:41');

-- ----------------------------
-- Table structure for friendship_link
-- ----------------------------
DROP TABLE IF EXISTS `friendship_link`;
CREATE TABLE `friendship_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `url` varchar(255) NOT NULL COMMENT '友情链接url',
  `link_cat_id` int(11) DEFAULT NULL COMMENT '链接分类',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendship_link
-- ----------------------------
INSERT INTO `friendship_link` VALUES ('1', 'sweetalert', 'https://sweetalert.js.org/', null, '弹窗特效', null, null);
INSERT INTO `friendship_link` VALUES ('2', 'Smister', 'http://www.smister.com', null, '学习的网站', null, null);
INSERT INTO `friendship_link` VALUES ('3', 'jQuery', 'http://www.jq22.com', '1', 'jquery各种特效插件', null, null);
INSERT INTO `friendship_link` VALUES ('4', 'Yii Framework', 'http://www.yiichina.com/', null, 'Yii Framework中文网', null, null);
INSERT INTO `friendship_link` VALUES ('5', 'Bootstrap', 'http://www.bootcss.com/', '1', null, null, null);
INSERT INTO `friendship_link` VALUES ('6', 'laravel', 'http://www.golaravel.com/', null, 'laravel框架', null, null);
INSERT INTO `friendship_link` VALUES ('7', 'composer', 'http://www.phpcomposer.com/', null, 'composer中文网', null, null);
INSERT INTO `friendship_link` VALUES ('8', 'phpmyadmin', 'https://www.phpmyadmin.net/', null, 'php管理mysql的可视化工具', null, null);
INSERT INTO `friendship_link` VALUES ('9', 'easyicon', 'http://www.easyicon.net/', null, '提供超过五十万个PNG、ICO、ICNS格式图标搜索、图标下载服务', '2017-11-16 13:51:21', '2017-11-16 13:51:21');
INSERT INTO `friendship_link` VALUES ('10', 'phpmanual', 'http://php.net/manual/en/', null, 'php官网', '2017-11-16 15:10:45', '2017-11-16 15:33:55');
INSERT INTO `friendship_link` VALUES ('14', 'gitee', 'https://gitee.com/', null, '码云(gitee.com)是开源中国社区团队推出的基于Git的快速的、免费的、稳定的在线代码托管平台,不限制私有库和公有库数量', '2017-11-20 10:03:58', '2017-11-20 14:19:03');
INSERT INTO `friendship_link` VALUES ('15', 'virtualbox', 'https://www.virtualbox.org/', null, '这是一款虚拟机软件', '2017-11-20 14:18:40', '2017-11-20 14:18:40');
INSERT INTO `friendship_link` VALUES ('16', 'docker 官网', 'https://www.docker.com/', null, 'Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。', '2017-11-21 14:03:30', '2017-11-21 14:03:30');
INSERT INTO `friendship_link` VALUES ('17', 'cordova', 'http://cordova.apache.org/', null, 'Cordova是一个用基于HTML、CSS和JavaScript的，用于创建跨平台移动应用程序的快速开发平台。', '2017-11-22 14:52:32', '2017-11-22 14:52:32');
INSERT INTO `friendship_link` VALUES ('18', '黑客', 'http://www.freebuf.com/', null, '黑客学习平台', '2017-11-30 11:52:23', '2017-11-30 11:52:23');

-- ----------------------------
-- Table structure for link_category
-- ----------------------------
DROP TABLE IF EXISTS `link_category`;
CREATE TABLE `link_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '链接分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link_category
-- ----------------------------
INSERT INTO `link_category` VALUES ('1', '前端相关');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT 'icon',
  `controller` varchar(255) DEFAULT NULL COMMENT '控制器',
  `action` varchar(255) DEFAULT NULL COMMENT '方法',
  `c_a` varchar(255) DEFAULT NULL COMMENT '控制器-方法',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '用户管理', 'fa-user', 'user', null, null, '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('2', '1', '创建管理员', null, 'user', 'add', 'user/add', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('3', '1', '更改密码', null, 'user', 'update-pwd', 'user/update-pwd', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('4', '0', '文章管理', 'fa-clipboard', 'article-manage', '', '', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('5', '4', '文章列表', null, 'article-manage', 'list', 'article-manage/list', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('6', '4', '添加文章', null, 'article-manage', 'add', 'article-manage/add', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('7', '0', '菜单管理', 'fa-cog', 'menu', null, null, '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('8', '7', '菜单列表', null, 'menu', 'list', 'menu/list', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('9', '7', '添加菜单', null, 'menu', 'add', 'menu/add', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('10', '0', '友情链接', 'fa-link', 'friendship-link', '', '', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('11', '10', '链接列表', null, 'friendship-link', 'list', 'friendship-link/list', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('12', '10', '添加链接', null, 'friendship-link', 'add', 'friendship-link/add', '2017-11-16 13:59:09', '2017-11-16 13:59:09');
INSERT INTO `menu` VALUES ('19', '4', '分类管理', '', 'article-manage', 'category-manage', 'article-manage/category-manage', '2017-11-16 13:59:09', '2017-11-16 15:05:35');
INSERT INTO `menu` VALUES ('20', '1', '更换头像', null, 'user', 'update-header', 'user/update-header', '2017-11-23 10:51:17', '2017-11-23 10:51:17');
INSERT INTO `menu` VALUES ('22', '21', '创建项目', null, 'upload-configure', 'add', 'upload-configure/add', '2017-11-27 15:46:27', '2017-11-27 15:46:27');
INSERT INTO `menu` VALUES ('23', '21', '配置列表', null, 'upload-configure', 'list', 'upload-configure/list', '2017-11-27 15:46:54', '2017-11-27 15:46:54');
INSERT INTO `menu` VALUES ('24', '0', '上传配置', 'fa-cloud-upload', 'upload-configure', '', '', '2017-11-27 15:48:13', '2017-11-27 15:50:00');
INSERT INTO `menu` VALUES ('25', '24', '创建项目', null, 'upload-configure', 'add', 'upload-configure/add', '2017-11-27 15:48:47', '2017-11-27 15:48:47');
INSERT INTO `menu` VALUES ('26', '24', '配置列表', null, 'upload-configure', 'list', 'upload-configure/list', '2017-11-27 15:49:20', '2017-11-27 15:49:20');

-- ----------------------------
-- Table structure for project_configure
-- ----------------------------
DROP TABLE IF EXISTS `project_configure`;
CREATE TABLE `project_configure` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `project_name` varchar(255) NOT NULL COMMENT '项目名称',
  `ip_limit` varchar(255) DEFAULT NULL COMMENT 'ip限制',
  `domain_limit` varchar(255) DEFAULT NULL COMMENT '域名限制',
  `file_type_limit` varchar(255) DEFAULT NULL COMMENT '类型限制',
  `status` char(1) NOT NULL COMMENT '状态（0禁用，1启用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `key` char(32) NOT NULL COMMENT '生成密钥key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_configure
-- ----------------------------
INSERT INTO `project_configure` VALUES ('8', '上传头像', '116.231.57.89', 'www.flazy.top', 'jpg,png', '1', '2017-11-27 15:53:06', '2017-11-27 15:53:06', 'e6909be33e1ba007a5c1d993f614597e');
