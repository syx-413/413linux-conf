use std::{cmp::Ordering, io};

use rand::Rng;

fn main() {
    println!("Hello, world!");
    println!("Guess a number ");
    let secret_number = rand::thread_rng().gen_range(1..=100);
    loop {
        let mut guss = String::new();
        io::stdin()
            .read_line(&mut guss)
            .expect("Failed to read line"); // Note 1 Result _ Ok Or Err- panic
        println!("You guessed: {}", guss);
        let guss: u32 = guss.trim().parse().expect("This i32");
        match guss.cmp(&secret_number) {
            Ordering::Less => println!("Too small"),
            Ordering::Greater => println!("Too big"),
            Ordering::Equal => {
                println!("you guss right");
                break;
            }
        }
        // random number
    }
}

// 'static STATIC: Type = init;
