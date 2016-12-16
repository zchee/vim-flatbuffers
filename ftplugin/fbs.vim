" Copyright 2016 The vim-flatbuffers Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.

" flatbuffers syntax file
" File: ftplugin/fbs.vim
" Maintainer: Koichi Shiraish <zchee.io@gmail.com>
" Language:	fbs

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo&vim


setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s
setlocal expandtab
setlocal formatoptions-=t
setlocal shiftwidth=2


let b:undo_ftplugin = ""

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: sw=2 ts=2 et
