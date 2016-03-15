augroup pandoc
  au!
  au BufReadPost *.epub,*.odt,*.docx silent %!pandoc "%" -tmarkdown
  au BufWritePost *.epub,*.odt,*.docx silent write !pandoc -o "%" -fmarkdown
augroup END
