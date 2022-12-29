
/// Message for checking if running applications are still responding.
pub enum KeepAliveMsg {
    Ping,
    Pong
}

#[cfg(test)]
mod tests {
}
