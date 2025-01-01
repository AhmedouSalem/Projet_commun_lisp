(defun handle-add (vm)
  "Additionne les deux dernières valeurs empilées et empile le résultat."
  (let ((val1 (resolve-constant (vm-pop vm)))   ; Résout la constante si nécessaire
        (val2 (resolve-constant (vm-pop vm))))  ; Résout la constante si nécessaire
    (vm-push vm (+ val1 val2))))  ; Empile le résultat

(defun handle-mul (vm)
  "Multiplie les deux dernières valeurs empilées et empile le résultat."
  (let ((val1 (resolve-constant (vm-pop vm)))   ; Résout la constante si nécessaire
        (val2 (resolve-constant (vm-pop vm))))  ; Résout la constante si nécessaire
    (vm-push vm (* val1 val2))))  ; Empile le résultat


(defun handle-sub (vm)
  "Soustrait les deux dernières valeurs empilées et empile le résultat."
  (let ((val1 (resolve-constant (vm-pop vm)))   ; Résout la constante si nécessaire
        (val2 (resolve-constant (vm-pop vm))))  ; Résout la constante si nécessaire
    (vm-push vm (- val2 val1))))  ; Note : on soustrait dans l'ordre (val2 - val1)


(defun handle-div (vm)
  "Divise les deux dernières valeurs empilées et empile le résultat."
  (let ((val1 (resolve-constant (vm-pop vm)))   ; Résout la constante si nécessaire
        (val2 (resolve-constant (vm-pop vm))))  ; Résout la constante si nécessaire
    (vm-push vm (/ val2 val1))))  ; Note : on divise dans l'ordre (val2 / val1)
