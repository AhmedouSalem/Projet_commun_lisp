(defun handle-cmp (vm reg1 reg2)
  "Compare les valeurs des registres `reg1` et `reg2` et met à jour le drapeau `flag`."
  (let ((val1 (vm-get-register vm reg1))
        (val2 (vm-get-register vm reg2)))
    (cond
      ((= val1 val2) (setf (vm-flag vm) 'eq))  ; Égaux
      ((< val1 val2) (setf (vm-flag vm) 'lt))  ; Inférieur
      ((> val1 val2) (setf (vm-flag vm) 'gt))))) ; Supérieur
