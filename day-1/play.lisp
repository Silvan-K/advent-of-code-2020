#!/usr/bin/env sbcl --script

  

(let ((infile (open "input" :if-does-not-exist nil)))
  (when infile
    (let ((inlist (loop :for line := (read-line infile nil)
		  :while line
		  :collect line)))
      (write inlist))
    (close infile)))

