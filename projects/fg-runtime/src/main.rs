//! Freyground microservices runtime
//!
//! This handles the loading, and execution of the various wasm components
//! of the greater freyground repository.

#![warn(clippy::all)]

use wasmer::{Store, Module, Instance, Value, imports};
use wasmer::FunctionEnv;
use tokio::fs::File;
use tokio::io::{self, AsyncReadExt};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    Ok(())
}

pub(crate) mod wasm_load {
    //! Wasm module loading logic
    
    /// A LUT of file paths to load services from.
    #[derive(Debug, PartialEq)]
    pub(crate) struct ServiceManifest<'manifest> {
        fg_smi: &'manifest str,
    }

    impl<'manifest> ServiceManifest<'manifest> {
        fn new(smi: &'manifest str) -> Self{
            Self {
                fg_smi: smi,
            }
        }
    }

    impl Default for ServiceManifest<'static> {
        fn default() -> ServiceManifest<'static> {
            Self::new("services/fg_smi.wasm")
        }
    }
    
    #[cfg(test)]
    mod manifest_tests {
        use super::*;

        #[test]
        fn srv_man_constructors() {
            let man = ServiceManifest::new("services/fg_smi.wasm");

            assert_eq!(man, ServiceManifest::default());
        }
    }
}