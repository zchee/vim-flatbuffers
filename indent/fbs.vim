" Copyright 2016 The vim-flatbuffers Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.

" File: indent/fbs.vim
" Maintainer: Koichi Shiraish <zchee.io@gmail.com>
" Language:	fbs

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal cindent
setlocal nolisp

let b:undo_indent = "setl cin<"
