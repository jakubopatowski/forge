;;; package --- Summary:
;;; Commentary:
;; How to setup packages:
;;https://melpa.org/#/

;;; Code:
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;(org-babel-load-file (expand-file-name "~/projekty/forge/myinit.org"))

(let ((gc-cons-threshold most-positive-fixnum))
  (org-babel-load-file (expand-file-name "~/test.org"))
  )

;;=========================================================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages
   '(edit-indirect treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil yasnippet-snippets py-autopep8 virtualenvwrapper clang-format qt-pro-mode expand-region smartparens doom-modeline dictionary hungry-delete sudo-edit beacon which-key dashboard page-break-lines ccls company-lsp lsp-treemacs spinner lsp-ui rainbow-mode lsp-mode sql-indent srefactor spaceline-all-the-icons spaceline flycheck-rtags company-irony-c-headers company-rtags move-text neotree immaterial-theme multi-term cmake-mode levenshtein rtags cmake-ide company-irony flycheck-irony irony flycheck borg color-theme-sanityinc-solarized use-package try solaire-mode org-bullets doom-themes counsel auto-complete ace-window))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Code PL" :foundry "outline" :slant normal :weight light :height 113 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

;;; .emacs ends here
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
