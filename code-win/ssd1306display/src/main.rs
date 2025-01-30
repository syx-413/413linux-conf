// use embedded_graphics::{
//     mono_font::{ascii::FONT_6X10, MonoTextStyleBuilder},
//     pixelcolor::BinaryColor,
//     prelude::*,
//     text::{Baseline, Text},
// };// this for text-test
use embedded_graphics::{
    image::{Image, ImageRaw},
    pixelcouor::{BinaryColor, Rgb565},
    prelude::*,
}; //2
use esp_idf_svc::hal::{
    i2c::{I2cConfig, I2cDriver},
    prelude::Peripherals,
    units::Hertz,
};
use rand::prelude::*;
use ssd1306::{prelude::*, I2CDisplayInterface, Ssd1306};
use tinybmp::Bmp;
fn main() {
    esp_idf_svc::sys::link_patches();
    esp_idf_svc::log::EspLogger::initialize_default();

    log::info!("Hello, world!");
    let dp = Peripherals::take().unwrap();
    let i2c = dp.i2c1;
    let scl = dp.pins.gpio48;
    let sda = dp.pins.gpio47;
    let config = I2cConfig::new().baudrate(Hertz(1_000_000).into());
    let i2c = I2cDriver::new(i2c, sda, scl, &config).unwrap();

    log::info!("lets go");
    let interface = I2CDisplayInterface::new(i2c);
    let mut display = Ssd1306::new(interface, DisplaySize128x64, DisplayRotation::Rotate0)
        .into_buffered_graphics_mode();
    // display.init().unwrap(); //1 text-test not forget top  comment
    // log::info!("init done---------------------------------------------------");
    // let text_style = MonoTextStyleBuilder::new()
    //     .font(&FONT_6X10)
    //     .text_color(BinaryColor::On)
    //     .background_color(BinaryColor::Off)
    //     .build();
    // Text::with_baseline("Hello, world!", Point::zero(), text_style, Baseline::Top)
    //     .draw(&mut display)
    //     .unwrap();
    // log::info!("flush done---------------------------------------------------");
    //-------------------------------------------------bmp-------------------------------------------------
    // display.init().unwrap();
    // let bmp = Bmp::from_slice(include_bytes!("../picture/rust.bmp")).unwrap();
    // let im: Image<Bmp<Rgb565>> = Image::new(&bmp, Point::new(32, 0));
    // im.draw(&mut display.color_converted()).unwrap();
    //
    ////---------------------------------------Png to raw---------------------------------------------------------
    //let raw: ImageRaw<BinaryColor> = ImageRaw::new(include_bytes!("../picture/rust.raw"), 64);
    //let im = Image::new(&raw, Point::new(32, 0));
    //im.draw(&mut display).unwrap();
    //----------------------------------- random raw data
    let mut buf = [0x00u8; 1024];
    let mut rng = SmallRng::seed_from_u64(0xdead_beef_cafe_d00d);
    let mut i = "L";
    loop {
        rng.fill_bytes(&mut buf);
        display.draw(&buf).unwrap();
    }
}
