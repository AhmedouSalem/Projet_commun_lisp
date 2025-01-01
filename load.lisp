(format t "Chargement des dépendances...~%")


(load "/home/ahmedou/Bureau/compilation_project/vm/instructions/init.lisp")
;; Chargement des fichiers partagés (utils et constants en premier)
(load "/home/ahmedou/Bureau/compilation_project/shared/utils.lisp")
(load "/home/ahmedou/Bureau/compilation_project/shared/constants.lisp")
(load "/home/ahmedou/Bureau/compilation_project/vm/instructions/memory.lisp")


;; Chargement des fichiers d'instructions avant la définition de la VM
(load "/home/ahmedou/Bureau/compilation_project/vm/instructions/stack.lisp")
(load "/home/ahmedou/Bureau/compilation_project/vm/instructions/arithmetique.lisp")
(load "/home/ahmedou/Bureau/compilation_project/vm/instructions/compare.lisp")
(load "/home/ahmedou/Bureau/compilation_project/vm/instructions/jump.lisp")

;; Chargement de la VM après les instructions
(load "/home/ahmedou/Bureau/compilation_project/vm/vm.lisp")

;; Chargement des fichiers de tests en dernier
(load "/home/ahmedou/Bureau/compilation_project/vm/test/vm.lisp")

(format t "Tous les fichiers ont été chargés avec succès.~%")
