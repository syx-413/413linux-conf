use esp_idf_hal::prelude::Peripherals;
use esp_idf_svc::{
    eventloop::EspSystemEventLoop,
    nvs::EspDefaultNvsPartition,
    wifi::{AuthMethod, BlockingWifi, ClientConfiguration, Configuration, EspWifi, ScanMethod},
};

const WIFI_SSID: &str = "ESP32";
const WIFI_PASSWORD: &str = "25802580";
fn main() {
    // It is necessary to call this function once. Otherwise some patches to the runtime
    // implemented by esp-idf-sys might not link properly. See https://github.com/esp-rs/esp-idf-template/issues/71
    esp_idf_svc::sys::link_patches();

    // Bind the log crate to the ESP Logging facilities
    esp_idf_svc::log::EspLogger::initialize_default();

    log::info!("Hello, world!");
    let dp = Peripherals::take().unwrap();

    let sysloop = EspSystemEventLoop::take().unwrap();
    let nvs = EspDefaultNvsPartition::take().unwrap();
    let mut wifi = BlockingWifi::wrap(
        EspWifi::new(dp.modem, sysloop.clone(), Some(nvs)).unwrap(),
        sysloop,
    )
    .unwrap();

    log::warn!("Start !!");

    let _ = wifi.set_configuration(&Configuration::Client(ClientConfiguration {
        ssid: WIFI_SSID.try_into().unwrap(), // 替换为您的实际 SSID
        auth_method: AuthMethod::default(),  // 示例：设置合适的认证方法
        password: WIFI_PASSWORD.try_into().unwrap(), // 替换为您的实际密码
        ..Default::default()
    }));
    log::warn!("启动 !!");
    wifi.start().unwrap();
    log::info!("连接中...");
    wifi.connect().unwrap();
    log::info!("IP 地址: {:?}", wifi.wifi().sta_netif().get_ip_info());
}
