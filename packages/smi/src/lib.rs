use wasm_bindgen::prelude::*;

/// Message for checking if running applications are still responding.
#[wasm_bindgen]
pub enum KeepAliveMsg {
    Ping,
    Pong
}

#[cfg(test)]
mod tests {
}
