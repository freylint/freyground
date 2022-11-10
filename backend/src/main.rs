#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket::fs::NamedFile;
use std::io;
use std::path::Path;
use std::path::PathBuf;

#[get("/")]
async fn index() -> io::Result<NamedFile> {
    // TODO handle errors?
    NamedFile::open(Path::new("index.html")).await
}

#[get("/<file..>")]
async fn serve(file: PathBuf) -> io::Result<NamedFile> {
    let prefix: PathBuf = "build/".into();
    let path = prefix.join(file);
    println!("{:?}", path);
    NamedFile::open(path).await
}

#[launch]
fn rocket() -> _ {
    rocket::build()
        .mount("/", routes![index, serve])
}
