;; -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/.emacs.d/local/")

;; emacs builtins
(require 'compile)
(require 'dired-x)

(put 'downcase-region 'disabled nil)
(add-hook 'emacs-startup-hook #'global-auto-revert-mode)

(setq
 undo-limit (* 13 160000)
 undo-strong-limit (* 13 240000)
 undo-outer-limit (* 13 24000000)
 truncate-string-ellipsis "…"
 eval-expression-print-length nil
 eval-expression-print-level nil
 x-underline-at-descent-line t
 create-lockfiles nil
 make-backup-files t
 backup-directory-alist
 `(("." . ,(expand-file-name "backup" user-emacs-directory)))
 tramp-backup-directory-alist backup-directory-alist
 backup-by-copying-when-linked t
 backup-by-copying t
 delete-old-versions t
 version-control t
 kept-new-versions 5
 kept-old-versions 5
 auto-save-include-big-deletions t

 auto-save-list-file-prefix
       (expand-file-name "autosave/" user-emacs-directory)
 tramp-auto-save-directory
       (expand-file-name "tramp-autosave/" user-emacs-directory)

 auto-save-no-message t
 auto-save-default t
 auto-save-interval 300
 auto-save-timeout 30

 vc-git-print-log-follow t
 vc-make-backup-files nil
 vc-git-diff-switches '("--histogram")

 kept-old-versions 10
 kept-new-versions 10

 kill-buffer-delete-auto-save-files t
 kill-do-not-save-duplicates t

 revert-without-query (list ".")
 auto-revert-stop-on-user-input nil
 auto-revert-verbose t

 global-auto-revert-non-file-buffers t
 global-auto-revert-ignore-modes '(Buffer-menu-mode)

 auto-revert-interval 3
 auto-revert-remote-files nil
 auto-revert-use-notify t
 auto-revert-avoid-polling nil
 auto-revert-verbose t

 save-place-file (expand-file-name "saveplace" user-emacs-directory)
 save-place-limit 600
 history-length 300
 savehist-save-minibuffer-history t
 savehist-additional-variables
       '(kill-ring                        ; clipboard
         register-alist                   ; macros
         mark-ring global-mark-ring       ; marks
         search-ring regexp-search-ring) ; searches

 window-resize-pixelwise nil

 window-divider-default-bottom-width 1
       window-divider-default-places t
       window-divider-default-right-width 1

 redisplay-skip-fontification-on-input t

 fast-but-imprecise-scrolling t

 auto-window-vscroll nil

 cursor-in-non-selected-windows nil
 highlight-nonselected-windows nil

 global-text-scale-adjust-resizes-frames nil

 comment-multi-line t
 comment-empty-lines t

 sentence-end-double-space nil
 lazy-highlight-initial-delay 0

 ;; recentf
 recentf-max-saved-items 300 ; default is 20
 recentf-max-menu-items 15
 recentf-auto-cleanup 'mode
 recentf-exclude nil

 ;; Spelling
 ispell-program-name "aspell"
 ispell-dictionary "en_US"
 ispell-extra-args
 '("--add-extra-dicts=pt_BR")
 flyspell-issue-message-flag nil
 flyspell-issue-welcome-flag nil

 ;; Smooth scrolling
 scroll-conservatively 20
 hscroll-margin 10
 scroll-margin 30
 next-screen-context-lines 0

 ;; flymake
 flymake-no-changes-timeout 0.5
 flymake-start-on-save-buffer t
 flymake-start-on-flymake-mode t
 flymake-show-diagnostics-at-end-of-line nil
 flymake-wrap-around nil

 ;; isearch
 isearch-wrap-pause 'no
 search-whitespace-regexp ".*?"
 isearch-lazy-count t
 lazy-count-prefix-format "%s/%s "
 lazy-count-suffix-format nil

 vc-follow-symlinks t

 find-file-visit-truename t

 ffap-machine-p-known 'reject

 ;; which-key
 which-key-separator "  "
 which-key-prefix-prefix "... "
 which-key-idle-delay 1.0
 which-key-idle-secondary-delay 0.25
 which-key-add-column-padding 1
 which-key-max-description-length 40
 which-func-update-delay 1.0

 ;; compile-mode
 compilation-scroll-output t
 compilation-always-kill t
 ansi-color-for-compilation-mode t

 save-interprogram-paste-before-kill t
 auto-revert-remote-files nil
 auto-revert-use-notify t
 global-auto-revert-non-file-buffers t

 ;; show-paren-mode
 show-paren-delay 0.1
 show-paren-highlight-openparen t
 show-paren-when-point-inside-paren t
 show-paren-when-point-in-periphery t

 ;; completions
 completion-ignore-case t
 completions-detailed t

 delete-by-moving-to-trash nil
 kill-do-not-save-duplicates t

 redisplay-skip-fontification-on-input t
 register-use-preview t

 truncate-lines t

 set-mark-command-repeat-pop t ;; repeat C-u C-SPAC C-SPC...

 display-line-numbers-type 'relative

 fill-column 100

 whitespace-line-column nil

 set-mark-command-repeat-pop t

 ;; tramp
 tramp-auto-save-directory "/tmp"
 tramp-verbose 1
 tramp-completion-reread-directory-timeout 50

 ;; tabs
 tab-always-indent 'complete
 tab-width 4
 indent-tabs-mode nil

 ;; grep
 grep-command "grep -rn "
 grep-find-ignored-directories
 '(".git" "build")

 ;; dired
 dired-omit-files
 (concat dired-omit-files "\\|^\\..+$")
 dired-dwim-target t
 dired-listing-switches "-alh"
 dired-mouse-drag-files t
 dired-free-space nil
 dired-dwim-target t  ; Propose a target for intelligent moving/copying
 dired-deletion-confirmer 'y-or-n-p
 dired-filter-verbose nil
 dired-recursive-deletes 'top
 dired-recursive-copies 'always
 dired-vc-rename-file t
 dired-create-destination-dirs 'ask
 dired-kill-when-opening-new-dired-buffer t
 dired-listing-switches "--group-directories-first -ahlv"
 dired-clean-confirm-killing-deleted-buffers nil
 dired-auto-revert-buffer 'dired-buffer-stale-p
 dired-omit-files
 (concat "\\|^__pycache__\\'"
         "\\|^\\.project\\(?:ile\\)?\\'"
         "\\|^flycheck_.*"
         "\\|^flymake_.*")
 ls-lisp-verbosity nil
 ls-lisp-dirs-first t
 dired-guess-shell-alist-user
 '(("\\.\\(png\\|jpe?g\\|tiff\\)" "xdg-open")
   ("\\.\\(mp[34]\\|m4a\\|ogg\\|flac\\|webm\\|mkv\\)" "mpv")
   (".*" "xdg-open"))

 ibuffer-human-readable-size t
 use-short-answers t
 read-answer-short t)

;; === Emacs modes ===

(blink-cursor-mode 0)
(delete-selection-mode 1)
(electric-pair-mode 1)
(recentf-mode 1)
(repeat-mode 1)
(save-place-mode 1)
(savehist-mode 1)
(show-paren-mode 1)
(which-key-mode 1)
(winner-mode 1)
(global-display-fill-column-indicator-mode)
(global-display-line-numbers-mode)
(global-auto-revert-mode 1)

;; https://stackoverflow.com/questions/23207938/in-emacs-how-to-enable-automatic-hiding-of-dired-details
(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(add-to-list 'compilation-error-regexp-alist
             '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
               1 2
	       (4)
	       (5)))

(defun aoc/turn-on-eldoc-mode () (interactive) (eldoc-mode 1))
(add-hook 'elisp-mode-hook 'aoc/turn-on-eldoc-mode)

;; Delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; === Custom Functions ===

(defun my/scroll-down ()
  (interactive)
  (next-line 20))

(defun my/scroll-up ()
  (interactive)
  (previous-line 20))

(defun kill-all-other-buffers ()
  "Kill all buffers except the current one."
  (interactive)
  (mapc #'kill-buffer (delq (current-buffer) (buffer-list))))

(defun surround-with-next-char (beg end)
  "Surround the region from BEG to END with the next input character on both sides."
  (interactive "r")
  (let ((char (read-char "Enter surround char: ")))
    (goto-char beg)
    (insert char)
    (goto-char (1+ end))
    (insert char)
    (goto-char (+ beg 1))))

(defun aoc/open-eshell-here ()
  "Open Eshell in the current buffer's directory."
  (interactive)
  (let ((default-directory
	 (or
	  (and
	   (buffer-file-name)
           (file-name-directory (buffer-file-name)))
          default-directory)))
    (eshell t)))

(defun aoc/increment-numbers-region (start end)
  (interactive "r")
  (let ((n 0))
    (save-excursion
      (goto-char start)
      (beginning-of-line)
      (while (< (point) end)
        (when (re-search-forward "\\[[0-9]+\\]" (line-end-position) t)
          (replace-match (format "[%d]" n))
          (setq n (1+ n)))
        (forward-line 1)))))

(defun backward-mark-word (arg)
  (interactive "p")
  (unless (eq last-command this-command) (set-mark (point)))
  (backward-word arg)
  (setq deactivate-mark nil))

(defun toggle-max-window ()
  "Maximize window"
  (interactive)
  (if (> (count-windows) 1)
      (progn
	(window-configuration-to-register :max)
        (delete-other-windows))
    (jump-to-register :max)))

;; http://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs
(defun aoc/put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename
	 (if (equal major-mode 'dired-mode)
	     default-directory
	   (buffer-file-name))))
    (when filename (kill-new filename) (message filename))))

(defun aoc/put-buffer-name-on-clipboard ()
  "Put the current buffer name on the clipboard"
  (interactive)
  (kill-new (buffer-name))
  (message (buffer-name)))

(defun aoc/kill-buffers-matching (pattern)
  "Kill all buffers whose names match the given regexp PATTERN."
  (interactive "sBuffers to kill (regexp): ")
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (and name (string-match-p pattern name))
        (kill-buffer buffer)
        (message "Killed buffer %s" name))))
  (message "Killed buffers matching %s" pattern))

;; http://ergoemacs.org/emacs/emacs_unfill-paragraph.html
(defun aoc/unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000)) (fill-paragraph nil)))

(defun aoc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
	(line
	 (let ((s (thing-at-point 'line t)))
           (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(defun aoc/insert-timestamp ()
  (interactive)
  (insert (format-time-string "%Y%m%d-%H%M%S" nil t)))

(defun aoc/rgrep-selected (beg end)
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-min))))
  (rgrep (buffer-substring-no-properties beg end) "*" (pwd)))

;; === Packages ===

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
	     t)

;; Tsoding's rc/require (https://github.com/rexim/dotfiles/)
(defvar rc/package-contents-refreshed nil)
;; Packages not in this list will be removed automatically
(defvar rc/required-packages nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  (dolist (package packages)
    (add-to-list 'rc/required-packages package)
    (rc/require-one-package package)))

;; === FIDO ===

(fido-mode 1)
(fido-vertical-mode 1)

;; === Visual Replace ===

(rc/require 'visual-replace)
(global-set-key (kbd "C-c r") #'visual-replace-from-isearch)

;; === Eglot ===

(require 'eglot)
(setq eglot-autoshutdown t
      eglot-send-changes-idle-time 0.5
      eglot-sync-connect 0
      eglot-sync-connect nil
      eglot-events-buffer-size 0
      jsonrpc-default-request-timeout 5
      eglot-report-progress nil
      jsonrpc-event-hook nil
      eglot-events-buffer-config '(:size 0 :format short))

(add-hook 'simpc-mode-hook #'eglot-ensure)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
	       '(simpc-mode . ("clangd"))))

(setq eglot-ignored-server-capabilities
      '(;; :hoverProvider
	    ;; :completionProvider
	    ;; :signatureHelpProvider
	    ;; :definitionProvider
	    ;; :typeDefinitionProvider
	    ;; :implementationProvider
	    ;; :declarationProvider
	    ;; :referencesProvider
	    ;; :workspaceSymbolProvider
        ;; :documentSymbolProvider
        :documentHighlightProvider
        :codeActionProvider
        :codeLensProvider
        :documentFormattingProvider
        :documentRangeFormattingProvider
        :documentOnTypeFormattingProvider
        :renameProvider
        :documentLinkProvider
        :colorProvider
        :foldingRangeProvider
        :executeCommandProvider
        :inlayHintProvider))

;; === GNU Global ===

(rc/require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'simpc-mode 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;; === Buffer Terminator ===

;; Every 5 minutes kill inactives buffers
;; Buffers get inactive after 10 minutes

(rc/require 'buffer-terminator)
(setq buffer-terminator-verbose nil)
(setq buffer-terminator-inactivity-timeout (* 10 60))
(setq buffer-terminator-interval (* 5 60))
(setq buffer-terminator-mode 1)

;; === Expand ===

(rc/require 'expand-region)

;; === Programming Major Modes ===

;; c-mode

(setq-default c-basic-offset 4
              c-default-style
	      '((java-mode . "java")
                (awk-mode . "awk")
                (other . "bsd")))

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
(add-to-list 'auto-mode-alist '("\\.[b]\\'" . simpc-mode))
(add-hook 'simpc-mode-hook
          (lambda ()
            (interactive)
            (setq-local fill-paragraph-function 'astyle-buffer)))

;; markdown

(rc/require 'markdown-mode)
(add-hook 'markdown-mode-hook #'flyspell-mode)

(defun aoc/enable-word-wrap () (interactive) (toggle-word-wrap 1))
(add-hook 'markdown-mode-hook 'aoc/enable-word-wrap)

;; === Formatter ===

(rc/require 'reformatter)

(reformatter-define c-format :program "clang-format" :group 'c)

(add-hook 'simpc-mode-hook
          (lambda () (c-format-on-save-mode)))

(add-hook 'c-mode-hook
          (lambda () (c-format-on-save-mode)))

;; === Timemachine ===

;; Awesome to navigate back in the history of a file, specially when you deleted something in the
;; past that is helful in the present.
;;
;; This package is so useful, that even in my neovim I use GitTimeLapse
(rc/require 'git-timemachine)

;; === Magit ===

(cond ((eq system-type 'windows-nt) (rc/require 'cl-lib)))

(rc/require 'magit)
(setq magit-auto-revert-mode nil)

;; === Multiple Cursors ===

(rc/require 'multiple-cursors)

;; === Yasnippet ===

(rc/require 'yasnippet)
(setq yas/triggers-in-field nil
 yas-snippet-dirs '("~/.emacs.d/snippets/"))
(yas-global-mode 1)

;; === Move Text ===

(rc/require 'move-text)

;; === Completion ===

(rc/require 'corfu 'cape)

(global-corfu-mode)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-history)

(setq corfu-auto t
      corfu-auto-delay 0.2
      corfu-auto-prefix 2)

;; === Orderless ===

(rc/require 'orderless)
(setq
 orderless-matching-styles '(orderless-literal orderless-flex)
 orderless-component-separator "[ &]"
 completion-category-defaults nil
 icomplete-compute-delay 0.01
 completion-pcm-leading-wildcard t)

(setq completion-styles '(orderless)
      completion-category-defaults nil
      completion-category-overrides
      '((command (styles orderless))))

;; === Zoxide ===

(rc/require 'zoxide)
(setq zoxide-use-cache t)
(setq zoxide-completion-function #'completing-read)

;; === Undo Fu ===

;; Vim-like undo
(rc/require 'undo-fu)

;; === Rainbow ===

;; Allows to see the colors from a hex #FFFFFF
(rc/require 'rainbow-mode)
(add-hook 'css-mode-hook #'rainbow-mode)
(add-hook 'markdown-mode-hook #'rainbow-mode)
(add-hook 'emacs-lisp-mode-hook #'rainbow-mode)

;; better than viper-mode
(rc/require 'meow)

;; === Keybindings ===

(global-set-key (kbd "C-c M-q") 'aoc/unfill-paragraph)
(global-set-key (kbd "C-,") 'aoc/duplicate-line)
(global-set-key (kbd "C-x p d") 'aoc/insert-timestamp)
(global-set-key (kbd "C-x p s") 'aoc/rgrep-selected)

;; Window Flow
(windmove-default-keybindings)
(global-set-key (kbd "H-m") 'toggle-max-window)
(global-set-key (kbd "H-h") 'windmove-left)
(global-set-key (kbd "H-l") 'windmove-right)
(global-set-key (kbd "H-j") 'windmove-down)
(global-set-key (kbd "H-k") 'windmove-up)
(global-set-key (kbd "H-q a") 'delete-other-windows)
(global-set-key (kbd "H-q m") 'delete-window)
(global-set-key (kbd "H-]") 'split-window-right)
(global-set-key (kbd "H-\\") 'split-window-below)

(global-set-key (kbd "C-x C-g") 'find-file-at-point)
(global-set-key (kbd "C-c i m") 'imenu)
(global-set-key (kbd "H-f") 'find-file-at-point)

(global-set-key (kbd "C-v") 'my/scroll-down)
(global-set-key (kbd "M-v") 'my/scroll-up)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-\"") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:") 'mc/skip-to-previous-like-this)

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(global-set-key (kbd "H-z f") #'zoxide-find-file)
(global-set-key (kbd "H-z c") #'aoc/zoxide-cd)

(global-set-key (kbd "C-c M-q") 'aoc/unfill-paragraph)

(global-set-key (kbd "S-M-<backspace>") 'backward-mark-word)

(global-set-key (kbd "C-x C-1") #'delete-other-windows)
(global-set-key (kbd "C-x C-2") #'split-window-below)
(global-set-key (kbd "C-x C-3") #'split-window-right)
(global-set-key (kbd "C-x C-0") #'delete-window)

(define-key dired-mode-map (kbd "b") #'dired-up-directory)

(keymap-global-unset "C-x f") ;; unmaps set-fill-column
(keymap-global-unset "C-x C-d") ;; unmaps list-directory

(global-set-key (kbd "H-t n") #'tab-next)
(global-set-key (kbd "H-t c") #'tab-close)
(global-set-key (kbd "H-t t") #'tab-new)

(global-set-key (kbd "C-c s") #'surround-with-next-char)

(global-set-key (kbd "C-M-k") #'kill-whole-line)

(define-key dired-mode-map (kbd "r") #'wdired-change-to-wdired-mode)

(global-set-key (kbd "C-.") #'imenu-anywhere)
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Multiple Cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-\"") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:") 'mc/skip-to-previous-like-this)

(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'undo-fu-only-undo)
(global-set-key (kbd "C-S-/") 'undo-fu-only-redo)

(global-set-key (kbd "C-x C-1") #'delete-other-windows)
(global-set-key (kbd "C-x C-2") #'split-window-below)
(global-set-key (kbd "C-x C-3") #'split-window-right)
(global-set-key (kbd "C-x C-0") #'delete-window)

;; repeat
(global-set-key (kbd "C-.") 'repeat)

;; Windows

(global-set-key (kbd "M-H") 'windmove-left)
(global-set-key (kbd "M-L") 'windmove-right)
(global-set-key (kbd "M-K") 'windmove-up)
(global-set-key (kbd "M-J") 'windmove-down)

(require 'meow)
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("C-u" . my/scroll-up)
   '("C-d" . my/scroll-down)
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))
(meow-setup)
(meow-global-mode 1)

;; Removes all non-required packages
(setq package-selected-packages rc/required-packages)
(package-autoremove)

(when (eq system-type 'androd)
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0)
  (column-number-mode 1))

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load-file custom-file))
;; EOF
