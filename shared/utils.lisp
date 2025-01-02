(defun register-index (reg)
  "Convertit un nom de registre (comme :R0 ou :R1) en son index numérique."
  (cond
    ;; Registres généraux R0-R9
    ((eq reg :R0) 0)
    ((eq reg :R1) 1)
    ((eq reg :R2) 2)
    ((eq reg :R3) 3)
    ((eq reg :R4) 4)
    ((eq reg :R5) 5)
    ((eq reg :R6) 6)
    ((eq reg :R7) 7)
    ((eq reg :R8) 8)
    ((eq reg :R9) 9)
    ;; Erreur si le registre est inconnu
    (t (error "Registre inconnu : ~A" reg))))


(defun resolve-address (vm address)
  "Résout une adresse dynamique dans la pile ou un registre spécial."
  (cond
    ;; Si l'adresse est un registre général
    ((member address '(:R0 :R1 :R2 :R3 :R4 :R5 :R6 :R7 :R8 :R9))
     (register-index address))  ; Utilise `register-index`
    
    ;; Si l'adresse est un registre spécial
    ((eq address :SP) (vm-stack-pointer vm))  ; Pointeur de pile
    ((eq address :FP) (vm-frame-pointer vm))  ; Pointeur de trame
    ((eq address :PC) (vm-program-counter vm))  ; Compteur de programme
    
    ;; Si l'adresse est relative, comme (:SP -1)
    ((and (listp address) (eq (first address) :SP))
     (let ((computed-address (+ (vm-stack-pointer vm) (second address))))
       ;; Vérifie que l'adresse relative est valide
       (if (or (< computed-address 0) (>= computed-address (length (vm-memory vm))))
           (error "Adresse relative invalide : ~A" address)
           computed-address)))  ; Retourne l'adresse résolue si valide

    ;; Sinon, erreur pour les cas non pris en charge
    (t (error "Adresse inconnue ou invalide : ~A" address))))
