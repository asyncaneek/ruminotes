rustup component add rls rust-analysis rust-src rustfmt clippy 2>&1
echo "Installing Rust tools for wasm..."
rustup component add target add wasm32-unknown-unknown
cargo install trunk
cargo install cargo-watch
cargo install cargo-edit
cargo install mprocs 
