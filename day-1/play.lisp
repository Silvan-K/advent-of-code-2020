#!/usr/bin/env sbcl --script

(let ((infile (open "input" :if-does-not-exist nil)))
  (when infile
    (format t "~a~%" (read-line infile))
    (close infile)))

