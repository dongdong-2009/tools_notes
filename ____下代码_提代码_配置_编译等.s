//OV5640 On Tiny4412
http://wiki.friendlyarm.com/wiki/index.php/Matrix_-_CAM500A/zh



---------------------------------------------------------------------------------------
 利用ssh传输文件

在linux下一般用scp这个命令来通过ssh传输文件。

1、从服务器上下载文件
scp username@servername:/path/filename /var/www/local_dir（本地目录）

 例如scp root@192.168.0.101:/var/www/test.txt  把192.168.0.101上的/var/www/test.txt 的文件下载到/var/www/local_dir（本地目录）

2、上传本地文件到服务器
scp /path/filename username@servername:/path   

例如scp /var/www/test.php  root@192.168.0.101:/var/www/  把本机/var/www/目录下的test.php文件上传到192.168.0.101这台服务器上的/var/www/目录中

 

3、从服务器下载整个目录
scp -r username@servername:/var/www/remote_dir/（远程目录） /var/www/local_dir（本地目录）

例如:scp -r root@192.168.0.101:/var/www/test  /var/www/  

4、上传目录到服务器
scp  -r local_dir username@servername:remote_dir
例如：scp -r test  root@192.168.0.101:/var/www/   把当前目录下的test目录上传到服务器的/var/www/ 目录

注：目标服务器要开启写入权限。
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
 modprobe(module probe)
功能说明：自动处理可载入模块。

语　　法：modprobe [-acdlrtvV][--help][模块文件][符号名称 = 符号值]

补充说明：modprobe可载入指定的个别模块，或是载入一组相依的模块。modprobe会根据depmod所产生的相依关系，决定要载入哪些模块。若在载入过程中发生错误，在modprobe会卸载整组的模块。

 
insmod 与 modprobe 都是载入 kernel module，不过一般差别于 modprobe 能够处理 module 载入的相依问题。
　　比方你要载入 a module，但是 a module 要求系统先载入 b module 时，直接用 insmod 挂入通常都会出现错误讯息，不过 modprobe 倒是能够知道先载入 b module 后才载入 a module，如此相依性就会满足。
　　不过 modprobe 并不是大神，不会厉害到知道 module 之间的相依性为何，该程式是读取 /lib/modules/2.6.xx/modules.dep 档案得知相依性的。而该档案是透过 depmod 程式所建立。
补充说明：modprobe可载入指定的个别模块，或是载入一组相依的模块。modprobe会根据depmod所产生的相依关系，决定要载入哪些模块。若在载入过程中发生错误，在modprobe会卸载整组的模块。

[举例]
*查看modules的配置文件：
$modprobe -c
这里，可以查看modules 的配置文件，比如模块的别名是什么等。会打印许多行信息，例如其中的一行会类似如下：
alias symbol:ieee80211_remove_wds_addr wlan

*列出内核中所有已经或者未挂载的所有模块：
$modprobe -l
这里，我们能查看到我们所需要的模块，然后根据我们的需要来挂载；其实modprobe -l 读取的模块列表就位于 /lib/modules/'uname -r' 目录中；其中uname -r 是内核的版本.例如输出结果的其中一行是：
/lib/modules/2.6.27-7-generic/kernel/arch/x86/oprofile/oprofile.ko

*挂载vfat模块：
#modprobe vfat
这里，使用格式"modprobe 模块名"来挂载一个模块。挂载之后，用lsmod可以查看已经挂载的模块。模块名是不能带有后缀的，我们通过modprobe -l 所看到的模块，都是带有.ko 或.o后缀。

*移除已经加载的模块：
#modprobe -r  模块名
这里，移除已加载的模块，和rmmod 功能相同。注意：模块名是不能带有后缀的，我们通过modprobe -l 所看到的模块，都是带有.ko 或.o后缀. 

与内核模块操作相关的命令还有:lsmod     modinfo   depmod    rmmod    inmod    modprobe   

 

    modprobe 命令是根据depmod -a的输出/lib/modules/version/modules.dep来加载全部的所需要模块。　　
    删除模块的命令是：modprobe -r filename　　
    系统启动后，正常工作的模块都在/proc/modules文件中列出。使用lsmod命令也可显示相同内容。　　
    在内核中有一个“Automatic kernel module loading"功能被编译到了内核中。当用户尝试打开某类型的文件时，内核会根据需要尝试加载相应的模块。/etc/modules.conf或 /etc/modprobe.conf文件是一个自动处理内核模块的控制文件。

    参　　数：
      -a或--all 　载入全部的模块。 
      -c或--show-conf 　显示所有模块的设置信息。 
      -d或--debug 　使用排错模式。 
      -l或--list 　显示可用的模块。 
      -r或--remove 　模块闲置不用时，即自动卸载模块。 
      -t或--type 　指定模块类型。 
      -v或--verbose 　执行时显示详细的信息。 
      -V或--version 　显示版本信息。 
      -help 　显示帮助。 
---------------------------------------------------------------------------------------
//SONY环境配置教程
https://wiki.sonyericsson.net/androiki/Setup_Your_Develop_Environment

////////////////////////////////////////////////////////////////////
//配置git，用Repo脚本同步代码
////////////////////////////////////////////////////////////////////
1.	ssh-keygen
2.	cd .ssh/
3.	cat id_rsa.pub
3.1.	ssh-add	//新生成的ssh密钥，可能并不能立刻被PC所找到，所以需要执行以下命令，把新密钥添加到ssh-agent的高速缓存中?
4.	このFileの中身を　http://review.sonyericsson.net/#/settings/ssh-keys　に　Add　Key　にいれる。
5.	ssh guanghu.xa.shi@review.sonyericsson.net -p 29418		//上記Fileの中身を入れないと、Permission denied (publickey)Errorが出る.
6.	ssh guanghu.xa.shi@android-jpto.sonyericsson.net -p 29418	//公钥被推送到服务器后，可通过ssh命令进行验证.入力すると、下記が提示されるので、確認だけ
									（有时需要很长时间，才能进行此验证）
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  ****    Welcome to Gerrit Code Review    ****

  Hi Guanghu Shi, you have successfully connected over SSH.

  Unfortunately, interactive shells are disabled.
  To clone a hosted Git repository, use:

  git clone ssh://guanghu.xa.shi@review.sonyericsson.net:29418/REPOSITORY_NAME.git

Connection to review.sonyericsson.net closed.
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー


//配置git
git config --global user.email guanghu.xa.shi@sonymobile.com
git config --global user.name "guanghu.xa.shi"
cat ~/.gitconfig
git config --global url.ssh://guanghu.xa.shi@android-jpto.sonyericsson.net:29418/.insteadOf git://review.sonyericsson.net/
git config --global --add url.ssh://guanghu.xa.shi@android-jpto.sonyericsson.net:29418/.insteadOf git://android.git.kernel.org/
git config --global --add url.ssh://guanghu.xa.shi@android-jpto.sonyericsson.net:29418/.insteadOf https://android.googlesource.com/
git config --global --add url.ssh://guanghu.xa.shi@android-jpto.sonyericsson.net:29418/tools/repo.insteadOf https://gerrit.googlesource.com/git-repo
git config --global --add url.ssh://guanghu.xa.shi@review.sonyericsson.net:29418/.pushInsteadOf git://review.sonyericsson.net/
gedit ~/.gitconfig   看看git配置内容正确否。

--------------------------------------------------------------------------------
[user]
	email = guanghu.xa.shi@sonymobile.com
	name = guanghu.xa.shi
[core]
	editor = vim -c \"set fenc=utf-8\"
	whitespace = trailing-space,space-before-tab,tab-in-indent
[url "ssh://guanghu.xa.shi@android-jpto.sonyericsson.net:29418/"]
	insteadOf = git://review.sonyericsson.net/
	insteadOf = git://android.git.kernel.org/
	insteadOf = https://android.googlesource.com/
[url "ssh://guanghu.xa.shi@android-jpto.sonyericsson.net:29418/tools/repo"]
	insteadOf = https://gerrit.googlesource.com/git-repo
[url "ssh://guanghu.xa.shi@review.sonyericsson.net:29418/"]
	pushInsteadOf = git://review.sonyericsson.net/
[color]
	ui = auto
---------------------------------------------------------------------------------------------------
//用Repo脚本同步代码(交叉编译器也一同被下载)
mkdir m-tone 	    //
cd m-tone/		    //
repo init -u git://review.sonyericsson.net/platform/manifest.git -b m-8996-ref 	 	//高通原生代码
repo init -u git://review.sonyericsson.net/platform/manifest.git -b m-tone	 	    //m_tone-cdb,  m_tone-dora
repo init -u git://review.sonyericsson.net/platform/manifest.git -b loire_cdb	 	//m-loire_cdb, m-loire_suzu
repo init -u git://review.sonyericsson.net/platform/manifest.git -b m-loire-qref 	//m-loire-qref
repo init -u git://review.sonyericsson.net/platform/manifest.git -b feature-camera-171h-loire2-bu-dev   //ps11
repo sync -j64 	 //-jXX 根据自己PC硬件配置来

或者：
repo sync -j64 &&　source build/envsetup.sh　&& lunch tone_cdb-userdebug && make fullbuild -j32

repo sync kernel 则只是同步kernel目录下的代码

//feature-camera-171h-loire2-bu-dev
■Branch
http://confluence.jpto.sonyericsson.net/v1/display/CAMSOFT/%5B171H%5D+Branch+Strategy
feature-camera-171h-loire2-bu-dev
 |
 +-- kernel:    feature-camera-171h-loire2-bu-dev
 |
 +-- caladbolg: feature-camera-171h-bu-dev
 |
 +-- camera-mw: feature-camera-171h-bu-dev
 

//超快sync
http://android-ci.jpto.sonyericsson.net/job/campfbld/

//jenkins
http://android-ci.jpto.sonyericsson.net/job/22714183sync/   //
http://android-ci.jpto.sonyericsson.net/job/22714183fs/     //Dalian
http://android-ci.jpto.sonyericsson.net/job/campftest/      //
http://android-ci.jpto.sonyericsson.net/job/22714183acq/    //
http://android-ci.jpto.sonyericsson.net/job/GerritEvent     //

//查版本
http://cmweb.sonyericsson.net/

//redmine
https://t21g.mydns.jp/redmine/

//gerrit event
http://android-ci-platform.sonyericsson.net/job/kernel-checkpatch/configure

//syncRobot gerrit
http://review.sonyericsson.net/#/c/743155



//////////////////////////////////////////////////////////////////// 
//配置，编译文件系统Android，和Linux内核
////////////////////////////////////////////////////////////////////
//配置-包含进来几个.sh文件
source build/envsetup.sh
//配置---选某一版本
lunch                    //列出可选的版本
lunch tone_cdb-userdebug //
lunch dora-userdebug     //比如选择了这个版本

make fullbuild -j64	    //

//
如果改了target，要先make clean（distclean）一下，否则编译最后会出错。很浪费时间。
//
make modules SUBDIRS=drivers/usb/gadget/
//.ko が移動される、　Defaultでは　FileSystem　のsystem/lib/modules/の中に移動している
/out/target/product/tone_cdb/system/lib/modules/spidev.ko


///////////////////////////////////////////////////////////////////////////
//单独编译kernel
//这个只编译出kernel.sin，用FG4直接烧写kernel.sin即可
///////////////////////////////////////////////////////////////////////////
test -n "$OUT" && find $OUT \( -name \*.img -o -name \*.dtb -o -name \*.dat \) -exec rm -rf {} \;	//删除*.img *.dtb *.dat。在root目录执行
make -j64 out/target/product/tone_cdb/kernel.sin    //在kernel目录之外执行

//
"make mrproper" 必须进内核目录里执行。

///////////////////////////////////////////////////////////////////////////
//单独编译gtest目录 /vendor/semc/system/camera-mw/test
///////////////////////////////////////////////////////////////////////////
在gtest目录单独 mm -b -j32 方式编译时, 出 "No private recovery resources for TARGET_DEVICE tone_cdb" 之类错误:
方法1： 到root目录重新 source build/envsetup.sh ---> lunch tone_cdb-userdebug ... 一下。
方法2： 用编译内核的同一个终端。

///////////////////////////////////////////////////////////////////////////////////
//单独编译gtest目录（编译整个系统时，貌似不编译此部分？），用adb工具 放进android FileSystem里
///////////////////////////////////////////////////////////////////////////////////
mm -b -j32			    //在test目录(/vendor/semc/system/camera-mw/test)里执行。
					    //在根目录 make clean 之类之后，mm命令就不好使了，要再make fullbuild以下才好使。
					    //
adb root				//
(直接 adb remount ？)	//restarting adbd as root
adb disable-verity		//防止 Read Only Filesystem?
					    //Verity disabled on /system
					    //Now reboot your device for settings to take effect
adb reboot				//或手动重启？
adb root				//
adb remount				//
					    //Not running as root. Try "adb root" first.
			    
adb push ${OUT}/system/lib/libcammw.so /system/lib/         //1
adb push ${OUT}/system/lib/libcammw_util.so /system/lib     //2
adb push ${OUT}/system/lib/libcammw_test.so /system/lib     //3
adb push ${OUT}/system/bin/libcammw_gtest /system/bin       //4

adb shell				//进入手机终端    
libcammw_gtest -t 0001	//跑 Gtest，指定case。root权限执行。
adb shell libcammw_gtest -p -t 0001


//rm RAW File: 
adb shell rm /data/misc/camera/*.raw 

//
adb shell libcammw_gtest -p -t 0100                         //
adb shell libcammw_gtest -p -t 4100                         //

//Get raw File
adb pull /data/misc/camera/ .
adb pull /data/misc/camera/ /home/CORPUSERS/xp019530/Downloads/Log/0714/test2/

//拷贝整个文件夹失败时，用此方法：
adb pull "/storage/emulated/legacy/DCIM/Camera/" /home/shi/下载/ov5640_captures/


//Get kernel log
1. clear log.
2. adb pull sdcard/logalong/ /home/CORPUSERS/xp019530/Downloads/

//
adb shell cat /proc/kmsg
    
//
adb logcat -v time



//ffmpeg: YUV ---> JPG
//转单个文件：
ffmpeg -f image2 -vcodec rawvideo -s 3840x2160 -pix_fmt nv21 -i tc-0810_full_port3_3840x2160_iq_lsc.raw tc-0810_full_port3_3840x2160_iq_lsc.jpg

//转目录下所有文件：
for i in *.raw; do ffmpeg -f image2 -vcodec rawvideo -s $(echo $i|egrep -o "[0-9]+x[0-9]+") -pix_fmt nv21 -i $i ${i%.*}.jpg; done

for i in *.img; do ffmpeg -f image2 -vcodec rawvideo -s $(echo $i|egrep -o "[0-9]+x[0-9]+") -pix_fmt nv21 -i $i ${i%.*}.jpg; done







//ndk
root 用户使用ndk编译器的编译命令：ndk-build

//
adb push libs/armeabi/spidev_test /vendor/_shiguanghu_
chmod 777 spidev_test

./spidev_test -D /dev/spidev3.0 -s 100000 -b 32 -C -H -O  
./spidev_fdx -m 10 -r 10 /dev/spidev3.3		//OK!

//./spidev_fdx -m 100 -r 100 /dev/spidev3.0
/dev/spidev3.0: spi mode 0x7, 8 bits per word, 5000000 Hz max
response(32, 33):  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00		//32byte
read(32, 32):      00 00, 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00		//32byte


//shell
# Write binary 1, 2 and 3
echo -ne "\x01\x02\x03" > /dev/spidev3.0

cat /proc/cpuinfo 
cat /proc/interrupt

dmesg | grep spi

/////////////////////////////////////////////////////////////
//Git操作代码
/////////////////////////////////////////////////////////////
//提交代码
git status		//看一下更改记录
git clean -		//删掉临时文件
git diff		//看一下是不是我向要的更改内容
git add . 		//当前目录的所有
git add 某文件 	//只提交某文件
git commit -a	//提交到PC本地仓库
(git commit --amend --no-edit)
git push -v $(git config --get remote.origin.url) HEAD:refs/for/m-common		    //caladblog
git push -v $(git config --get remote.origin.url) HEAD:refs/for/feature-m-aegis-dev	//cammw
git push -v $(git config --get remote.origin.url) HEAD:refs/for/m-tone			    //kernel

//恢复kernel代码
1.进kernel目录
2.git log --oneline　-8
3.找到想要恢复的 git号码
4. git reset --hard 号码 //git reset --hard 68246e24

//查某提交Change-Id：　Gerrit上搜索某提交时，也是根据Change-Id来查的
git log -10

//patch形式　!=　commit形式
git cherry-pick -n ad56462      //patch形式(只拿下内容)
git fetch ssh://guanghu.xa.shi@review.sonyericsson.net:29418/kernel/msm-3.18 refs/changes/52/1495752/11 && git cherry-pick -n FETCH_HEAD        //UART Enable
---------------------------------------------------------------------------------------------------------------------------------------------------------
//各部分のImageビルド
make -j64 bootimage		// ，Kernel，
make -j64 systemimage	//FileSystem
make -j64			    //


//1.先烧写一个能启动的 bootloader，kernel，rootFileSystem (用FG4之类)
//2.adb命令进入fastboot模式（USB口，非UART口）
adb reboot-bootloader			    //Board会重起，貌似进入fastboot模式？

//3.在代码根目录下如下操作(U口)
fastboot flash boot $OUT/boot.img	//烧写 Kernel。没有bootloader部分？  sudo apt-get install android-tools-fastboot ?
fastboot flash boot $OUT/system.img	//烧写 文件系统
fastboot reboot				        //


------------
用adb 刷 kernel ?
------------
$ make bootimage -j16
$ adb reboot bootloader
$ cd out/host/linux-x86/bin/
$ ./fastboot flash boot ../../../target/product/tone_cdb/boot.img
$ ./fastboot reboot
------------

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Qualcomm DTS 学习:
1. kernel/arch/arm/boot/dts 目录下包含所有的dts.
    a. board , msm8226.dtsi
    b. pmic,   msm-pm8226.dtsi
2. kernel/Androidkernel.mk; Android makefile to build kernel as a part of Android Build
3. kernel/arch/arm/configs 目录下保存对应的config定义, CONFIG_XXXXXX

    


//
git show | perl ./scripts/checkpatch.pl --no-signoff -          //
perl ./scripts/checkpatch.pl --no-signoff drivers/media/platform/msm/camera_v2/sensor/sony_camera_v4l2.c    //
perl ./scripts/checkpatch.pl --no-signoff drivers/media/platform/msm/camera_v2/sensor/*.c                   */
perl ./scripts/checkpatch.pl --no-signoff drivers/media/platform/msm/camera_v2/sensor/*.h                   */

//
scripts/dtc/dtc –I dts –O dtb –o devicetree.dtb arch/arm/boot/dts/zynq-zed.dts

//scp
scp 1.txt 22714384@jptolx23365:/home/CORPUSERS/22714384/work/

//
xp019530@jptolx24412:~/Documents/Projects/m-tone_cdb$ adb shell getevent
add device 1: /dev/input/event7		name:     "msm8996-tasha-mtp-snd-card Button Jack"
add device 2: /dev/input/event6		name:     "msm8996-tasha-mtp-snd-card Headset Jack"
add device 3: /dev/input/event5		name:     "clearpad"			//TouchScreen
could not get driver version for /dev/input/mouse0, Not a typewriter
add device 4: /dev/input/event2		name:     "hbtp_vm"
add device 5: /dev/input/event1		name:     "bu520x1nvx"
add device 6: /dev/input/event0		name:     "qpnp_pon"			//power键: misc/powerkey_forcecrash.c
could not get driver version for /dev/input/mice, Not a typewriter
add device 7: /dev/input/event3		name:     "somc_chg_unplug_key"
add device 8: /dev/input/event4		name:     "gpio-keys"			//CDB上面按键(除了power键)都用了驱动"gpio-keys"


////////////////////////////////////////////
cat /proc/bus/input/devices 结果：
/////////////////////////////////////////////
I: Bus=0000 Vendor=0000 Product=0000 Version=0000
N: Name="qpnp_pon"
P: Phys=qpnp_pon/input0
S: Sysfs=/devices/virtual/input/input0
U: Uniq=
H: Handlers=mdss_fb powerkey_handle event0 cpufreq keychord 
B: PROP=40
B: EV=3
B: KEY=18000000000000 0

I: Bus=0000 Vendor=0000 Product=0000 Version=0000
N: Name="bu520x1nvx"
P: Phys=
S: Sysfs=/devices/virtual/input/input1
U: Uniq=
H: Handlers=event1 
B: PROP=0
B: EV=21
B: SW=1

I: Bus=0000 Vendor=0000 Product=0000 Version=0000
N: Name="hbtp_vm"
P: Phys=
S: Sysfs=/devices/virtual/input/input2
U: Uniq=
H: Handlers=mouse0 event2 cpufreq 
B: PROP=2
B: EV=7
B: KEY=30000 0 0 0 0
B: REL=3

I: Bus=0000 Vendor=0000 Product=0000 Version=0000
N: Name="somc_chg_unplug_key"
P: Phys=
S: Sysfs=/devices/soc/qpnp-smbcharger-ffffffc0d7cd8c00/input/input3
U: Uniq=
H: Handlers=event3 cpufreq 
B: PROP=0
B: EV=3
B: KEY=4 0 0 0
......
........



///////////////////////////////////
//
///////////////////////////////////
Android 自带了 getevent 和 sendevent，分别用于获取设备报送的事件和模拟产生事件，前者用于辅助设备驱动的验证，后者用于模拟事件进行上层应用的验证。
关于event设备的获取，在 /proc/bus/input/devices 下面： $ adb shell cat /proc/bus/input/devices

0、getevent和sendevent用法：
			$ adb shell getevent -h                                              
			Usage: getevent [-t] [-n] [-s switchmask] [-S] [-v [mask]] [-d] [-p] [-i] [-l] [-q] [-c count] [-r] [device]
				-t: show time stamps
				-n: don't print newlines
				-s: print switch states for given bits
				-S: print all switch states
				-v: verbosity mask (errs=1, dev=2, name=4, info=8, vers=16, pos. events=32, props=64)
				-d: show HID descriptor, if available
				-p: show possible events (errs, dev, name, pos. events)
				-i: show all device info and possible events
				-l: label event types and names in plain text
				-q: quiet (clear verbosity mask)
				-c: print given number of events then exit
				-r: print rate events are received

			$ adb shell sendevent -h
			use: sendevent device type code value


1、模拟发送一个Power键：
$ export KEYCODE_POWER=26
$ input keyevent ${KEYCODE_HOME}
或者：
先获取gpio-keys event的设备接口：
$ adb shell cat /proc/bus/input/devices | grep -A 5 gpio-keys | grep event
H: Handlers=event5

# Press power button(Don't release)
$ adb shell sendevent /dev/input/event5 1 $((0x74)) 1
$ adb shell sendevent /dev/input/event5 0 0 0

# Release power button
$ adb shell sendevent /dev/input/event5 1 $((0x74)) 0
$ adb shell sendevent /dev/input/event5 0 0 0


2、模拟获取Power键的事件
先执行
$ adb shell getevent /dev/input/event5

然后按下power键并观察输出:
按下时:
0001 0074 00000001
0000 0000 00000000

弹起来时：
0001 0074 00000000
0000 0000 00000000

可以看到更好跟我们上面模拟的一样，注，上面那些值是十六进制的，如果想要 更加直观地分析获取的上报事件可以参考 在 Android 通过 get_event 获得 input 设备 上报event 



//Stickynotes
Install Indicator Stickynotes:
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo apt-get update
sudo apt-get install indicator-stickynotes

//Gedit
sudo apt-get remove gedit
sudo apt-get install gedit


//通过sudo apt-get install xxxx 安装软件后，总是无法卸载干净，这里以Apache 为例，提供方法：
首先sudo apt-get remove apache2
再sudo apt-get autoremove


//linux下查看串口信息
查看串口是否可用，可以对串口发送数据比如对com1口，echo lyjie126 > /dev/ttyS0
查看串口名称使用 ls -l /dev/ttyS* 一般情况下串口的名称全部在dev下面，如果你没有外插串口卡的话默认是dev下的ttyS* ,一般ttyS0对应com1，ttyS1对应com2，当然也不一定是必然的；
查看串口驱动：cat /proc/tty/drivers/serial
查看串口设备：dmesg | grep ttyS*

//CDB cmdline:
[1040] Config MIPI_CMD_PANEL.
[1210] Turn on MIPI_CMD_PANEL.

androidboot.hardware=qcom 
user_debug=31 
msm_rtb.filter=0x237
ehci-hcd.park=3 
lpm_levels.sleep_disabled=1 
cma=16M@0-0xffffffff 
coherent_pool=2M 
androidboot.bootdevice=7464900.sdhci
androidboot.bootloader=s1 
oemandroidboot.s1boot=1299-4832_S1_Boot_MSM8996_LA1.0.1_31-F 
androidboot.serialno=INVALID 
ta_info=1,16,256 
startup=0x00000001 
warmboot=0x00000000 
oemandroidboot.imei=0000000000000000 
oemandroidboot.phoneid=0000:0000000000000000 
oemandroidboot.security=0 
oemandroidboot.babe08b3=50000000 
oemandroidboot.securityflags=0x00000000 
oemandroid.aid=1 
lcdid_adc=0xA218E 
display_status=on 
androidboot.baseband=msm


[1290] Updating device tree: start
[1300] Updating device tree: done





//MSM Exception(IRQ) Sequence:
gic_handle_irq
	__handle_domain_irq
		generic_handle_irq
			msm_gpio_irq_handler
				generic_handle_irq
					handle_edge_irq
						handle_irq_event
							handle_irq_event_percpu
								sony_aube_irq_handler ~ 				
							
//						
[  116.923820] [<ffffffc0002ecf3c>] kmem_cache_destroy+0x58/0xc0
[  116.929529] [<ffffffc0008d6048>] sony_aube_config32+0x204/0x440
[  116.935434] [<ffffffc0008d2938>] msm_sensor_subdev_ioctl+0x10c/0x204
[  116.941784] [<ffffffc0008d2c04>] msm_sensor_subdev_do_ioctl+0x1d4/0x200
[  116.948359] [<ffffffc000861e10>] video_usercopy+0x2d0/0x524
[  116.953935] [<ffffffc0008d22f8>] msm_sensor_subdev_fops_ioctl+0x10/0x1c
[  116.960559] [<ffffffc00086e234>] v4l2_compat_ioctl32+0x98/0xb4
[  116.966316] [<ffffffc00035ebb4>] compat_SyS_ioctl+0x10c/0x1210


//
xp019530@jptolx24412:/sys/bus/usb/devices$ lsusb
Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 058: ID 0fce:51e1 Sony Ericsson Mobile Communications AB         //每次都是变的。
Bus 003 Device 056: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)
Bus 003 Device 057: ID 10c4:ea60 Cygnal Integrated Products, Inc. CP210x UART Bridge / myAVR mySmartUSB light
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
			
//关闭usb端口供电	
echo suspend > /sys/bus/usb/devices/usb1/power/level
echo disabled > /sys/bus/usb/devices/usb1/power/wakeup

//可以关闭usb供电？：
echo suspend >/sys/bus/usb/devices/usbN/power/control
echo disabled >/sys/bus/usb/devices/usbN/power/wakeup

//
# disable external wake-up; do this only once
echo disabled > /sys/bus/usb/devices/usb1/power/wakeup

//
echo on > /sys/bus/usb/devices/usbN/power/level       # turn on
echo suspend > /sys/bus/usb/devices/usbN/power/level  # turn off
								
	
//優先度問題
Init.h中有相关initcall的启动次序，在system.map中可看出具体的"__initcall指针"的前后次序:
#define pure_initcall(fn)          __define_initcall("0",fn,0)
#define core_initcall(fn)          __define_initcall("1",fn,1)
#define core_initcall_sync(fn)     __define_initcall("1s",fn,1s)
#define postcore_initcall(fn)      __define_initcall("2",fn,2)
#define postcore_initcall_sync(fn) __define_initcall("2s",fn,2s)
#define arch_initcall(fn)          __define_initcall("3",fn,3)
#define arch_initcall_sync(fn)     __define_initcall("3s",fn,3s)
#define subsys_initcall(fn)        __define_initcall("4",fn,4)
#define subsys_initcall_sync(fn)   __define_initcall("4s",fn,4s)
#define fs_initcall(fn)            __define_initcall("5",fn,5)
#define fs_initcall_sync(fn)       __define_initcall("5s",fn,5s)
#define rootfs_initcall(fn)        __define_initcall("rootfs",fn,rootfs)
#define device_initcall(fn)        __define_initcall("6",fn,6)
#define device_initcall_sync(fn)   __define_initcall("6s",fn,6s)
#define late_initcall(fn)          __define_initcall("7",fn,7)
#define late_initcall_sync(fn)     __define_initcall("7s",fn,7s)
module_init在的启动序号为6，它展开后就是__define_initcall("6",fn,6)					






//ffmpeg
最近のffmpegはすごくてlibcその他のライブラリをすべてstatic linkして環境非依存にしたバイナリを配ってる。
したがって以下のようにwgetして解凍して/usr/local/binにでも置けばそれで動いてしまう。
$ wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz
$ tar xvf ffmpeg-release-64bit-static.tar.xz
$ sudo cp ./ffmpeg-release-64bit-static/ffmpeg /usr/local/bin
なお、標準のlibcと結合していない関係でDNS resolutionができないという問題があり、これはインターネット上の動画を直接指定してダウンロードしながら処理したい時に問題となる。

解決するためにはnscdをインストールして動かす。nscdがあると自動でそちらを利用して名前解決してくれる。
$ sudo apt-get install nscd



//
$ make bootimage -j16
$ adb reboot bootloader
$ cd out/host/linux-x86/bin/
$ ./fastboot flash boot ../../../target/product/tone_cdb/boot.img
$ ./fastboot reboot

//
fg4console -U -sd 4 -p "Tone-cdb@Tone cdb BROWN - BROWN CID1" -d $OUT/obj/semcpkgtoimg

			

