#!/usr/bin/env guile
!#

(load-extension "./libguile-bessel" "init_bessel")
(format #t "~s\n" (j0 2))
