---
published: false
layout: post
title: Building a Plugin System with RPC
date: {}
categories: articles
---

Aside from generics, one of the items I see creep up a lot when discussing Go is the lacl of extensibility after compiling a Go project. 

## Our Old Friend: RPC

A [remote procedure call][wiki-rpc] (RPC) allows for a program to execute a subroutine or procedure in another address space. In other words, RPC lets one program call a function within another program and, in many cases, a client program calls the exposed functionality of a server program.

[wiki-rpc]: http://en.wikipedia.org/wiki/Remote_procedure_call