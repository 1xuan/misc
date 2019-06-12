# Install Applications

### pycharm:

PyCharm is now also available as a snap package. If you’re on Ubuntu 16.04 or later, you can install PyCharm from the command line:

	sudo snap install [pycharm-professional | pycharm-community] --classic
	
---

### Typora:

	wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

	# add Typora's repository

	sudo add-apt-repository 'deb https://typora.io/linux ./'

	sudo apt-get update

	# install typora

	sudo apt-get install typora
	
---

### wine：

如果是64位的Ubuntu，开启32位支持

	sudo dpkg --add-architecture i386
	
添加winehq库

	wget https://dl.winehq.org/wine-builds/Release.key
	sudo apt-key add Release.key
	sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
	
升级库

	sudo apt-get update
	
Ubuntu安装Wine稳定版

	sudo apt-get install --install-recommends winehq-stable
	
**参考**

[wine的安装](https://lado.me/2017/04/27/wine-run-windows-program-on-linux/) 
[wine的卸载](http://www.cnblogs.com/asimple41/p/3989608.html)
[Linux下使用Wine出现中文乱码的解决方法](http://www.linuxde.net/2011/10/1503.html)
[解决wine安装程序的乱码问题](http://www.voidcn.com/article/p-hltcebnw-eu.html)

---

# Install Packages

## translate-shell

	$ sudo apt-get install translate-shell
	
[translate-shell github](https://github.com/soimort/translate-shell)

**get the program into goldendict:**

First, configure `programs` option in sources of dictionaries, set `type` as `plain test` and set commandline as following:

- if translate english to chinese:

		trans -brief en:zh "%GDWORD%"
	
 - if translate chinese to english:
 
 		trans -brief zh:en "%GDWORD%"
 
 ---
 
## gnome-sushi

quickly preview files without opening them in a full-blown application. Select any file and press the space bar. The file will open in a simple preview window. Press the space bar again to dismiss the preview.

install program:

	sudo apt-get install gnome-sushi
	
To view a preview full-screen, press `F or F11`. Press `F or F11` again to leave full-screen, or press the space bar to exit the preview completely.

---

## install npm and less

	sudo apt install npm
	sudo npm install -g less
	
We can utilize `less` :

	lessc bootstrap.less > ~/temp/bootstrap.css
	
---

## install git:

	sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
  		libz-dev libssl-dev
  	sudo apt-get install git-core
  	
then check out : 
  
  	$ git --version
  	git version 1.8.1.2
	
---

## mysql：

在终端里面输入 

	sudo netstat -tap | grep mysql
	
查看是否安装

	 sudo apt-get install mysql-server mysql-client    # option
	 
在终端输入 

	mysql -uroot -p 
	
接下来会提示你输入密码，输入正确密码，即可进入
启动MySQL服务：
                       
	sudo start mysql
	
停止MySQL服务：
                   
	sudo stop mysql
	 
---

## virtualenv and Django:

安装pip:

	sudo apt-get install python3-pip

install package:

	sudo pip install virtualenv
	
new:

	virtualenv ll_env --python=python3        # Don't need to add --python=python3
	
active:

	source ll_env/bin/activate     # start
	pip install Django==1.11.9
	deactivate             # stop

other command:
	
	which virtualenv              # check path 
	pip list                      # check environment
	
**导出环境中的包到文件中**

	pip freeze > packages.txt
	
**遍历安装文件中的库**

	pip install -r packages.txt
		
---

## install GoldenDict

---

## you-get

	pip install you-get
	
---

# Eviroment

## selenium

打开firefox出错

	 'geckodriver' executable needs to be in PATH. 
	 
下载对应的geckodriver放到对应的文件夹

[Selenium using Python - Geckodriver executable needs to be in PATH](https://stackoverflow.com/questions/40208051/selenium-using-python-geckodriver-executable-needs-to-be-in-path)

---

# Configure

## chinese input configuration:
	
first install chinese(simplified) in language supportand install frame of ibus:

	sudo apt-get install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4
	im-config -s ibus
	sudo apt-get install ibus-sunpinyin
		
reboot or log out and setting:

	sudo ibus-setup
add new input method
in text entry: add chinese(sunpinyin)
		
---












