
# Setup
* Install via [`rustup`](https://rustup.rs/)
* Install tools: `rustup component add clippy rustfmt`

# IDE
* I use the [`IntelliJ Rust plugin`](https://github.com/intellij-rust/intellij-rust) in [`Jetbrains CLion`](https://www.jetbrains.com/clion/)
  You can use `IntelliJ` instead of `CLion`, but you lose debug support
* For CLion's profiler, see [install profiler](https://www.jetbrains.com/help/clion/cpu-profiler.html)

# Useful crates
* [`cargo outdated`](https://github.com/kbknapp/cargo-outdated) to list all outdated crates in your `Cargo.toml`
* [`cargo tree`](https://github.com/sfackler/cargo-tree) to list dependencies tree
* [`cargo tarpaulin`](https://github.com/xd009642/tarpaulin) for code coverage
* [`cargo lipo`](https://github.com/TimNN/cargo-lipo) to compile for iOS
* [`cargo cbindgen`](https://github.com/eqrion/cbindgen) to generate C headers from Rust
* [`cargo bloat`](https://github.com/RazrFalcon/cargo-bloat) to find out what takes most of the space in your executable
