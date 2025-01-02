(defun handle-push (vm instr)
  "Gère l'instruction PUSH."
  (let ((src (second instr)))
    (vm-push vm src)))

(defun handle-pop (vm instr)
  "Gère l'instruction POP."
  (let ((dest (second instr)))
    (let ((popped-value (vm-pop vm)))
      (format t "Valeur dépilée : ~A, à enregistrer dans : ~A~%" popped-value dest)
      (vm-set-register vm dest popped-value))))


; (defun handle-push (vm instr)
;   "Gère l'instruction PUSH."
;   (let ((src (second instr)))
;     (format t "PUSH : Empiler la valeur ~A~%" (resolve-address vm src))
;     (vm-push vm (resolve-address vm src))))

; (defun handle-pop (vm instr)
;   "Gère l'instruction POP."
;   (let ((dest (second instr)))
;     (let ((val (vm-pop vm)))
;       (format t "POP : Extraire la valeur ~A et la placer dans ~A~%" val dest)
;       (vm-set-register vm dest val))))
