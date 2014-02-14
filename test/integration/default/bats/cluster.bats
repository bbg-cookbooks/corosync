#!/usr/bin/env bats

@test "correct authkey" {
  run md5sum /etc/corosync/authkey
  [ "${output%% *}" = "fd22d4014a6f0c260a788d225d6dc24d" ]
}

@test "all members joined cluster" {
  /usr/sbin/corosync-objctl | grep members | grep '10\.30\.0\.11'
  /usr/sbin/corosync-objctl | grep members | grep '10\.30\.0\.12'
  /usr/sbin/corosync-objctl | grep members | grep '10\.30\.0\.13'
}
