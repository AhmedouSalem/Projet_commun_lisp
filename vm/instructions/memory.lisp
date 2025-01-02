(defun vm-get-memory (vm addr)
  "Récupère la valeur à l'adresse `addr` dans la mémoire de la VM."
  (aref (vm-memory vm) addr))

(defun vm-set-memory (vm addr value)
  "Écrit `value` à l'adresse `addr` dans la mémoire de la VM."
  (setf (aref (vm-memory vm) addr) value))

(defun vm-get-register (vm reg-or-address)
  "Récupère la valeur d'un registre ou d'une adresse dans la pile."
  (let ((resolved (resolve-address vm reg-or-address)))
    (aref (vm-registers vm) resolved)))



(defun vm-set-register (vm reg-or-address value)
  "Définit une valeur dans un registre ou une adresse dans la pile."
  (let ((resolved (resolve-address vm reg-or-address)))
    (format t "Mise à jour du registre ~A avec la valeur ~A~%" reg-or-address value)
    (setf (aref (vm-registers vm) resolved) value)))



(defun vm-push (vm value)
  "Empile `value` (résolu si c'est une constante) sur la pile."
  (let ((sp (vm-stack-pointer vm)))
    (vm-set-memory vm sp (resolve-constant value))  ; Résout les constantes avant de les empiler
    (format t "Valeur empilée : ~A à SP = ~A~%" value sp)
    (setf (vm-stack-pointer vm) (1+ sp))))


(defun vm-pop (vm)
  "Dépile une valeur et la retourne."
  (let ((sp (1- (vm-stack-pointer vm))))
    (setf (vm-stack-pointer vm) sp)
    (let ((value (vm-get-memory vm sp)))
      (format t "Valeur dépilée depuis SP = ~A : ~A~%" sp value)
      value)))
