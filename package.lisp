;;;; package.lisp

(cl:in-package cl-user)


(defpackage "https://github.com/g000001/srfi-229"
  (:use)
  (:export
   case-lambda/tag
   lambda/tag
   procedure/tag?
   procedure-tag))


(defpackage "https://github.com/g000001/srfi-229#internals"
  (:use "CL"
        "https://github.com/g000001/srfi-16"
        "https://github.com/g000001/srfi-229"))

;;; *EOF*
