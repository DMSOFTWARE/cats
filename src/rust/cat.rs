use std::fs::File;
use std::io::{Read,Write};
use std::os::unix::io::{RawFd, FromRawFd};

fn go() -> Result<(), std::io::Error> {
    let mut f = File::open("../data")?;
    let mut done = false;
    let mut buf = [0u8; 131072];
    let mut file = unsafe { File::from_raw_fd(1 as RawFd) };

    while !done {
        match f.read(&mut buf) {
            Ok(len) => {
                if len == 0 {
                    done = true;
                }
                else {
                    file.write_all(&mut buf)?;
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
