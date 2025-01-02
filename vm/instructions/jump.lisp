(defun handle-jmp (vm address)
  "Saute inconditionnellement à l'adresse donnée."
  (setf (vm-program-counter vm) address))


(defun handle-jeq (vm address)
  "Saute à l'adresse si le drapeau est 'eq'."
  (if (eq (vm-flag vm) 'eq)
      (progn
        (setf (vm-program-counter vm) address)
        (format t "Saut JEQ effectué vers l'adresse : ~A~%" address))
      (format t "Saut JEQ ignoré : drapeau = ~A~%" (vm-flag vm))))


(defun handle-jne (vm address)
  "Saut conditionnel si le drapeau n'est pas `eq`."
  (if (not (eq (vm-flag vm) 'eq))
      (progn
        (setf (vm-program-counter vm) address)
        (format t "Saut JNE effectué vers l'adresse : ~A~%" address))
      (format t "Saut JNE ignoré : drapeau = ~A~%" (vm-flag vm))))


(defun handle-jlt (vm address)
  "Saute à l'adresse si le drapeau est 'lt'."
  (if (eq (vm-flag vm) 'lt)
      (progn
        (setf (vm-program-counter vm) address)
        (format t "Saut JLT effectué vers l'adresse : ~A~%" address)) ; Débogage
      (format t "Saut JLT ignoré : drapeau = ~A~%" (vm-flag vm)))) ; Débogage



(defun handle-jle (vm address)
  "Saut conditionnel si le drapeau est `lt` ou `eq`."
  (if (or (eq (vm-flag vm) 'lt) (eq (vm-flag vm) 'eq))
      (progn
        (setf (vm-program-counter vm) address)
        (format t "Saut JLE effectué vers l'adresse : ~A~%" address))
      (format t "Saut JLE ignoré : drapeau = ~A~%" (vm-flag vm))))


(defun handle-jgt (vm address)
  "Saute à l'adresse si le drapeau est 'gt'."
  (if (eq (vm-flag vm) 'gt)
      (progn
        (setf (vm-program-counter vm) address)
        (format t "Saut JGT effectué vers l'adresse : ~A~%" address))
      (format t "Saut JGT ignoré : drapeau = ~A~%" (vm-flag vm))))


(defun handle-jge (vm address)
  "Saut conditionnel si le drapeau est `gt` ou `eq`."
  (if (or (eq (vm-flag vm) 'gt) (eq (vm-flag vm) 'eq))
      (progn
        (setf (vm-program-counter vm) address)
        (format t "Saut JGE effectué vers l'adresse : ~A~%" address))
      (format t "Saut JGE ignoré : drapeau = ~A~%" (vm-flag vm))))

