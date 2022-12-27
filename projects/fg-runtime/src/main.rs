//! Freyground microservices runtime
//!
//! This handles the loading, and execution of the various wasm components
//! of the greater freyground repository.

#![warn(clippy::all)]

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    Ok(())
}

pub(crate) mod wasm_load {
    //! Wasm module loading logic
    
    pub(crate) use manifest::*;
    
    pub(crate) mod manifest {
        //! Service manifest module

        /// A LUT of file paths to load services from.
        #[derive(Debug, PartialEq)]
        pub(crate) struct ServiceManifest<'manifest> {
            path: &'manifest str,
        }

        impl<'manifest> ServiceManifest<'manifest> {
            fn new(path: &'manifest str) -> Self{
                Self {
                    path,
                }
            }
        }

        impl Default for ServiceManifest<'static> {
            fn default() -> ServiceManifest<'static> {
                Self::new("services/fg_smi.wasm")
            }
        }
        
        #[cfg(test)]
        mod test {
            use super::*;

            #[test]
            fn srv_man_constructors() {
                let man = ServiceManifest::new("services/fg_smi.wasm");

                assert_eq!(man, ServiceManifest::default());
            }
        }
    }

    pub(crate) mod module {
        //! Wasm moudle compilation module
        use wasmer::{Store, Module};
        
        /// Compiled runtime service module
        pub(crate) struct ServiceModule<'srv> {
            store: &'srv mut Store,
            module: &'srv mut Module,
        }

        impl<'srv> ServiceModule<'srv> {
            fn new() -> ServiceModule<'srv> {
                Self {
                    store: 
                }
            }
        }


        #[cfg(test)]
        mod test {
            use super::*;

            #[test]
            fn srv_mod_constructor() {
            }
        }

    }
}