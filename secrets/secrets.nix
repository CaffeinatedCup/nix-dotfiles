let
  zack_geeker = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1WMAmvGK8OPaY2Y83dwJodhLZKv5H6E24A2TjwRSmL zack@geeker";
  zack_parted = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAEyb5SxJX7OPCQOrBgKd3sJZrmqA68+sY+nIjY0GNhO zack@parted";
  users = [ zack_geeker zack_parted ];

  liberator = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOr75dfc6eft+cq8mWcHpElDgkxVrfin5Tp8LHMPQ/it root@liberator";
  vulch = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAJq2hIYwoy1PKLlwoXWCbSywKpgS5FdlI1mLOMQkbbv root@vulch";
in {
  "vaultwarden-admin-token.age".publicKeys = users ++ [ liberator ];
  "nextcloud-admin-pass.age".publicKeys    = users ++ [ liberator ];
  "freshrss-password.age".publicKeys       = users ++ [ liberator ];
  "openrouter-api-key.age".publicKeys = users;
}
