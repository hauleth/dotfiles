syntax match rustDocCommentHeader "#\+\s.*" contained containedin=rustCommentLineDoc
syntax match rustDocCommentLink "\[[^]]\+\]" contained containedin=rustCommentLineDoc
syntax match rustDocCommentURL "https\?://\S\+" contained containedin=rustCommentLineDoc
hi link rustDocCommentHeader Define
hi link rustDocCommentLink Include
hi link rustDocCommentURL Underline
