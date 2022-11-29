#[doc = include_str!("../README.md")]


pub mod service;

// Rexport all module members
pub use {
    service:*;
}