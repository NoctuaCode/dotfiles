(setq user-full-name "Noctua Code"
      user-mail-address "noctuaapps@gmail.com")

(setq doom-font (font-spec :family "Fantasque Sans Mono" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fantasque Sans Mono" :size 15))

(setq doom-theme 'doom-rose-pine)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/Developer/org/")

(setq scroll-margin 10)

(use-package! lsp-tailwindcss
  :init (setq lsp-tailwindcss-add-on-mode t)
  :config
  (dolist (tw-major-mode
           '(css-mode
             css-ts-mode
             typescript-mode
             typescript-ts-mode
             tsx-ts-mode
             js2-mode
             js-ts-mode
             clojure-mode))
    (add-to-list 'lsp-tailwindcss-major-modes tw-major-mode)))
