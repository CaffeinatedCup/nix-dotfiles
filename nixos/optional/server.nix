{ inpputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  memos
  actual-server

  ];


}
