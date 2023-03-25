rustup component add rls rust-analysis rust-src rustfmt clippy
echo "Installing Rust tools for wasm..."
rustup target add wasm32-unknown-unknown
cargo install trunk
cargo install cargo-watch
cargo install cargo-edit
cargo install mprocs 
