#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread

ip6tables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to destination 2606:4700:4700::1111
ip6tables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to destination 2606:4700:4700::1001
ip6tables -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 2606:4700:4700::1111
ip6tables -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 2606:4700:4700::1001
