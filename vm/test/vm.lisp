(defun test-vm ()
  (let ((vm (vm-init))
        (program '((PUSH (:CONST 50))   ; Empiler 50
                   (PUSH (:CONST 20))   ; Empiler 20
                   (SUB)                ; Soustraire (50 - 20)
                   (PUSH (:CONST 5))    ; Empiler 5
                   (DIV)                ; Diviser le résultat précédent par 5
                   (PUSH (:CONST 2))    ; Empiler 2
                   (ADD)                ; Ajouter 2 au résultat
                   (PUSH (:CONST 3))    ; Empiler 3
                   (MUL)                ; Multiplier par 3
                   (POP :R0))))         ; Dépiler le résultat dans R0
    (vm-execute vm program)
    (format t "Test réussi : R0 = ~A (attendu : 24)~%" (vm-get-register vm :R0))))

(defun test-conditions-vm ()
  (let ((vm (vm-init))
        (program '((PUSH (:CONST 10))    ; Empiler 10
                   (PUSH (:CONST 20))    ; Empiler 20
                   (CMP (:SP -1) :SP)    ; Comparer les deux valeurs (10 < 20)
                   (JLT 6)               ; Sauter à l'instruction 6 si vrai
                   (PUSH (:CONST 0))     ; Cette instruction sera ignorée
                   (JMP 7)               ; Sauter à la fin
                   (PUSH (:CONST 1)))))  ; Empiler 1 si le saut conditionnel a eu lieu
    (vm-execute vm program)
    (format t "Pile après exécution : ~A~%" (vm-memory vm))
    (format t "Valeur finale de R0 : ~A (attendu : 1)~%" (vm-get-register vm :R0))))
