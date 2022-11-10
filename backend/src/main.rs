#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket; 

use std::path::Path; 
use rocket::response::NamedFile;
use std::io;

#[get("/")]
fn index() -> io::Result<NamedFile> {
  let page_directory_path = 
  format!("{}/../frontend/build", env!("CARGO_MANIFEST_DIR"));
  NamedFile::open(Path::new(&page_directory_path).join("index.html"))
}

fn main() {
    rocket::ignite().mount("/", routes![index]).launch();
}


