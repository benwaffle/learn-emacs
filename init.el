(setq inhibit-startup-message t)

(scroll-bar-mode 1)
(tooltip-mode -1)
(tool-bar-mode 1) ;; -1 = disable, 1 = enable ?
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq visible-bell t)

(set-face-attribute 'default nil :font "Operator Mono Book" :height 140)

(load-theme 'wombat)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq use-package-always-ensure t)

;; logs all key presses and functions
(use-package command-log-mode)

;; completion, like helm or ivy
(use-package vertico
  :init
  (vertico-mode))

;; allows for matching multiple strings in vertico (e.g. search for M-x "mod ver log")
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 30)))
