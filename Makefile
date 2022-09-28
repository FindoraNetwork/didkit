
debug:
	cargo build

release:
	cargo build --release

install: release
	cp -f target/release/bin/didkit /usr/local/bin/
	cp -f target/release/bin/didkit-http /usr/local/bin/

clean:
	cargo clean
	rm -rf debug release Cargo.lock

lint:
	cargo clippy --workspace
	cargo clippy --workspace --tests

coverage:
	cargo tarpaulin --timeout=900 --branch --workspace --release \
		|| cargo install cargo-tarpaulin \
		&& cargo tarpaulin --timeout=900 --branch --workspace --release

update:
	cargo update

fmt:
	cargo fmt


