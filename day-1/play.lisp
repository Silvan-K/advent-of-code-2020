#!/usr/bin/env sbcl --script

(defun read-lines (infile)
  (loop :for line := (read-line infile nil)
	:while line
	:collect line))

(defun parse-numbers (strings)
  (mapcar #'parse-integer strings))

(defun get-numbers ()
  (let ((infile (open "input" :if-does-not-exist nil)))
    (let ((numbers (parse-numbers (read-lines infile))))
      (return-from get-numbers numbers))
    (close infile)))

(defun sum-to-2020 (x y)
  (= 2020 (+ x y)))

(let ((numbers (get-numbers)))
  (write numbers))
