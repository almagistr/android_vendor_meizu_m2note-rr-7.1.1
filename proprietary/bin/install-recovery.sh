#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12640256 fa3a394cb7dc1b393da171da655d72315aa3ab20 8140800 1be3cc2782d5ef55a77c99aaf19855d3de96caff
fi
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:12640256:fa3a394cb7dc1b393da171da655d72315aa3ab20; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:8140800:1be3cc2782d5ef55a77c99aaf19855d3de96caff EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery fa3a394cb7dc1b393da171da655d72315aa3ab20 12640256 1be3cc2782d5ef55a77c99aaf19855d3de96caff:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
