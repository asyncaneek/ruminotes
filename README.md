# Introduction 
Project for delivering a mission document reader/editor to a browser for use in AIMS and C4.  


## Getting Started
- [Get Rust](https://doc.rust-lang.org/book/ch01-01-installation.html)
- Setup Development Environment
    - `rustup target add wasm32-unknown-unknown`
    - `cargo install trunk`

## Build and Run
- To build and test run `cargo test`
- To start the server run `cargo run --bin backend -- --port 8081`
- To start the frontend run `cd mdoc_frontend; trunk serve --open` 
- To view the application; navigate to http://127.0.0.1:8080/mock_note in a browser


## Dev-tools ( optional )
### Vs Code Extensions
- [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
- [better-toml](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml)
- [crates](https://marketplace.visualstudio.com/items?itemName=serayuzgur.crates)
- [thunder client](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client)

### Use with mprocs and cargo-watch utilites for easy setup and hot reloading
- install utility cargo-watch `cargo install cargo-watch`
- install utility mprocs `cargo install mprocs` 
- from the root dir, launch application with just `mprocs`, which uses [mprocs.yaml](./mprocs.yaml) as the configuration


## References
- [rust by example](https://doc.rust-lang.org/stable/rust-by-example/index.html)
- [axum](https://docs.rs/axum/latest/axum/#)
- [mprocs](https://github.com/pvolok/mprocs)
- ["A Rust web server / frontend setup like it's 2022 (with axum and yew)" by Robert Krahn](https://robert.kra.hn/posts/2022-04-03_rust-web-wasm/#tools-required)