function color-test
  for code in (seq 0 255)
    echo -e "\e[00;38;5;"$code"m $code: Test"
  end
end
