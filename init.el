;; TODO
;; (desktop-save) ;; sessions
;; (eww) ;; browser

;; Some useful configs from: https://github.com/jamescherti/minimal-emacs.d
;; BEGIN: minimal-emacs.d
(setq native-comp-async-query-on-exit t)

(setq read-answer-short t)
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))

(setq undo-limit (* 13 160000)
      undo-strong-limit (* 13 240000)
      undo-outer-limit (* 13 24000000))

(setq truncate-string-ellipsis "…")

(setq eval-expression-print-length nil
      eval-expression-print-level nil)

(setq x-underline-at-descent-line t)

;; (setq remote-file-name-inhibit-cache 50)
;;
;; (setq imenu-auto-rescan t)
;; (setq imenu-max-item-length 160)
;; (setq next-line-add-newlines nil)
;; (setq bookmark-save-flag 1)
;;
;; (setq uniquify-buffer-name-style 'forward)

(setq create-lockfiles nil)
(setq make-backup-files t)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "backup" user-emacs-directory))))
(setq tramp-backup-directory-alist backup-directory-alist)
(setq backup-by-copying-when-linked t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)
(setq kept-new-versions 5)
(setq kept-old-versions 5)

(setq auto-save-include-big-deletions t)

(setq auto-save-list-file-prefix
      (expand-file-name "autosave/" user-emacs-directory))
(setq tramp-auto-save-directory
      (expand-file-name "tramp-autosave/" user-emacs-directory))

(setq auto-save-no-message t)
(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 30)

(setq vc-git-print-log-follow t)
(setq vc-make-backup-files nil)
(setq kept-old-versions 10)
(setq kept-new-versions 10)
(setq vc-git-diff-switches '("--histogram"))

(setq kill-buffer-delete-auto-save-files t)
(setq kill-do-not-save-duplicates t)

(setq revert-without-query (list ".")  ; Do not prompt
      auto-revert-stop-on-user-input nil
      auto-revert-verbose t)

(setq global-auto-revert-non-file-buffers t)
(setq global-auto-revert-ignore-modes '(Buffer-menu-mode))

(setq auto-revert-interval 3)
(setq auto-revert-remote-files nil)
(setq auto-revert-use-notify t)
(setq auto-revert-avoid-polling nil)
(setq auto-revert-verbose t)
(add-hook 'emacs-startup-hook #'global-auto-revert-mode)

(setq save-place-file (expand-file-name "saveplace" user-emacs-directory))
(setq save-place-limit 600)
(setq savehist-additional-variables
  '(kill-ring                        ; clipboard
    register-alist                   ; macros
    mark-ring global-mark-ring       ; marks
    search-ring regexp-search-ring))

(setq history-length 300)
(setq savehist-save-minibuffer-history t)  ;; Default
(setq savehist-additional-variables
      '(kill-ring                        ; clipboard
        register-alist                   ; macros
        mark-ring global-mark-ring       ; marks
        search-ring regexp-search-ring)) ; searches

(setq window-resize-pixelwise nil)

(setq window-divider-default-bottom-width 1
      window-divider-default-places t
      window-divider-default-right-width 1)

(setq redisplay-skip-fontification-on-input t)

(setq fast-but-imprecise-scrolling t)

(setq auto-window-vscroll nil)

(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

(setq global-text-scale-adjust-resizes-frames nil)

(setq comment-multi-line t)
(setq comment-empty-lines t)


(setq sentence-end-double-space nil)
(setq lazy-highlight-initial-delay 0)
;; END: minimal-emacs.d

(which-key-mode 1)
(setq which-key-separator "  ")
(setq which-key-prefix-prefix "... ")
(setq which-key-idle-delay 1.0)
(setq which-key-idle-secondary-delay 0.25)
(setq which-key-add-column-padding 1)
(setq which-key-max-description-length 40)
(setq which-func-update-delay 1.0)

(delete-selection-mode 1)
(add-to-list 'load-path "~/.emacs.d/local/")

(keymap-unset minibuffer-local-completion-map "SPC")
(setq vc-follow-symlinks t)
(setq find-file-visit-truename t)

'(set-mark-command-repeat-pop t)

;; Isearch wraps the buffer
(setq isearch-wrap-pause 'no)
(setq search-whitespace-regexp ".*?")

(setq x-alt-keysym 'meta)
(setq confirm-kill-emacs 'y-or-n-p)

(setq display-line-numbers-type 'relative)
(setq-default fill-column 100)
(setq whitespace-line-column nil)
(global-display-fill-column-indicator-mode)
(global-display-line-numbers-mode)

(setq custom-buffer-done-kill t)

;; Smooth scrolling
(setq scroll-conservatively 20)
(setq hscroll-margin 10)
(setq scroll-margin 30)
(setq next-screen-context-lines 0)

;; Syntax highlighting
(setq flymake-no-changes-timeout 0.5
      flymake-start-on-save-buffer t
      flymake-start-on-flymake-mode t)

(setq flymake-show-diagnostics-at-end-of-line nil)
(setq flymake-wrap-around nil)

;; Spelling
(setq ispell-program-name "aspell"
      ispell-dictionary "en_US"
      ispell-extra-args '("--add-extra-dicts=pt_BR"))
(add-hook 'markdown-mode-hook #'flyspell-mode)
(setq flyspell-issue-message-flag nil)
(setq flyspell-issue-welcome-flag nil)

(setq recentf-max-saved-items 300) ; default is 20
(setq recentf-max-menu-items 15)
(setq recentf-auto-cleanup 'mode)
(setq recentf-exclude nil)
(recentf-mode 1)

;; === Appearance ===

(require 'ansi-color)
(defun rc/colorize-compilation-buffer ()
  "Colorize the compilation buffer using ansi-color"
  (read-only-mode 'toggle)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (read-only-mode 'toggle))
(add-hook 'compilation-filter-hook 'rc/colorize-compilation-buffer)

;; === Custom Functions ===

(defun kill-all-other-buffers ()
  "Kill all buffers except the current one."
  (interactive)
  (mapc #'kill-buffer
        (delq (current-buffer) (buffer-list))))

(defun surround-with-next-char (beg end)
  "Surround the region from BEG to END with the next input character on both sides."
  (interactive "r")
  (let ((char (read-char "Enter surround char: ")))
    (goto-char beg)
    (insert char)
    (goto-char (1+ end))
    (insert char)
    (goto-char (+ beg 1))))

(defun my/open-eshell-here ()
  "Open Eshell in the current buffer's directory."
  (interactive)
  (let ((default-directory (or (and (buffer-file-name)
                                    (file-name-directory (buffer-file-name)))
                               default-directory)))
    (eshell t)))

(defun backward-mark-word (arg)
   "Similar to M-d, but backwards"
   (interactive "p")
   (unless (eq last-command this-command)
    (set-mark (point)))
   (backward-word arg)
   (setq deactivate-mark nil))

(winner-mode 1)
(defun toggle-max-window ()
  "Maximize window"
  (interactive)
  (if (> (count-windows) 1)
      (progn (window-configuration-to-register :max)
             (delete-other-windows))
    (jump-to-register :max)))

(require 'compile)
compilation-error-regexp-alist-alist
(add-to-list 'compilation-error-regexp-alist
             '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
               1 2 (4) (5)))

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-use-notify t)

;; Word wrapping for markdown
(defun rc/enable-word-wrap ()
  (interactive)
  (toggle-word-wrap 1))
(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)

;; http://stackoverflow.com/questions/13794433/how-to-disable-autosave-for-tramp-buffers-in-emacs
(setq tramp-auto-save-directory "/tmp")
(setq tramp-verbose 1)
(setq tramp-completion-reread-directory-timeout 50)

(defun rc/turn-on-eldoc-mode ()
  (interactive)
  (eldoc-mode 1))
(add-hook 'elisp-mode-hook 'rc/turn-on-eldoc-mode)

;; Delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; http://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs
(defun rc/put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
      default-directory
    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message filename))))

(defun rc/put-buffer-name-on-clipboard ()
  "Put the current buffer name on the clipboard"
  (interactive)
  (kill-new (buffer-name))
  (message (buffer-name)))

(defun rc/kill-buffers-matching (pattern)
  "Kill all buffers whose names match the given regexp PATTERN."
  (interactive "sBuffers to kill (regexp): ")
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (and name (string-match-p pattern name))
        (kill-buffer buffer)
        (message "Killed buffer %s" name))))
  (message "Killed buffers matching %s" pattern))

;; http://ergoemacs.org/emacs/emacs_unfill-paragraph.html
(defun rc/unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000))
    (fill-paragraph nil)))

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(defun rc/insert-timestamp ()
  (interactive)
  (insert (format-time-string "%Y%m%d-%H%M%S" nil t)))

(defun rc/rgrep-selected (beg end)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (point-min) (point-min))))
  (rgrep (buffer-substring-no-properties beg end) "*" (pwd)))

;; === Packages ===

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

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

(rc/require 'dash)

;; === IDO ===

(rc/require 'smex 'ido-completing-read+)
(require 'ido-completing-read+)

(setq ido-enable-flex-matching t)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;; === Visual Replace ===

(rc/require 'visual-replace)
(global-set-key (kbd "C-c r") #'visual-replace-from-isearch)

;; === Evil ===

(setq evil-want-C-u-scroll t)

(rc/require 'evil 'evil-leader)

(global-evil-leader-mode 1)
(evil-mode 1)

;; === GNU Global ===

(rc/require 'ggtags)

;; === Buffer Terminator ===

(rc/require 'buffer-terminator)
(setq buffer-terminator-verbose nil)
(setq buffer-terminator-inactivity-timeout (* 15 60))
(setq buffer-terminator-interval (* 10 60))
(setq buffer-terminator-mode 1)

;; === Ido Vertical Mode ===

(rc/require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; === Imenu ===

(rc/require 'imenu-anywhere 'imenu-list)

;; === Expand ===

(rc/require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; === Programming Major Modes ===

;; c-mode
(setq-default c-basic-offset 8
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;; (require 'simpc-mode)
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
;; (add-to-list 'auto-mode-alist '("\\.[b]\\'" . simpc-mode))
;; (add-hook 'simpc-mode-hook
;;           (lambda ()
;;             (interactive)
;;             (setq-local fill-paragraph-function 'astyle-buffer)))

(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . csharp-mode))
(add-to-list 'auto-mode-alist '("\\.[b]\\'" . csharp-mode))

(rc/require 'markdown-mode)

;; === Formatter ===

(rc/require 'reformatter)

(reformatter-define csharp-format
  :program "clang-format"
  :group 'c)

(add-hook 'csharp-mode-hook
          (lambda ()
            (csharp-format-on-save-mode)))

;; === Timemachine ===

(rc/require 'git-timemachine)

;; === Magit ===

(cond
  ((eq system-type 'windows-nt) (rc/require 'cl-lib)))

(rc/require 'magit)
;;(rc/require 'forge)

(setq magit-auto-revert-mode nil)

(rc/require 'magit-todos)
(magit-todos-mode 1)
(setq magit-todos-keywords
      '("TODO" "FIX" "BUG" "HACK" "NOTE"))

;; === Multiple Cursors ===

(rc/require 'multiple-cursors)

;; === Dired ===

(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)
;; https://stackoverflow.com/questions/23207938/in-emacs-how-to-enable-automatic-hiding-of-dired-details
(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

(setq dired-free-space nil
      dired-dwim-target t  ; Propose a target for intelligent moving/copying
      dired-deletion-confirmer 'y-or-n-p
      dired-filter-verbose nil
      dired-recursive-deletes 'top
      dired-recursive-copies 'always
      dired-vc-rename-file t
      dired-create-destination-dirs 'ask
      ;; Suppress Dired buffer kill prompt for deleted dirs
      dired-clean-confirm-killing-deleted-buffers nil)

(setq auto-revert-remote-files nil)
(setq dired-auto-revert-buffer 'dired-buffer-stale-p)

(setq dired-omit-files (concat "\\|^__pycache__\\'"
                               "\\|^\\.project\\(?:ile\\)?\\'"
                               "\\|^flycheck_.*"
                               "\\|^flymake_.*"))
(with-eval-after-load 'dired
  (let ((args "--group-directories-first -ahlv"))
    (when args
      (setq dired-listing-switches args))))

(setq ls-lisp-verbosity nil)
(setq ls-lisp-dirs-first t)

;; === Yasnippet ===

(rc/require 'yasnippet)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
(yas-global-mode 1)

;; === Move Text ===

(rc/require 'move-text)

;; === Projectile ===

(rc/require 'rg)
(rc/require 'projectile)

;; === Company ===

(rc/require 'company)

(setq company-idle-delay 0.1
      company-minimum-prefix-length 1
      company-selection-wrap-around t
      company-tooltip-align-annotations t
      company-auto-complete nil
      company-tooltip-margin 1)

(global-company-mode)

;; === Orderless ===

(rc/require 'orderless)
(setq orderless-matching-styles '(orderless-literal orderless-flex))
(setq orderless-component-separator "[ &]")

;; Completion

(setq icomplete-compute-delay 0.01)

(setq completion-styles '(basic orderless)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(setq completion-at-point-functions
      '(elisp-completion-at-point))

;; === Zoxide ===

(rc/require 'zoxide)
(setq zoxide-use-cache t)
(setq zoxide-completion-function #'completing-read)

(defun my/zoxide-find-file ()
  "Jump to a zoxide directory and open dired."
  (interactive)
  (dired (zoxide-find-file)))

(defun my/zoxide-cd ()
  "Jump to a zoxide directory."
  (interactive)
  (cd (zoxide-find-file)))

;; === Undo Fu ===

(rc/require 'undo-fu)

;; === Rainbow ===

;; Allows to see the colors from a hex #FFFFFF
(rc/require 'rainbow-mode)
(add-hook 'css-mode-hook #'rainbow-mode)
(add-hook 'markdown-mode-hook #'rainbow-mode)
(add-hook 'emacs-lisp-mode-hook #'rainbow-mode)

;; === Avy ===

;; Jump to anything in the buffer
(rc/require 'avy)

;; === Keybindings ===

(global-set-key (kbd "C-c M-q") 'rc/unfill-paragraph)
(global-set-key (kbd "C-,") 'rc/duplicate-line)
(global-set-key (kbd "C-x p d") 'rc/insert-timestamp)
(global-set-key (kbd "C-x p s") 'rc/rgrep-selected)

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

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(global-set-key (kbd "H-z f") #'zoxide-find-file)
(global-set-key (kbd "H-z c") #'my/zoxide-cd)

(global-set-key (kbd "C-c M-q") 'rc/unfill-paragraph)

(global-set-key (kbd "C-:") 'avy-goto-word-0)

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

;; Removes all non-required packages
(setq package-selected-packages rc/required-packages)
(package-autoremove)

(global-set-key (kbd "C-.") #'imenu-anywhere)
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)

;; Multiple Cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/")   'undo-fu-only-undo)
(global-set-key (kbd "C-S-/") 'undo-fu-only-redo)

;; Evil Mode

;; I tried Doom Emacs... sucks
;; I tried Emacs Vanilla... sucks
;; So now: Emacs + Vim for the ultimate text editing experience
(defalias 'evil-insert-state 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)
(setq evil-emacs-state-cursor '(bar . 1))

;; Restore some Emacs bindings in Evil
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)

(define-key evil-normal-state-map (kbd "gcc") 'comment-line)
(define-key evil-visual-state-map (kbd "gc") 'comment-line)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "g" 'magit
  "ca" 'yas-new-snippet
  "cf" 'format-all-buffer
  "ff" 'find-file
  "fc" 'find-file
  "fg" 'projectile-find-file
  "d" 'dired-jump
  "c" 'compile
  "e" 'my/open-eshell-here
  "C" 'recompile
  "," 'switch-to-buffer
  "k" 'kill-buffer)

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load-file custom-file))
;; EOF
