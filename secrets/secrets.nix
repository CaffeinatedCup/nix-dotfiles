let
  liberator = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOr75dfc6eft+cq8mWcHpElDgkxVrfin5Tp8LHMPQ/it zack@liberator";
  zack_geeker = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1WMAmvGK8OPaY2Y83dwJodhLZKv5H6E24A2TjwRSmL zack@geeker";
  zack_parted = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAEyb5SxJX7OPCQOrBgKd3sJZrmqA68+sY+nIjY0GNhO zack@parted";
  all = [ liberator zack_geeker zack_parted ];
in {
  "vaultwarden-admin-token.age".publicKeys = all;
  "nextcloud-admin-pass.age".publicKeys    = all;
  "freshrss-password.age".publicKeys       = all;
}
