;;; nicefrac.el --- AUCTeX style for the LaTeX package `nicefrac.sty' (v0.9b)

;; Copyright (C) 2004 Free Software Foundation, Inc.

;; Author: Christian Schlauer <cschl@arcor.de>
;; Maintainer: auc-tex@sunsite.dk
;; Keywords: tex

;; This file is part of AUCTeX.

;; AUCTeX is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; AUCTeX is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with AUCTeX; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Commentary:

;; This file adds support for `nicefrac.sty'.

;;; Code:

(TeX-add-style-hook
 "nicefrac"
 (function
  (lambda ()
    (TeX-add-symbols
     '("nicefrac" [ "Font changing command" ] "Numerator" "Denominator"))
    ;; enable fontifying
    (add-to-list 'font-latex-match-textual-keywords-local "nicefrac")
    (font-latex-match-textual-make))))

;;; nicefrac.el ends here
