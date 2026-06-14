(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Optional: Refresh the package list automatically if it's empty
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'multiple-cursors)
  (package-refresh-contents)
  (package-install 'multiple-cursors))

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'multiple-cursors)
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C-z") 'mc/mark-next-like-this)
(global-set-key (kbd "S-<f2>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-<f2>") 'mc/mark-all-like-this)

; Source - https://stackoverflow.com/a/5533251
; Posted by user173973, modified by community. See post 'Timeline' for change history
; Retrieved 2026-05-13, License - CC BY-SA 3.0

(global-set-key (kbd "C-ş") 'text-scale-increase)
(global-set-key (kbd "C-.") 'text-scale-decrease)

(global-set-key (kbd "M-s") 'shell-command)

(global-display-line-numbers-mode)
(setq backup-directory-alist `(("." . "~/emacs/autosaves/")))
(setq auto-save-file-name-transforms '((".*" "~/emacs/autosaves/\\1" t)))

(load-theme 'gruber-darker t)
(menu-bar-mode -1)

;; Disable the tool bar (the row of icons at the top)
(tool-bar-mode -1)

;; Disable the scroll bar (the vertical bar on the side)
(scroll-bar-mode -1)

(set-face-attribute 'default nil :height 170)

(setq project-vc-extra-root-markers '("CMakeLists.txt" "Makefile" "package.json" ".root"))

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.0      ; How long to wait before popup (0 = instant)
        company-minimum-prefix-length 1)) ; Show list after typing 1 character

;(use-package lsp-mode
;  :ensure t
;  :init
;  :hook ((c-mode . lsp)
;         (c++-mode . lsp))
;  :custom
;  (lsp-enable-on-type-formatting nil)
;  (lsp-enable-indentation nil)
;  (lsp-before-save-formatting nil)
;  (electric-indent-mode -1)
;  :config
;  (setq-default c-basic-offset 8)
;  (setq-default c-default-style "bsd")
;  :commands lsp)

(setq project-vc-extra-root-markers '(".project"))
(setq project-find-functions '(project-try-vc))

(setenv "PATH" (concat "/home/cool/opt/cross/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/home/cool/opt/cross/bin")

(setq-default c-basic-offset 8)

(defun c-style ()
  (c-set-offset 'defun-open 0)
  (c-set-offset 'substatement-open 0)
  
  (setq c-backslash-column 80)
  (setq c-backslash-max-column 80))

(add-hook 'c-mode-common-hook 'c-style)

(setq-default fill-column 80)

(global-display-fill-column-indicator-mode)

(defun my-c-backslash-region-80 ()
  (interactive)
  (c-backslash-region (region-beginning) (region-end) 80 nil))

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c \\") 'my-c-backslash-region-80)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company dap-mode ement gruber-darker-theme lsp-mode magit multiple-cursors
	     smex svelte-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


