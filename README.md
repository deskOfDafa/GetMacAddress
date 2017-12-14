# GetMacAddress
* ios7 之后获取 ios设备mac(物理地址)
*  需要在  Other Linker Flags 添加 -lresolv
*  直接调用 + (nullable NSString *)getMacAddressFromMDNS; 就可以拿到Mac 地址
