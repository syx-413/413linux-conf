use esp_idf_svc::{
    eventloop::EspSystemEventLoop,
    hal::prelude::Peripherals,
    nvs::EspDefaultNvsPartition,
    wifi::{
        AccessPointConfiguration, AuthMethod, BlockingWifi, ClientConfiguration, Configuration,
        EspWifi,
    },
};
use log::info;

const SSID: &str = env!("WIFI_SSID");
const PASSWORD: &str = env!("WIFI_PASSWORD");

fn main() {
    esp_idf_svc::sys::link_patches();
    esp_idf_svc::log::EspLogger::initialize_default();
    info!("Connecting to WiFi network: {}", SSID);
    info!("Password: {}", PASSWORD);
    let dp = Peripherals::take().unwrap();
    let sys_loop = EspSystemEventLoop::take().unwrap();
    let nvs = EspDefaultNvsPartition::take().unwrap();
    info!("Everything Ok 总线开启 ");
    let dp2 = dp.modem;
    let mut wifi = BlockingWifi::wrap(
        EspWifi::new(dp2, sys_loop.clone(), Some(nvs)).unwrap(),
        sys_loop,
    )
    .unwrap();
    info!("配置wfi");
    // --------------------------STA--------------------------------
    // let _ = wifi.set_configuration(&Configuration::Client(ClientConfiguration {
    //     ssid: SSID.try_into().unwrap(),
    //     bssid: None,
    //     auth_method: AuthMethod::WPA2Personal,
    //     password: PASSWORD.try_into().unwrap(),
    //     channel: None,
    //     ..Default::default()
    // }));
    // info!("Set up 设置完成 , 启动");
    // wifi.start().unwrap();
    // info!("链接 wifi");
    // wifi.connect().unwrap();
    // info!("wifi MEssssssssssegr");
    // wifi.wait_netif_up().unwrap();
    // info!(
    //     " wifi.wait_netif_up:{:?}",
    //     wifi.wifi().sta_netif().get_ip_info().unwrap()
    // );
    //---------------------------------------STA Over --------------------------------
    //---------------------------------------AP---------------------------------------

    let config = Configuration::AccessPoint(AccessPointConfiguration {
        ssid: SSID.try_into().unwrap(),
        password: PASSWORD.try_into().unwrap(),
        auth_method: AuthMethod::WPA3Personal,
        ..Default::default()
    });
    wifi.set_configuration(&config).unwrap();
    info!("Set up 设置完成 , 启动");
    wifi.start().unwrap();
    info!("q启动完成");
    wifi.wait_netif_up().unwrap();
    info!(
        " wifi.wait_netif_up:{:?}",
        wifi.wifi().ap_netif().get_ip_info().unwrap()
    );

    info!(
        "Ip address: {:?}",
        wifi.wifi().ap_netif().get_ip_info().unwrap()
    );
    std::mem::forget(wifi);
}
