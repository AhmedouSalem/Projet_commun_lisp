(defstruct vm
  (memory (make-array 1024 :initial-element 0))  ; Mémoire
  (registers (make-array 10 :initial-element 0)) ; Registres : R0 à R9
  (stack-pointer 0)                              ; Pointeur de pile
  (frame-pointer 0)                              ; Pointeur de trame
  (program-counter 0)                            ; Compteur de programme
  (flag nil))                                    ; Drapeau pour les comparaisons
                          ; Compteur de programme

(defun vm-init ()
  "Initialise une nouvelle machine virtuelle (VM)."
  (make-vm
   :memory (make-array 1024 :initial-element 0)  ; Mémoire initiale (taille 1024)
   :registers (make-array 10 :initial-element 0) ; 10 registres (R0 à R9)
   :stack-pointer 0                              ; Pointeur de pile initialisé à 0
   :frame-pointer 0                              ; Pointeur de trame initialisé à 0
   :program-counter 0                            ; Compteur de programme initialisé à 0
   :flag nil))                                   ; Drapeau initialisé à NIL
