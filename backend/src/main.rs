#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket; 

use std::path::Path; 
use rocket::response::NamedFile;
use std::io;
use std::path::PathBuf;

#[get("/")]
fn index() -> io::Result<NamedFile> {
  NamedFile::open(Path::new("index.html"))
}

#[get("/<file..>")]
fn files(file: PathBuf) -> io::Result<NamedFile> {
  NamedFile::open(file)
}


fn main() {
    rocket::ignite().mount("/", routes![index]).launch();
}


