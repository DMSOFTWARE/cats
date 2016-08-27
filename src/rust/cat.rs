use std::io;
use std::io::prelude::*;
use std::fs::File;

fn go() -> Result<(), io::Error> {
    let mut f = try!(File::open("../data"));
    let mut done = false;
    let mut buf = [0u8; 131072];
    let stdout = io::stdout();
    let mut handle = stdout.lock();
    while !done {
        match f.read(&mut buf) {
            Ok(len) => {
                if len == 0 {
                    done = true;
                }
                else {
                    try!(handle.write(&mut buf));
                    //try!(io::stdout().write(&mut buf));
                }
            },
            Err(_) => { done = true; }
        }
    }
    Ok(())
}

fn main() { 
    match go() {
        Ok(_) => (),
        Err(e) => {
            println!("{}",e);
        }
    }
}
