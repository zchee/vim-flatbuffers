" Copyright 2016 The vim-flatbuffers Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.

" File: syntax/fbs.vim
" Maintainer: Koichi Shiraish <zchee.io@gmail.com>
" Language:	fbs


if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

" -----------------------------------------------------------------------------
" Comment

syn keyword  fbsTodo       contained TODO FIXME XXX BUG NOTE
syn cluster  fbsComment    contains=fbsTodo
syn region   fbsComment    start="//" skip="\\$" end="$"  keepend contains=@fbsComment
syn region   fbsDocument   start="///" skip="\\$" end="$" keepend contains=@fbsComment

" -----------------------------------------------------------------------------
" Syntax

syn keyword  fbsSyntax     attribute include file_identifier file_extension
syn keyword  fbsSyntax     namespace root_type rpc_service
syn keyword  fbsStructure  union struct table enum nextgroup=fbsName skipwhite skipnl

syn match    fbsName       /\w\+/ contained
syn match    fbsParam      /\<\w\+\ze\:/ contained

" -----------------------------------------------------------------------------
" FieldType

" 8 bit
syn keyword  fbsType  contained byte ubyte bool
" 16 bit
syn keyword  fbsType  contained short ushort
" 32 bit
syn keyword  fbsType  contained int uint float
" 64 bit
syn keyword  fbsType  contained long ulong double
" string only hold UTF-8 or 7-bit ASCII
syn keyword  fbsType  contained string

" -----------------------------------------------------------------------------
" Attributes

" <flatbuffers/idl.h>
syn keyword  fbsAttributes      deprecated required key hash id force_align bit_flags
syn keyword  fbsAttributes      original_order nested_flatbuffer csharp_partial streaming
syn keyword  fbsAttributes      idempotent cpp_type cpp_ptr_type native_inline
syn cluster  fbsAttributesData  contains=@fbsAttributes
syn region   fbsAttributesData  start="(" skip="," end=")" fold

" -----------------------------------------------------------------------------
" type

syn keyword  fbsBool       true false contained
syn match    fbsInt        /-\?\<\d\+\>/ contained
syn match    fbsInt        /\<0[xX]\x+\>/ contained
syn match    fbsFloat      /\<-\?\d*\(\.\d*\)\?/ contained
syn match    fbsOperator   /=/ contained
syn region   fbsString     start=/"/ skip=/\\./ end=/"/

" -----------------------------------------------------------------------------
" Block

syn region   fbsBlock      start="{" end="}" contains=fbsTodo,fbsComment,fbsType,fbsParam,fbsAttributes,fbsBool,fbsInt,fbsOperator transparent

" -----------------------------------------------------------------------------

hi def link  fbsTodo       Todo
hi def link  fbsComment    Comment
hi def link  fbsDocument   Comment

hi def link  fbsSyntax     Statement
hi def link  fbsStructure  Structure
hi def link  fbsName       Function
hi def link  fbsParam      Identifier

hi def link  fbsType       Type
hi def link  fbsAttributes String

hi def link  fbsBool       Boolean
hi def link  fbsInt        Number
hi def link  fbsFloat      Float
hi def link  fbsOperator   Operator
hi def link  fbsString     String

" -----------------------------------------------------------------------------
let b:current_syntax = "fbs"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
