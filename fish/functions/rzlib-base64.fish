function rzlib-base64
  ruby -rzlib -rbase64 -e 'puts Base64.encode64(Zlib::Deflate.deflate(ARGF.read))' $argv; 
end
