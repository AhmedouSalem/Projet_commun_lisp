(defun handle-jmp (vm address)
  "Saute inconditionnellement à l'adresse donnée."
  (setf (vm-program-counter vm) address))


(defun handle-jeq (vm address)
  "Saute à l'adresse si le drapeau est 'eq'."
  (when (eq (vm-flag vm) 'eq)
    (setf (vm-program-counter vm) address)))


(defun handle-jne (vm label)
  "Saut conditionnel si le drapeau n'est pas `eq`."
  (when (not (eq (vm-flag vm) 'eq))
    (handle-jmp vm label)))

(defun handle-jlt (vm address)
  "Saute à l'adresse si le drapeau est 'lt'."
  (when (eq (vm-flag vm) 'lt)
    (setf (vm-program-counter vm) address)))


(defun handle-jle (vm label)
  "Saut conditionnel si le drapeau est `lt` ou `eq`."
  (when (or (eq (vm-flag vm) 'lt) (eq (vm-flag vm) 'eq))
    (handle-jmp vm label)))

(defun handle-jgt (vm address)
  "Saute à l'adresse si le drapeau est 'gt'."
  (when (eq (vm-flag vm) 'gt)
    (setf (vm-program-counter vm) address)))


(defun handle-jge (vm label)
  "Saut conditionnel si le drapeau est `gt` ou `eq`."
  (when (or (eq (vm-flag vm) 'gt) (eq (vm-flag vm) 'eq))
    (handle-jmp vm label)))
