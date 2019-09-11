#!/bin/sh

MAINIP=$(ip route get 1 | awk '{print $NF;exit}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}')
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')

value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"


clear
echo "                                                           "
echo "###########################################################"
echo "#                                                         #"
echo "#                      懒人专用                           #"
echo "#                                                         #"
echo "#  加速系列：Bbr系列、KCPtun、锐速                        #"
echo "#  代理系列：V2ary、ssr、Tg专用代理、Goflyway             #"
echo "#  性能测试：superbench、回程线路测试                     #"
echo "#  监控系列：云监控（status）                             #"
echo "#  DD系列：傻瓜式一键DD包                                 #"
echo "#  脚本来源于网络，版权归各位所有                         #"
echo "#                                                         #"
echo "###########################################################"
echo "                                                           "
echo "请选择您需要的程序:"
echo "  1) 加速系列：Bbr系列、锐速"
echo "  2) KCPtun"
echo "  3) SSR多用户版"
echo "  4) V2ary"
echo "  5) Tg专用代理（Go版）"
echo "  6) Goflyway"
echo "  7) 小鸡性能测试"
echo "  8) 回程线路测试:命令:./huicheng 您的IP "
echo "  9) 云监控"
echo "  10) 傻瓜式一键DD包（OD源）"
echo "  11) 傻瓜式一键DD包（GD源）"
echo ""
echo -n "请输入编号: "
read N
case $N in
  1) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/Linux-NetSpeed/master/tcp.sh && chmod +x tcp.sh && bash tcp.sh ;;
  2) wget -N --no-check-certificate https://github.com/veip007/Kcptun/raw/master/kcptun/kcptun.sh && chmod +x kcptun.sh && bash kcptun.sh ;;
  3) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/doubi/master/ssrmu.sh && chmod +x ssrmu.sh && bash ssrmu.sh ;;
  4) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/v2ray/master/v2.sh && chmod +x v2.sh && bash v2.sh ;;
  5) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/doubi/master/mtproxy_go.sh && chmod +x mtproxy_go.sh && bash mtproxy_go.sh ;;
  6) wget -N --no-check-certificate https://git.io/goflyway.sh && chmod +x goflyway.sh && bash goflyway.sh ;;
  7) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/cesu/master/superbench.sh && chmod +x superbench.sh && bash superbench.sh ;;
  8) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/huicheng/master/huicheng && chmod +x huicheng ;;
  9) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/doubi/master/status.sh && chmod +x status.sh && bash status.sh ;;
  10) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/dd/master/dd-od.sh && chmod +x dd-od.sh  && ./dd-od.sh
 ;;
  11) wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/dd/master/dd-gd.sh && chmod +x dd-gd.sh  && ./dd-gd.sh
 ;;
  *) echo "Wrong input!" ;;
esac