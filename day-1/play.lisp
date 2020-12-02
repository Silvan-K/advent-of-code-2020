#!/usr/bin/env sbcl --script

(defun read-lines (infile)
  (loop :for line := (read-line infile nil)
	:while line
	:collect line))

(defun parse-numbers (strings)
  (mapcar #'parse-integer strings))

(defun get-numbers (fname)
  (let ((infile (open fname :if-does-not-exist nil)))
    (return-from get-numbers (parse-numbers (read-lines infile)))
    (close infile)))

(defun sum-to-2020 (x y)
  (= 2020 (+ x y)))

(let ((numbers (get-numbers "input")))
  (write numbers))
