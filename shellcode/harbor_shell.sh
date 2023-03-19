#!/bin/bash

####这是一个自动化安装harbor的脚本，目标：自主思考设计shell脚本的实现
##echo "输出 $? !"  函数的返回值可以用$? 来调用前提是函数内有return $() 只对上一条参数管用。一条一显示
#注意：所有函数在使用前必须定义。这意味着必须将函数放在脚本开始部分，直至shell解释器首次发现它时，才可以使用。调用函数仅使用其函数名即可。 
# 对于含有参数的：使用$n的形式获取参数的值 $1 表示第一参数 在函数体中直接用调用函数时直接输入funWithParam 1 如这个
# 


function preFun(){
	mkdir -p /miku/test1
	wget -cP /miku/test1  https://ghproxy.com/https://github.com/goharbor/harbor/releases/download/v2.5.3/harbor-offline-installer-v2.5.3.tgz

	cd /miku/test1
	echo "下载完成请在/miku/test1下查看"

	#开始解压
	cd /miku/test1
	tar -xvf harbor-offline-installer-v2.5.3.tgz
	echo "解压ok"
}



function xiugaiFun(){
	cd harbor
	cp harbor.yml.tmpl harbor.yml
        file='/miku/test1/harbor/harbor.yml'
        #grep  xx  harbor.yml

###请在这里修改你的主机名之类的 ：xxx是你替换的选项 可以选择替换端口和主机以及以存储路径，后续有需要再添加
        sed -i 's/hostname: reg.mydomain.com/hostname: x.x.x.x /g' $file
        sed -i 's/port: 80 /port :xx  /g' $file
        sed -i 's/data_volume: /data/data_volume: /xxx/g' $file

}

function runFun(){
	./install.sh
}

function checkFun(){
	touch err.txt
	./insrall.sh 2>>err.txt
#用于判断是否出错并将结果给err
	if wc -l err.txt
	then
		echo '执行ok'
	else
		echo '脚本执行完成 ：可以在err.txt查看错误信息'
	fi 
}


function startFun(){
	preFun
	xiugaiFun
 	runFun
	checkFun	
}



if pgrep harbor >> /dev/null
then
        echo "你已经安装了该服务，不需要重复安装"
	exit 0
else
	echo "你没有安装该服务，现在开始安装"
	startFun

fi

#exit 0

