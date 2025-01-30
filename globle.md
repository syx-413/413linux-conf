ESP_IDF_TOOLS_INSTALL_DIR = { value = "global" }

`source . /home/s413/export-esp.sh`

`espflash board-info ; usbipd detach --busid <busid> `
`usbipd attach --wsl --busid <busid>`

## SPI ILI9225
CLK 	液晶屏SPI总线时钟信号
SDA 	液晶屏SPI总线写数据信号
RS 	液晶屏寄存器/数据选择信号，低电平：寄存器，高电平：数据
RST 	液晶屏复位信号，低电平复位
CS 	液晶屏片选信号，低电平使能

## 链接
ln -sf ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer ~/.rustup/toolchains/esp/bin/rust-analyzer

cargo clean && rm -rf .embuild && cargo build



## espflash
espflash flash target/xtensa-esp32-espidf/debug


cargo generate --git https://github.com/esp-rs/esp-idf-template cargo

### 库的区别
这些 crate 形成了一个层次结构：

  最底层是 esp-idf-sys，提供了对 ESP-IDF 的原始访问。
  
  esp-idf-hal 在其之上提供硬件抽象。
  
  embedded-svc 定义了服务接口。
  
  esp-idf-svc 实现了这些接口，并使用 esp-idf-hal 和 esp-idf-sys 作为底层。

如果只需要访问硬件外设，可以使用  `esp-idf-hal`；
如果需要使用 WiFi:>  或其他服务，可以使用 `esp-idf-svc`



## wifi  ESP32-S3 支持以下 Wi-Fi 功能：

- 支持 4 个虚拟接口，即 STA、AP、Sniffer 和 reserved。
- 支持仅 station 模式、仅 AP 模式、station/AP 共存模式
- 支持使用 IEEE 802.11b、IEEE 802.11g、IEEE 802.11n 和 API 配置协议模式
- 支持 WPA/WPA2/WPA3/WPA2-企业版/WPA3-企业版/WAPI/WPS 和 DPP
- 支持 AMSDU、AMPDU、HT40、QoS 以及其它主要功能
-  支持 Modem-sleep
- 支持乐鑫专属协议，可实现 1 km 数据通信量
- 空中数据传输最高可达 20 MBit/s TCP 吞吐量和 30 MBit/s UDP 吞吐量
- 支持 Sniffer
- 支持快速扫描和全信道扫描
- 支持多个天线
- 支持获取信道状态信息

