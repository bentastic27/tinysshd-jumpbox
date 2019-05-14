#!/bin/bash
if [ ! -d /etc/tinyssh/sshkeydir ]; then
  tinysshd-makekey /etc/tinyssh/sshkeydir
fi
if [ -f /key-src/authorized_keys ]; then
  mkdir /root/.ssh
  cp /key-src/authorized_keys /root/.ssh/authorized_keys
  chmod 700 /root/.ssh
fi
tcpserver -HRDl0 0.0.0.0 22 /usr/sbin/tinysshd -v /etc/tinyssh/sshkeydir