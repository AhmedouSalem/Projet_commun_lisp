(defun handle-push (vm instr)
  "Gère l'instruction PUSH."
  (let ((src (second instr)))
    (vm-push vm src)))

(defun handle-pop (vm instr)
  "Gère l'instruction POP."
  (let ((dest (second instr)))
    (vm-set-register vm dest (vm-pop vm))))
