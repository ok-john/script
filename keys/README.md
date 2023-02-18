## bi

A cli for working with curve25519 points in montegomery or their **bi**rationally equivalent edwards representation. 

Why work with [two representations](https://en.wikipedia.org/wiki/Curve25519#Mathematical_properties) of the same curve? One
is used for DH the other for EdDSA.

This is a properitary closed source product, precompiled binaries are included and available for the following architechtures.

```
darwin-amd64  freebsd-amd64  freebsd-arm64  linux-amd64  linux-arm64  linux-mips64    linux-ppc64    linux-s390x    windows-arm5   windows-arm7
darwin-arm64  freebsd-arm5   freebsd-arm7   linux-arm5   linux-arm7   linux-mips64le  linux-ppc64le  windows-386    windows-arm6
freebsd-386   freebsd-arm6   linux-386      linux-arm6   linux-mips   linux-mipsle    linux-riscv64  windows-amd64  windows-arm64
```

<p float="left" align="middle">
<img src="./example.svg" />
</p>

## Installation

There are signed binaries for every arch/os under the latest releases.


### Extract

```
tar xvf build.tar.zst
```
Find a binary for your arch and move it under `$PATH`.

## Usage


### Create a new keypair

```bash
$ umask 077
$ bi gen | tee privatekey | bi pub > publickey
```

### Sign a file

```bash
$ bi sign privatekey Makefile > signature ```

### Verify a signature

```bash
$ bi verify signature Makefile publickey 
[valid]
public_key=e95ca2852450d4a1926c8878c9ad33ab0d7e60a62c0bd33809f6f9ee7d07d1e9
signature=b7760e66e7ae1de27d07d6ab913fcc172e93514831ecd16fa86e699fce3ae1605389fdce4317b1f6296830e129cc87e675ce3a4a1b868dc7651913f1cfabab04
file=Makefile
```

