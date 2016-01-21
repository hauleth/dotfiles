syntax match hsNiceOperator "\\\ze[[:alpha:][:space:]_([]" conceal cchar=λ

syntax match hsNiceOperator "<-" conceal cchar=←
syntax match hsNiceOperator "->" conceal cchar=→
syntax match hsNiceOperator "=>" conceal cchar=⇒
syntax match hsNiceOperator "\:\:" conceal cchar=∷

syntax match hsNiceOperator "\.\." conceal cchar=…

syntax match hsNiceOperator "\<Bool\>" conceal cchar=𝔹
syntax match hsNiceOperator "\<Rational\>" conceal cchar=ℚ
syntax match hsNiceOperator "\<Integer\>"  conceal cchar=ℤ
syntax match hsNiceOperator "\<Double\>"   conceal cchar=𝔻
