#!/usr/bin/env guile
!#

(use-modules (ice-9 popen)
	     (ice-9 rdelim))

(call-with-port (open-input-pipe "ls -la")
  (lambda (port)
    (let loop ((line (read-line port)))
      (unless (eof-object? line)
	(format #t "~a\n" line)
	(loop (read-line port))))))
