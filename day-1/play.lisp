#!/usr/bin/env sbcl --script

(defun read-lines (infile)
  (loop :for line := (read-line infile nil)
	:while line
	:collect line))

(defun parse-numbers (strings)
  (mapcar #'parse-integer strings))

(defun sum-to-2020 (x y)
  (= 2020 (+ x y)))

(let ((infile (open "input" :if-does-not-exist nil)))
  (let ((numbers (parse-numbers (read-lines infile))))
    (write numbers))
  (close infile))

