;;; packages.el --- mylayer layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: lx <lx@Senior.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mylayer-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mylayer/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mylayer/pre-init-PACKAGE' and/or
;;   `mylayer/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mylayer-packages
  '(
    snmp-mode
    key-chord
    fzf
    evil-magit
    leetcode
    )
  "The list of Lisp packages required by the mylayer layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun mylayer/init-snmp-mode ()
  (use-package snmp-mode
    :defer t
    ))

(defun mylayer/init-key-chord()
  (use-package key-chord
    :defer t
    :init
    (setq key-chord-two-keys-delay 0.5)
    ))

(defun mylayer/init-fzf()
  (use-package fzf
    :defer t
    ))

(defun mylayer/init-evil-magit ()
  (use-package evil-magit
    :defer t
    :init (add-hook 'spacemacs-editing-style-hook
                    'spacemacs//magit-evil-magit-bindings)))

(defun mylayer/init-leetcode ()
  (use-package leetcode
    :defer t
    :init
    (setq leetcode-prefer-language "golang"
          leetcode-prefer-sql "mysql"
          leetcode-save-solutions t
          leetcode-directory "~/gospace/leetcode")
  ))

;;; packages.el ends here
