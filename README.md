# KRoC in Docker

This is [KRoC](https://www.cs.kent.ac.uk/projects/ofa/kroc/) in a Docker container.
KRoC is the Kent Retargetable occam Compiler.
This Docker container will fetch `kroc-1.6.0` from [`concurrency/kroc`](https://github.com/concurrency/kroc) and compile it.

We use `i386/ubuntu:12.04` as a base, because KRoC only works in an 32-bit environment.

## Building

### Building yourself

The Docker container can be build with (if you want to build it yourself):

```bash
$ docker build -t TAGNAME .
```

### Using the Docker Hub image

You can also pull the current Docker image directly from Docker Hub:

```bash
$ docker pull omegahm/kroc
```

## Running

Tests can be run afterwards with (if you built it yourself replace `omegahm/kroc` with your tag name):

```bash
$ docker run -it --rm omegahm/kroc
```

And lastly, you can enter the Docker container with:

```bash
$ docker run -it --rm omegahm/kroc bash
```

Here you can create a "Hello, world!" program and test it:

```bash
$ cat > hello.occ << EOF
#INCLUDE "course.module"
PROC hello (CHAN BYTE out!)
  out.string ("Hello, world!*n", 0, out!)
:
EOF
```

and then compiled and run with

```bash
$ occbuild --program hello.occ && ./hello
```

which will yield

```bash
Hello, world!
```

to the console.
