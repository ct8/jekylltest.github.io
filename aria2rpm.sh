#!/bin/sh
wget http://cffff.cf/nettle-2.2-1.el6.rf.i686.rpm
wget http://cffff.cf/nettle-devel-2.2-1.el6.rf.i686.rpm
wget http://cffff.cf/aria2-1.16.4-1.el6.rf.i686.rpm
wget http://cffff.cf/aria2.conf
rpm -ivh nettle-2.2-1.el6.rf.i686.rpm
rpm -ivh nettle-devel-2.2-1.el6.rf.i686.rpm
rpm -ivh aria2-1.16.4-1.el6.rf.i686.rpm