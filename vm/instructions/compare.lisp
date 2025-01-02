(defun handle-cmp (vm reg1 reg2)
  "Compare les valeurs des registres `reg1` et `reg2` et met à jour le drapeau `flag`."
  (let ((val1 (resolve-address vm reg1))
        (val2 (resolve-address vm reg2)))
    (format t "Comparaison entre val1 = ~A et val2 = ~A~%" val1 val2)
    (cond
      ((= val1 val2) (setf (vm-flag vm) 'eq))
      ((< val1 val2) (setf (vm-flag vm) 'lt))
      ((> val1 val2) (setf (vm-flag vm) 'gt)))
    (format t "Drapeau mis à jour : ~A~%" (vm-flag vm))))
