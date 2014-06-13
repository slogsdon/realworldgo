---
layout: post
title: "Installation and Environment Setup"
date: 2014-06-11 13:13:00
author: 0
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
$ tar -C /usr/local -xfz go1.2.2.darwin-amd64-osx10.8.tar.gz
```

```bash
export GOPATH=$HOME/Code/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

### From Source

```bash
$ hg clone -u release https://code.google.com/p/go
$ cd go/src
$ ./all.bash
```

## Verify Installation

```bash
go version
```

## What's that `$GOPATH` thing?

```bash
$ ls $GOPATH
```

Nothing because we just started. Will be bin, pkg, src

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

### Vagrant

[golang_org]:        http://golang.org
[weebl_pie]:         http://www.weebls-stuff.com/wab/pie/
[go_downloads_page]: https://code.google.com/p/go/wiki/Downloads?tm=2