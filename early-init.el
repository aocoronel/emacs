;; Performance

;; Compile flags

;; ./configure CFLAGS="-march=native -Ofast -fno-finite-math-only -pipe \
;; -fgraphite-identity -floop-nest-optimize -fdevirtualize-at-ltrans -fipa-pta \
;; -fno-semantic-interposition" \
;; --without-compress-install --with-x-toolkit=lucid \
;; --with-xft --with-xaw3d --without-toolkit-scroll-bars --without-gsettings \
;; --with-native-compilation=aot --with-tree-sitter --with-x --with-sound=no \
;; --without-libsystemd --without-selinux  \
;; --prefix=/usr/local --with-imagemagick

;; Dependencies
;; libotf
;; libxaw
;; m17n-lib
;; libgccjit

(setq gc-cons-threshold 35000000
      gc-cons-percentage 0.6)
(setq read-process-output-max (* 1024 1024))
(setq process-adaptive-read-buffering nil)

(if (and (featurep 'native-compile)
         (fboundp 'native-comp-available-p)
         (native-comp-available-p))
      (setq package-native-compile t)
  (setq features (delq 'native-compile features)))

(setq load-prefer-newer t)
(setq native-comp-speed 3)
(native-compile-async "/usr/local/lib/emacs/30.2.50/native-lisp" 'recursively)
(setq native-comp-compiler-options '("-march=x86-64" "-Ofast" "-g0" "-fno-finite-math-only" "-fgraphite-identity" "-floop-nest-optimize" "-fdevirtualize-at-ltrans" "-fipa-pta" "-fno-semantic-interposition" "-flto=auto" "-fuse-linker-plugin"))
(setq native-comp-driver-options '("-march=x86-64" "-Ofast" "-g0" "-fno-finite-math-only" "-fgraphite-identity" "-floop-nest-optimize" "-fdevirtualize-at-ltrans" "-fipa-pta" "-fno-semantic-interposition" "-flto=auto" "-fuse-linker-plugin"))

(setq native-comp-deferred-compilation nil
      native-comp-speed 0
      native-comp-async-report-warnings-errors 'silent)

;; Ignore Warnings

;; Enable to debug configuration
;; (setq debug-on-error t)

(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)
(setq warning-suppress-types '((lexical-binding)))
(setq warning-minimum-level :error)

(defun my/display-startup-time ()
  "Display the startup time after Emacs initialization."
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'my/display-startup-time)

(setq ring-bell-function 'ignore
      compilation-scroll-output t
      frame-inhibit-implied-resize 'force
      frame-resize-pixelwise t
      indent-tabs-mode nil
      inhibit-splash-screen t
      inhibit-startup-buffer-menu t
      inhibit-startup-echo-area-message user-login-name
      inhibit-startup-screen t
      inhibit-x-resources t
      native-comp-deferred-compilation t
      package-enable-at-startup nil
      set-mark-command-repeat-pop t
      tab-width 8
      use-dialog-box nil
      use-file-dialog nil
      use-short-answers t
      vc-follow-symlinks t
      visible-bell nil)

(setq ring-bell-function #'ignore)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(hl-line-mode 1)

(setq hl-line-sticky-flag nil)
(setq global-hl-line-sticky-flag nil)

(show-paren-mode 1)
(setq show-paren-delay 0.1
      show-paren-highlight-openparen t
      show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(set-language-environment "UTF-8")

(add-to-list 'default-frame-alist `(font . ,"JetBrainsMonoNL Nerd Font-12"))

;; The theme is available at https://codeberg.org/aocoronel/elegantvagrant
(when
  (file-readable-p "~/.emacs.d/elegantvagrant-theme.el") (load "~/.emacs.d/elegantvagrant-theme.el")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/elegantvagrant-theme.el")
  (load-theme 'elegantvagrant t))

(setq ffap-machine-p-known 'reject)
(setq inhibit-compacting-font-caches t)
(advice-add 'display-startup-echo-area-message :override #'ignore)
(advice-add 'display-startup-screen :override #'ignore)
(setq initial-major-mode 'fundamental-mode
      initial-scratch-message nil)
(advice-add 'tool-bar-setup :override #'ignore)

(setq gnutls-verify-error t)
(setq tls-checktrust t)
(setq gnutls-min-prime-bits 3072)

(setq read-extended-command-predicate #'command-completion-default-include-p)
