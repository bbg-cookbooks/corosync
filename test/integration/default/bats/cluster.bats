#!/usr/bin/env bats

@test "correct authkey" {
  run md5sum /etc/corosync/authkey
  [ "${output%% *}" = "fd22d4014a6f0c260a788d225d6dc24d" ]
}

@test "both members joined cluster" {
  corosync-objctl | grep members | grep '10\.30\.0\.11'
  corosync-objctl | grep members | grep '10\.30\.0\.12'
}
