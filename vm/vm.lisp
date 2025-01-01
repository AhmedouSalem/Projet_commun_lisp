

(defun vm-execute-instruction (vm instr)
  "Exécute une instruction dans la VM."
  (let ((opcode (first instr)))
    (case opcode
      (PUSH (handle-push vm instr))
      (POP (handle-pop vm instr))
      (ADD (handle-add vm))
      (SUB (handle-sub vm))
      (MUL (handle-mul vm))
      (DIV (handle-div vm))
      (CMP (handle-cmp vm (second instr) (third instr))) ; Ajout de CMP
      (JMP (handle-jmp vm (second instr)))              ; Ajout de JMP
      (JEQ (handle-jeq vm (second instr)))              ; Ajout de JEQ
      (JNE (handle-jne vm (second instr)))              ; Ajout de JNE
      (JLT (handle-jlt vm (second instr)))              ; Ajout de JLT
      (JLE (handle-jle vm (second instr)))              ; Ajout de JLE
      (JGT (handle-jgt vm (second instr)))              ; Ajout de JGT
      (JGE (handle-jge vm (second instr)))              ; Ajout de JGE
      (t (error "Instruction inconnue : ~A" instr)))))



(defun vm-execute (vm program)
  "Exécute un programme dans la VM."
  (loop for instr in program
        do (vm-execute-instruction vm instr)))
