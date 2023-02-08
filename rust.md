
# Setup
* Install via [`rustup`](https://rustup.rs/)

# Useful crates
* [cargo edit](https://github.com/cross-rs/cross) providers Cargo.toml edit and upgrade (`cargo rm`, `cargo add`, `cargo upgrade`, `cargo set-version`)
* [`cargo cross`](https://github.com/cross-rs/cross) to ease cross compilation
* [`cargo llvm-cov`](https://github.com/taiki-e/cargo-llvm-cov) for code coverage using llvm instrumentation
* [`cargo cargo-update`](https://github.com/nabijaczleweli/cargo-update) for global binaries update
* [`cargo outdated`](https://github.com/kbknapp/cargo-outdated) to list all outdated crates in your `Cargo.toml`
* [`cargo bloat`](https://github.com/RazrFalcon/cargo-bloat) to find out what takes most of the space in your executable
* [`cargo cbindgen`](https://github.com/eqrion/cbindgen) to generate C headers from Rust
* [`cargo lipo`](https://github.com/TimNN/cargo-lipo) to compile for iOS
