(put 'downcase-region 'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; (when (>= emacas-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;   )

;(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)
;(setq geben-path-mappings '(("/srv/http/CREAR_web/fc/")))

;; Codificación UTF-8 por defecto
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


(require 'cl)
(require 'color)

(defun csv-highlight (&optional separator)
  (interactive (list (when current-prefix-arg (read-char "Separator: "))))
  (font-lock-mode 1)
  (let* ((separator (or separator ?\,))
         (n (count-matches (string separator) (point-at-bol) (point-at-eol)))
         (colors (loop for i from 0 to 1.0 by (/ 2.0 n)
                       collect (apply #'color-rgb-to-hex 
                                      (color-hsl-to-rgb i 0.3 0.5)))))
    (loop for i from 2 to n by 2 
          for c in colors
          for r = (format "^\\([^%c\n]+%c\\)\\{%d\\}" separator separator i)
          do (font-lock-add-keywords nil `((,r (1 '(face (:foreground ,c)))))))))

 (add-hook 'csv-mode-hook 'csv-highlight)

(require 'sql)

(add-hook 'sql-mode-hook 'company-mode)

(require 'linum)
(global-linum-mode 1)

;;(require 'recentf)
;;(recentf-mode 1)
	
;; Activar modo siempre
(electric-pair-mode 1)

;; (require 'auto-complete)
;; (global-auto-complete-mode 1)

(require 'web-mode)
(add-hook 'web-mode-hook 'flycheck-mode)
(add-hook 'web-mode-hook 'company-mode)

(require 'company-auctex)
(company-auctex-init)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)
(add-hook 'LaTeX-mode-hook 'company-mode )
(company-auctex-init)

;; Activar RefTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
 
;; LaTeX extra para tener doblado de secciones como Org
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)


(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
;; (add-hook 'LaTeX-mode-hook 'auto-complete-mode)
;; (add-hook 'text-mode-hook 'auto-complete-mode)
;; (add-hook 'tex-mode-hook 'auto-complete-mode)

(set-default 'preview-scale-function 1.5)

(setq-local flymake-diagnostic-functions
                (list (flymake-flycheck-diagnostic-function-for 'sh-shellcheck)
                      (flymake-flycheck-diagnostic-function-for 'sh-posix-bash)))

(require 'rainbow-blocks)
(add-hook 'clojure-mode-hook 'rainbow-blocks-mode)

(add-hook 'php-mode-hook 'flycheck-mode 1)
(add-hook 'php-mode-hook 'company-mode 1)

(add-hook 'php-mode-hook 'company-php-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-light))
 '(custom-safe-themes
   '("bd28a7a54d9bfbda4456afb650a5990282b391f1e0494fb04b095981255066ae" "20ad8133a73088c0ce4f26d106c3e70cae4e10c7e613c9b9e17a962eb194a24f" "047ec205dcb5edbb94b35800110150a6e41e6cc92c0ccfb2ed25ac3df94331a6" "b5cff93c3c6ed12d09ce827231b0f5d4925cfda018c9dcf93a2517ce3739e7f1" "e6e07c74bee845f48da5f46843a241d71d4ee3bf945fb506c05a08e5c872df3e" "5f4dfda04fbf7fd55228266c8aab73953d3087cea7fd06dd7f8ff1e4a497c739" "e006d90eaf64a2d78154ecb277ccc82327e1b975d7d0e2f933acca3131cd0177" "d86ddb4126c19487edd10a0f1a16f77fdaadafbdac9f4fcd695cf1c0a215117b" "64affc3597b4271ba6b0b428777d616cfb20d8f7f147dbd00f1de220b2b59bbf" "4ca84f9861113f889d505b66c4a9c30b81400f450b54f4c857d3eb44c5bdc601" "1ba950bff674dd0e08edeb8b8f83ee338bbef0bc769349ed38de10854927e487" "aad7fd3672aad03901bf91e338cd530b87efc2162697a6bef79d7f8281fd97e3" "b80d4f6dee7691fc5a437d760164c3eba202944b3f977d5b47bbb6b76cba0806" "69ecb7a75a0a8440df4b9ffe28b46dadf849b499c7e10680c26b99a84df773ca" "d1b30c69aaf27807108e358b08c6aec4759d7240bc530fca90fd5833813fbc84" "32b75b124f7f84517d3803a13a807189bae717b9d28e68e5a327a8ba55b7a6ee" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "f831c1716ebc909abe3c851569a402782b01074e665a4c140e3e52214f7504a0" "654b365467a92ff70c70f4926974e07dcdb34805d2787c51710b467e695342e6" "9939e735844cb24144d29ddf03fadf86a2d455758afeeee30372258e8a6401bb" default))
 '(package-selected-packages
   '(color-identifiers-mode color-theme color-theme-modern color-theme-sanityinc-solarized color-theme-x colorless-themes colormaps npm nov codebug lsp-mode typescript-mode flymake-flycheck paredit paren-face parent-mode mic-paren rainbow-delimiters mysql-to-org rainbow-blocks dap-mode pabbrev paced auctex auctex-cluttex auctex-latexmk auctex-lua cdlatex latex-table-wizard magic-latex-buffer math-symbol-lists math-symbols math-tex-convert org-elp anaconda-mode company-jedi ein elpy elpygen flycheck-pycheckers flymake-python-pyflakes format-all python-info python company-web csv csv-mode web-mode web-beautify latexdiff latex-unicode-math-mode latex-preview-pane latex-pretty-symbols latex-math-preview latex-extra latex-change-env geben company-php company-auctex auto-complete-auctex ac-php ac-html-bootstrap ac-html))
 '(preview-image-type 'dvipng)
 '(sql-connection-alist
   '(("creativo"
      (sql-product 'mysql)
      (sql-user "imcreati_admin")
      (sql-database "imcreati_data")
      (sql-password "conezioncrear21")
      (sql-server "localhost"))))
 '(warning-suppress-log-types
   '(((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))))
 '(warning-suppress-types
   '(((package reinitialization))
     ((package reinitialization)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight bold :height 98 :width normal)))))
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)



(use-package lsp-mode)



(setq make-backup-files nil) ; stop creating ~ files

(add-hook 'html-hook 'web-mode 1)

 '(cua-mode t)
 '(custom-enabled-themes '(emacs-21))

(put 'downcase-region 'disabled nil)

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

(setq js-indent-level 2)

(setf (lsp-session-folders-blacklist (lsp-session)) nil)
(lsp--persist-session (lsp-session))


;; ortografia
(setq ispell-program-name "aspell")        ; Usa Aspell como el corrector ortográfico
(setq ispell-dictionary "spanish")         ; Establece el diccionario a español
(setq ispell-local-dictionary-alist
      '(("spanish" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))


;; activa el corrector ortografico con los siguientes modos
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; activo el diccionario cuando reviso ortografia
(add-hook 'flycheck-mode-hook 'flycheck-spellchecker-setup)
;; configuro el modo php
(use-package php-mode
  :ensure t)

;; configuro el modo lsp
(use-package lsp-mode
  :ensure t
  :hook (php-mode . lsp))

(use-package lsp-mode
  :ensure t
  :hook (php-mode . lsp)
  :config
  (setq lsp-idle-delay 0.1)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))


(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs flycheck company which-key dap-mode php-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(which-key-mode)
(add-hook 'php-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast


