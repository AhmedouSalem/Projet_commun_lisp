(defun resolve-constant (value)
  "Si `value` est une constante sous la forme `(:CONST X)`, retourne X, sinon retourne `value`."
  (if (and (listp value) (eq (first value) :CONST))
      (second value)
      value))
