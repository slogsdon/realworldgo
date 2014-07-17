---
layout: post
title: Installation and Environment Setup
date: {}
author: 0
categories: tutorials
published: true
---

Installing the necessary bits and bobs when new to any language can really impose a delay on the fun (and important) part: learning that language. Let's get around this so we can really dig into Go.

## Installing

Lucky for us, we have a few options supplied to us by the fine folks maintaining [golang.org][golang_org]. We're going to be looking into two, specifically a binary distribution (from archives) and the source distribution. Rest assured,

### From Binaries

Installing from binaries is as easy as [pie][weebl_pie]. Open up a handy terminal/console window, and follow along.

First, we want to download an archive for our target host, in this case Mac OS X (64-bit). Head over to the [Go downloads page][go_downloads_page] to make sure to pick the right archive for your platform and architecture.

```bash
$ curl https://storage.googleapis.com/golang/go1.2.2.darwin-amd64-osx10.8.tar.gz \
  > go1.2.2.darwin-amd64-osx10.8.tar.gz
```

Second, we want to uncompress our archive into our desired location. We're going to do this in our `/usr/local` directory, but this is entirely up to you. Just be aware that you may need `sudo` privileges to write to your desired directory.

```bash
$ tar -C /usr/local -xfz go1.2.2.darwin-amd64-osx10.8.tar.gz
```

The binary path needs to be added to your `PATH` environment. We're going to be tackling this by editing our user's `~/.zshrc` (or `~/.bash_profile`, etc.). If we want this to apply to all users, the lines will need to be added to `/etc/profile`, the system-wide `.profile` for `sh`.

While we're here, let's go ahead and add the necessary bits for `GOPATH` and the `GOPATH` binary directory.

```bash
export GOPATH="$HOME/Code/go"
# Replace /usr/local below with your install directory (if necessary)
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
```

Finally, we'll need to load our updated profile. The easiest way to accomplish this is to just start up another terminal window or tab, but if you're like me and don't want to do that, source your profile.

```bash
$ source ~/.zshrc
```

Awesome! Let's [verify our installation](#verify-our-installation).

### From Source

```bash
$ cd /usr/local
$ hg clone -u release https://code.google.com/p/go
$ cd go/src
$ ./all.bash
```

Just like with the installation process with binary archives, the binary path needs to be added to your `PATH` environment. Here they are again for reference.

```bash
export GOPATH="$HOME/Code/go"
# Replace /usr/local below with your install directory (if necessary)
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
```

We'll also need to load our updated profile.

```bash
$ source ~/.zshrc
```

## Verify Our Installation

Let's get a quick verification that our go binary is installed properly. 

```bash
$ go version
```

You should see your desired go version displayed in your terminal. In our case, we see {{ INSERT GO VERSION }}.

## So what's that `$GOPATH` thing?

Our defined $GOPATH acts as the workspace for our go projects and third-party libraries and binaries. The go tools use $GOPATH to do their thing. go get downloads projects to $GOPATH/src. go builds projects from $GOPATH/src (when not building a file in the current directory) and puts the binaries in $GOPATH/bin. {{ TODO verify }}

Let's see what is in our $GOPATH. 

```bash
$ ls $GOPATH
```

Nothing because we just started. Eventually, we will have bin, pkg, and src directories. Here's an example directory tree from golang.org. {{ TODO get source link }}

```bash
bin/
    streak                         # command executable
    todo                           # command executable
pkg/
    linux_amd64/
        code.google.com/p/goauth2/
            oauth.a                # package object
        github.com/nf/todo/
            task.a                 # package object
src/
    code.google.com/p/goauth2/
        .hg/                       # mercurial repository metadata
        oauth/
            oauth.go               # package source
            oauth_test.go          # test source
    github.com/nf/
        streak/
            .git/                  # git repository metadata
            oauth.go               # command source
            streak.go              # command source
        todo/
            .git/                  # git repository metadata
            task/
                task.go            # package source
            todo.go                # command source
```

[golang_org]:        http://golang.org
[weebl_pie]:         http://www.weebls-stuff.com/wab/pie/
[go_downloads_page]: https://code.google.com/p/go/wiki/Downloads?tm=2