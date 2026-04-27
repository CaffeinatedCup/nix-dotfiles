{ ... }:
{
  services.syncthing = {
    enable = true;
    user = "zack";
    dataDir = "/home/zack";
    configDir = "/home/zack/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        geeker = { id = "REPLACE-WITH-GEEKER-DEVICE-ID"; };
        parted = { id = "5JC7OCE-7N7FCVR-BJPGKTW-OFBBRYM-N5BGQQH-UOWE2CU-QRECSHT-25MRDQB"; };
      };
      folders = {
        Documents = {
          path = "/home/zack/Documents";
          devices = [ "geeker" "parted" ];
        };
        vault = {
          path = "/home/zack/vault";
          devices = [ "geeker" "parted" ];
        };
        Code = {
          path = "/home/zack/Code";
          devices = [ "geeker" "parted" ];
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
