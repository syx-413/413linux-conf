use esp_idf_hal::{delay::FreeRtos, gpio::PinDriver, prelude::Peripherals, prelude::*};
fn main() {
    // It is necessary to call this function once. Otherwise some patches to the runtime
    // implemented by esp-idf-sys might not link properly. See https://github.com/esp-rs/esp-idf-template/issues/71

    esp_idf_svc::sys::link_patches();

    // Bind the log crate to the ESP Logging facilities
    esp_idf_svc::log::EspLogger::initialize_default();

    log::info!("Hello, world!");
    let dp = Peripherals::take().unwrap();
}

//** CS                 =液晶屏片选信号，低电平使能
//** DC/RS              =液晶屏寄存器/数据选择信号，低电平：寄存器，高电平：数据
//** SDA[MOSI]          =SPI总线写数据信号
//** SCK/CLK            =SPI总线时钟信号
