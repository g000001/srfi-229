;;;; srfi-229.asd

(cl:in-package :asdf)


(defsystem :srfi-229
  :version "20220415"
  :description "SRFI 229 for CL: Tagged Procedures"
  :long-description "SRFI 229 for CL: Tagged Procedures
https://srfi.schemers.org/srfi-229"
  :author "CHIBA Masaomi"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (trivial-garbage srfi-16)
  :components ((:file "package")
               (:file "srfi-229")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-229))))
  (let ((name "https://github.com/g000001/srfi-229")
        (nickname :srfi-229))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))

;;; *EOF*
