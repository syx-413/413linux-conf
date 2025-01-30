use config::MODE_0;
use esp_idf_hal::delay::FreeRtos;
use esp_idf_hal::gpio::{self, PinDriver};
use esp_idf_hal::prelude::Peripherals;

use esp_idf_hal::spi::*;
use esp_idf_hal::units::MegaHertz;

use esp_idf_hal::spi::Dma;

const WIDTH: usize = 174;
const HEIGHT: usize = 220;
const X_OFFSET: u16 = (174 - WIDTH as u16) / 2;
const Y_OFFSET: u16 = (220 - HEIGHT as u16) / 2;

fn main() {
    // It is necessary to call this function once. Otherwise some patches to the runtime
    // implemented by esp-idf-sys might not link properly. See https://github.com/esp-rs/esp-idf-template/issues/71

    esp_idf_svc::sys::link_patches();

    // Bind the log crate to the ESP Logging facilities
    esp_idf_svc::log::EspLogger::initialize_default();
    //
    log::info!("Hello, world!");
    let dp = Peripherals::take().unwrap();
    let spi = dp.spi2;

    let sclk = dp.pins.gpio48; //crystal
    let cs = dp.pins.gpio40; //
    let rst = PinDriver::output(dp.pins.gpio39).unwrap(); //Rest
    let rs = PinDriver::output(dp.pins.gpio38).unwrap(); //D/C
    let sda = dp.pins.gpio47; //mosi

    log::info!("Yes, io configure");
    let config = config::Config::new()
        .baudrate(MegaHertz(26).into())
        .data_mode(MODE_0);
    // let device = SpiDeviceDriver::new_single(
    //     spi,
    //     sclk,
    //     sda,
    //     None::<gpio::AnyIOPin>,
    //     Some(cs),
    //     &SpiDriverConfig::new(),
    //     &config,
    // )
    // .unwrap();
}
//
//** CS                 =液晶屏片选信号，低电平使能
//** DC/RS              =液晶屏寄存器/数据选择信号，低电平：寄存器，高电平：数据
//** SDA[MOSI]          =SPI总线写数据信号
//** SCK/CLK            =SPI总线时钟信号
//
