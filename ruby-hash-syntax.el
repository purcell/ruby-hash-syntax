;;; ruby-hash-syntax.el --- Toggle ruby hash syntax between classic and 1.9 styles

;; Copyright (C) 2013  Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; Version: DEV
;; URL: https://github.com/purcell/ruby-hash-syntax
;; Keywords: languages

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Adapted from the method used by TextMate, this library provides
;; a command `ruby-hash-syntax-toggle' which attempts to automatically
;; convert the selected region of ruby code between 1.8 and 1.9 hash styles.

;;; Code:

;; Borrowed from https://github.com/textmate/ruby.tmbundle/blob/master/Commands/Convert%20Ruby%20hash%20to%201_9%20syntax.tmCommand

;;;###autoload
(defun ruby-toggle-hash-syntax (beg end)
  "Toggle syntax of ruby hash literal in region from BEG to END between ruby 1.8 and 1.9 styles."
  (interactive "r")
  (save-excursion
    (goto-char beg)
    (cond
     ((save-excursion (search-forward "=>" end t))
        (while (re-search-forward ":\\([a-zA-Z0-9_]+\\) +=> +" end t)
          (replace-match "\\1: ")
          (beginning-of-line)))
     ((save-excursion (re-search-forward "\\w+:" end t))
      (let ((count 0) (change 3));; account for addition of characters
        (while (re-search-forward "\\([a-zA-Z0-9_]+\\):\\( *\\(?:\"\\(?:\\\"\\|[^\"]\\)*\"\\|'\\(?:\\'\\|[^']\\)*'\\|[a-zA-Z0-9_]+([^)]*)\\|[^,\\n]+\\)\\)"
                                  (+ end (* change count)) t)
          (replace-match ":\\1 =>\\2")
          (setq count (+ count 1))
          (beginning-of-line)))))))


(provide 'ruby-hash-syntax)
;;; ruby-hash-syntax.el ends here
