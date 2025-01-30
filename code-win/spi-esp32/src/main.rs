use esp_idf_hal::{
    delay::Ets,
    gpio::{AnyIOPin, PinDriver},
    prelude::Peripherals,
    spi::{
        config::{self, MODE_0},
        SpiDeviceDriver, SpiDriverConfig,
    },
    units::MegaHertz,
};
const WIDTH: u32 = 174;
const HEIGHT: u32 = 220;
fn main() {
    // It is necessary to call this function once. Otherwise some patches to the runtime
    // implemented by esp-idf-sys might not link properly. See https://github.com/esp-rs/esp-idf-template/issues/71
    esp_idf_svc::sys::link_patches();

    // Bind the log crate to the ESP Logging facilities
    esp_idf_svc::log::EspLogger::initialize_default();

    log::info!("Hello, world!");

    // Peripherals start
    let dp = Peripherals::take().unwrap();

    let spi = dp.spi2;
    // IO ref
    let sclk = dp.pins.gpio48; //crystal
    let cs = dp.pins.gpio40; //
    let rst = PinDriver::output(dp.pins.gpio39).unwrap(); //Rest
    let rs = PinDriver::output(dp.pins.gpio38).unwrap(); //D/C
    let sda = dp.pins.gpio47; //mosi
                              //
                              //
    let delay = Ets;
    let config = config::Config::new()
        .baudrate(MegaHertz(26).into())
        .data_mode(MODE_0);
    let device = SpiDeviceDriver::new_single(
        spi,
        sclk,
        sda,
        None::<AnyIOPin>,
        Some(cs),
        &SpiDriverConfig::new(),
        &config,
    )
    .unwrap();
}
