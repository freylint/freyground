#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket::Request;
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
    NamedFile::open(Path::new("build/static/").join(file)).await
}

#[catch(500)]
fn internal_error() -> &'static str {
    "Internal server error: Error 500"
}
#[catch(400)]
fn not_found(req: &Request) -> String {
    format!("I couldn't find '{}'. Try something else?", req.uri())
}


#[launch]
fn rocket() -> _ {
    rocket::build()
        .mount("/", routes![index, serve])
        .register("/", catchers![internal_error, not_found],)
}
