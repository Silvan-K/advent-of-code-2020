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

(defun find-2020-partner (num0 numbers)
  (dolist (num1 numbers)
    (when (sum-to-2020 num0 num1)
      (return-from find-2020-partner num1))))

(defun find-2020-pair (numbers)
  (dolist (num0 numbers)
    (let ((num1 (find-2020-partner num0 numbers)))
      (when num1
	(return-from find-2020-pair (cons num0 num1))))))

(let ((numbers (get-numbers "input")))
  (let ((pair (find-2020-pair numbers)))
    (write (* (car pair) (cdr pair)))))

