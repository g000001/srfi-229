;;;; srfi-229.lisp

(cl:in-package "https://github.com/g000001/srfi-229#internals")


(defvar *tagged-procedures* '())


(defvar *key* (list 'key))


(defun make-procedure/tag (tag proc)
  (let ((f (case-lambda
            ((arg)
             (if (eq arg *key*) tag (funcall proc arg)))
            (arg*
             (apply proc arg*)))))
    (push f *tagged-procedures*)
    f))


(defmacro case-lambda/tag (expr &rest formals+body)
  `(make-procedure/tag ,expr (case-lambda ,@formals+body)))


(defmacro lambda/tag (expr (&rest formals) &body body)
  `(make-procedure/tag ,expr (lambda (,@formals) ,@body)))


(defun procedure/tag? (f)
  (and (member f *tagged-procedures*) T))


(defun procedure-tag (f)
  (funcall f *key*))


;;; *EOF*
