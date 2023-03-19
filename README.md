# docker-harbor


##本次项目是用shell脚本进行harbor的安装，目录部分分为，手动安装：harbor 和shell安装：shell——harbor

一、harbor简述
  
    Harbor是一款开源的Docker镜像仓库服务，在Github上目前有13.4k+Star。提供了基于角色的镜像访问机制，可以保护你的镜像安全  

一、手动安装(未详细介绍部分见目录代码)
  
    1.wget下载harbor包
    
       wget https://ghproxy.com/https://github.com/goharbor/harbor/releases/download/v2.5.3/harbor-offline-installer-v2.5.3.tgz
     
    2.tar解压包，创建存储路径
    
       tar -xvf harbor-offline-installer-v2.5.3.tgz
    
    3.修改Harbor的配置文件harbor.yml，修hostname，建议用vi的搜索功能，如果没有则自行添加，并注释掉https配置
      
      详细见目录里面的harbor.yaml 里面有详细说明
      
    4.执行包自带的harbor ：执行之前是否设置好存储路径，否则报错
    
    ./install.sh  or bash install.sh 都可以
    
   ✔ ----Harbor has been installed and started successfully.---- 出现此代码则代表成功，如果失败自己查日志百度/维基
  
        ![图片](https://user-images.githubusercontent.com/126040842/226101265-2449e387-c313-4792-96e0-2ae7ff58172a.png)

    5.启动成功后：docker images命令查看下安装Harbor安装的Docker镜像
    
    
    
二、shell部署


    1.实现思路：（所涉及到的重要命令）
        
        1.1安装harbor的核心步骤
        
          1.1.1下载包 用wget执行下载位置后解压
          
          1.1.2 修改配置文件
              
              修改主机号，密码等修改的部分  ：使用变量，实现用户交互，让用户输入就可以自动修改 （细节部分本次不做暂时，比如验证ip地址的准确啥的）
              
              
        1.2 所涉及的重要命令
            
            1.sed -ie 可以实现替代插入等强大的功能 不愧是文本三剑客 
            
            
            2.if ‘’‘’‘else 条件判断（shell）
              
            3. 设计选项，多定义几个函数，更加人性化
        
    2.代码实现：见/shellcode目录下
          
          
          
          
三、复盘和改进


      1.总结
      
     新增加的亮点：自行创建，定义了函数，设置了很多交互。将代码函数化，现代更加整洁，调用起来更加的方便。
      
      
      2.改进
    
     文本三件客，目前只会sed其余的还有待加强，虽然没有其余两件客的辅助，也能完成很多脚本的场景，但是实现起来不够简洁和高效。言外之意便是。条条大路通罗马，不如飞机来的快呀！！
    
    

  
