# 
# ISATAP for IPv6 at ZJU
/sbin/modprobe ipv6
ipisatap=10.10.5.56
ippre=2001:da8:e000:90
ipaddr_v4=`/bin/ip addr | grep 10.214 | sed -n  s'/..*inet \(.*\..*\..*\..*\)\/.* brd ..*/\1/p'`
ipaddr_isatap=$ippre:0:5efe:$ipaddr_v4/64
echo IPv4 Address: $ipaddr_v4
echo IPv6 Address: $ipaddr_isatap
/bin/ip tunnel add sit1 mode sit remote $ipisatap local $ipaddr_v4
/sbin/ifconfig sit1 up
/sbin/ifconfig sit1 add $ipaddr_isatap 
/bin/ip route add ::/0 via $ippre::1 metric 1

