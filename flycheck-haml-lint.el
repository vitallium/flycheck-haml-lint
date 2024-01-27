;;; flycheck-haml-lint.el --- HAML linter (haml-lint) support for Flycheck -*- lexical-binding: t -*-

;; Copyright (C) 2024 Jonathan del Strother
;; Copyright (C) 2024 Vitaly Slobodin

;; Author: Jonathan del Strother <jdelStrother@gmail.com>
;; Maintainer: Vitaly Slobodin <vitaliy.slobodin@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3") (flycheck "32") (haml-mode "3.1.0"))
;; Keywords: convenience, tools, languages, flycheck, haml
;; URL: https://github.com/vitallium/flycheck-haml-lint

;; This file is not part of GNU Emacs.

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

;; This Flycheck extension provides a `haml-lint' integration for flycheck to check HAML buffers for
;; errors.

;;; Code:

(require 'flycheck)

(flycheck-define-checker haml-lint
  "A HAML syntax checker using the haml-lint tool."
  :command ("haml-lint" "--no-color" "--no-summary" source-inplace)
  :working-directory flycheck-ruby--find-project-root
  :error-patterns
  ((info line-start (file-name) ":" line " [C] " (message) line-end)
   (warning line-start (file-name) ":" line " [W] " (message) line-end)
   (error line-start (file-name) ":" line " [" (or "E" "F") "] " (message) line-end))
  :modes haml-mode
  :next-checkers ((warning . haml-lint)))

;;;###autoload
(defun flycheck-haml-lint-setup ()
  "Setup Flycheck HAML.

Add `haml-lint' to `flycheck-checkers'."
  (interactive)
  (add-to-list 'flycheck-checkers 'haml-lint))

(provide 'flycheck-haml-lint)
;;; flycheck-haml-lint.el ends here
