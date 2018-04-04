
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq vc-handled-backends nil)
;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
;; (require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
(normal-erase-is-backspace-mode 0)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))))
 '(vertical-border ((t nil))))

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------

(iswitchb-mode 1)
;;iswitchb ignore
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "*Messages*")
(add-to-list 'iswitchb-buffer-ignore "*ECB")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
					;(add-to-list 'iswitchb-buffer-ignore "*scratch")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "*ftp ")
(add-to-list 'iswitchb-buffer-ignore "*bsh")
(add-to-list 'iswitchb-buffer-ignore "*jde-log")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")


(add-hook 'lisp-mode-hook '(lambda ()
			     (local-set-key (kbd "RET") 'newline-and-indent)))
;;WEB MODE!

;; (require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\.inc\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )


(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(show-paren-mode t)
(setq show-paren-style 'expression)

;;uniquefy to show paths in reverse
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;;install melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
;;fix m-up m-down for org mode
(add-hook 'term-setup-hook
	  '(lambda ()
	     (define-key function-key-map "\e[1;9A" [M-up])
	     (define-key function-key-map "\e[1;9B" [M-down])
	     (define-key function-key-map "\e[1;9C" [M-right])
	     (define-key function-key-map "\e[1;9D" [M-left])))
;;;fix shift + tab
(add-hook 'term-setup-hook
	  (lambda () (define-key input-decode-map "\e[Z" [backtab])))

;;Hotkeys for org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;fix emacs problem with node REPL
(setenv "NODE_NO_READLINE" "1")

;;require doremi
(require 'doremi)
(require 'doremi-cmd)

;; line numbers on by default
;; (global-linum-mode 1)


;;phpmode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;mustache mode
;;(add-to-list 'load-path "~/.emacs.d/mustache-mode.el")
;;(require 'mustache-mode)
(add-to-list 'load-path "~/.emacs.d/haml-mode.el")
(require 'haml-mode)

(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

;;yasnippet from truongtx.me
;;; should be loaded before auto complete so that they can work together
;; (require 'yasnippet)
;; (yas-global-mode 1)
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.12.2")
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/elpa/yasnippet-0.12.2/snippets" "~/Dropbox/Applications/Customise/emacs/myyassnipets"))
(yas-global-mode 1)

;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
;; (ac-set-trigger-key "TAB")
;; (ac-set-trigger-key "<tab>")


;; Typescript

;; If use bundled typescript.el,
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)


;;js2-mode
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)


;;paraedit keep parens balanced
(defun my-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))
(add-hook 'js-mode-hook 'my-paredit-nonlisp) ;use with the above function


;;flycheck
(require 'flycheck)
(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))

(global-set-key (kbd "C-?") 'help-command)

;;dirtree
(autoload 'dirtree "dirtree" "Add directory to tree view" t)


;;;sass indenting fix from stack overflow
(defconst sass-line-keywords
  '(("@\\(\\w+\\)"    0 font-lock-keyword-face sass-highlight-directive)
    ("/[/*].*"  0 font-lock-comment-face)
    ("[=+]\\w+" 0 font-lock-variable-name-face sass-highlight-script-after-match)
    ("!\\w+"    0 font-lock-variable-name-face sass-highlight-script-after-match)
    (":\\w+"    0 font-lock-variable-name-face)
    ("\\w+\s*:" 0 font-lock-variable-name-face)
    ("\\(\\w+\\)\s*="  1 font-lock-variable-name-face sass-highlight-script-after-match)
    ("\\(:\\w+\\)\s*=" 1 font-lock-variable-name-face sass-highlight-script-after-match)
    (".*"      sass-highlight-selector)))

(defconst sass-selector-font-lock-keywords
  '( ;; Attribute selectors (e.g. p[foo=bar])
    ("\\[\\([^]=]+\\)" (1 font-lock-variable-name-face)
     ("[~|$^*]?=\\([^]=]+\\)" nil nil (1 font-lock-string-face)))
    ("&"       0 font-lock-constant-face)
    ("\\.\\w+" 0 font-lock-type-face)
    ("#\\w+"   0 font-lock-keyword-face)
    ;; Pseudo-selectors, optionally with arguments (e.g. :first, :nth-child(12))
    ("\\(::?\\w+\\)" (1 font-lock-variable-name-face)
     ("(\\([^)]+\\))" nil nil (1 font-lock-string-face)))))
(defconst sass-non-block-openers
  '("^.*,$" ;; Continued selectors
    "^ *@\\(extend\\|debug\\|warn\\|include\\|import\\)" ;; Single-line mixins
    "^ *[$!]"     ;; Variables
    ".*[^\s-]+: [^\s-]" ;; a setting of some sort
    ))

;;change active color
;; (set-face-attribute  'mode-line
;; 		     nil 
;; 		     ;; :foreground "blue"
;; 		     :background "white" 
;; 		     :box '(:line-width 1 :style released-button))
;; (set-face-attribute  'mode-line-inactive
;; 		     nil 
;; 		     :foreground "white"
;; 		     :background "black" 
;; 		     :box '(:line-width 1 :style released-button))

;;handlebars mode
(require 'handlebars-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("45482e7ddf47ab1f30fe05f75e5f2d2118635f5797687e88571842ff6f18b4d5" default)))
 '(js2-basic-offset 2)
 '(package-selected-packages
   (quote
    (ag tss js2-refactor handlebars-mode flycheck angular-snippets))))

(setq-default indent-tabs-mode nil)

;; indent javascript mode by 2 spaces
(setq js-indent-level 2)

(put 'dired-find-alternate-file 'disabled nil)
(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


