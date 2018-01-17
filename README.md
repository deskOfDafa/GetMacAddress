# GetMacAddress
### 我只测试了ios 10.0.1 以及 ios 11.0 
*  ios7 之后获取 ios设备mac(物理地址)
*  需要连接wifi
*  需要在  Other Linker Flags 添加 -lresolv
*  直接调用 + (nullable NSString *)getMacAddressFromMDNS; 就可以拿到Mac 地址
