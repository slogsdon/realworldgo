---
layout: post
title: "Installation and Environment Setup"
date: 2014-06-11 13:13:00
---

## Install

### From Binaries

```bash
$ curl https://storage.googleapis.com/golang/go1.2.2.darwin-amd64-osx10.8.tar.gz > go1.2.2.darwin-amd64-osx10.8.tar.gz
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

##
### Docker
### Vagrant