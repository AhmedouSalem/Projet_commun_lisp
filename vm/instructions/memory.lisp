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
    (setf (aref (vm-registers vm) resolved) value)))



(defun vm-push (vm value)
  "Empile `value` (résolu si c'est une constante) sur la pile."
  (let ((sp (vm-stack-pointer vm)))
    (vm-set-memory vm sp (resolve-constant value))  ; Résout les constantes avant de les empiler
    (setf (vm-stack-pointer vm) (1+ sp))))


(defun vm-pop (vm)
  "Dépile une valeur et la retourne."
  (let ((sp (1- (vm-stack-pointer vm))))
    (setf (vm-stack-pointer vm) sp)
    (vm-get-memory vm sp)))
