cd /home/akshay/Xilinix/Lab3_Mysterious/EncrypterAndDecrypter
if { [ catch { xload xmp EncrypterAndDecrypter.xmp } result ] } {
  exit 10
}
xset intstyle default
save proj
exit 0
