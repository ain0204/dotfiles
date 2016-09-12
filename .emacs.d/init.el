;;---------------------------------------
;;
;; El-Get
;;---------------------------------------
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; packages
(el-get-bundle helm)
(el-get-bundle auto-complete)
(el-get-bundle nyan-mode)
(el-get-bundle google-translate)
(el-get-bundle neotree)
(el-get-bundle popwin)
(el-get-bundle open-junk-file)
(el-get-bundle jedi)
(el-get-bundle flycheck)
(el-get-bundle redo+)
(el-get-bundle highlight-symbol)
;; 検索件数を表示
(el-get-bundle anzu)
;; undoやyankした後にどこが変わったかをハイライトする
(el-get-bundle volatile-highlights)
;; 行番号をいい感じに表示
(el-get-bundle elpa:hlinum)
(el-get-bundle smartparens)

(el-get-bundle haskell-mode)
;;(el-get-bundle drill-instructor)
;; color-themes
(el-get-bundle atom-dark-theme)
(el-get-bundle monokai-theme)
(el-get-bundle init-loader)
;;(el-get-bundle )

;; ---
;;
;; init-loader
;; ---
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/inits/")


;;---------------------------------------
;;
;; 基本的な表示・装飾に関して
;;---------------------------------------
;; モードラインの表示設定
;; 行番号 / カラム番号の表示
(line-number-mode t)
(column-number-mode t)

;; タイトルバーにファイルのフルパスを表示 
(setq frame-title-format "emacs : %f")

;; スタートアップ非表示
(setq inhibit-startup-screen t)
;; ツールバーを非表示
(tool-bar-mode -1)
;; メニューバーを非表示
(menu-bar-mode -1)
;; scroll-barの非表示
(scroll-bar-mode -1)

;; *scratch* バッファのメッセージ変更
(setq initial-scratch-message
      ";; Godspeed you!")

;; backupファイルの保存先
(add-to-list 'backup-directory-alist
             (cons (expand-file-name "~/") (expand-file-name "~/.emacs.d/.trash/")))

;; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)

;; emacs クリップボード
(setq x-select-enable-clipboard t)

;; 警告音を消す
(setq ring-bell-function 'ignore)

;; Color
(load-theme 'monokai t)

;; 対応する括弧をハイライト
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; ---
;; 
;; 背景透過を切り替える関数
;; ---
(setq alpha-on-flag nil)
(set-frame-parameter nil 'alpha 100)

(defun alpha-toggle()
  (interactive)
  (if (equal alpha-on-flag t)
      (progn
	(load-theme 'monokai t)
	(set-frame-parameter nil 'alpha 100)
	(setq alpha-on-flag nil)
	(message "alpha-off"))
    (progn
      (set-frame-parameter nil 'alpha 80)
      (set-background-color "Black")
      (set-foreground-color "LightGray")
      (set-cursor-color "Gray")
      (setq alpha-on-flag t)
      (message "alpha-on"))))

(define-key global-map (kbd "C-c C-a") 'alpha-toggle)


;; ---
;;
;; 文字コードの設定 1
;; !!caution!! mozcより後だとmozcが死ぬ
;; ---
(set-language-environment "Japanese")


;; ---
;;
;; mozc
;; ---
(require 'mozc)

;;(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
;; ミニバッファに表示する
(setq mozc-candidate-style 'echo-area)

;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("limegreen" "red" "red"))

(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)

(add-hook 'mozc-mode-hook
(lambda()
  (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))

;; mozc on/off で色を変える
(add-hook 'input-method-activate-hook
          (lambda() (set-cursor-color "dark orange")))
(add-hook 'input-method-inactivate-hook
          (lambda() (set-cursor-color "white smoke")))


;; ---
;;
;; 文字コードの設定 2
;; !!caution!! mozcに上書きされちゃうのでmozcより後で
;; ---
(prefer-coding-system 'utf-8)


;; ---
;;
;; nyan-mode
;; ---
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation) ;; 動くぞ！ 


;; ---
;;
;; popwin
;; 設定途中 C-x C-jに適用したい
;; ---
(require 'popwin)
(popwin-mode 1)


;; ---
;;
;; jebi
;; sudo pacman -S python-virtualenv
;; M-x jedi:install-server
;; ---
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;; ---
;;
;; flycheck
;; ---
(add-hook 'after-init-hook #'global-flycheck-mode)


;; ---
;;
;; redo+
;; ---
(when (require 'redo+ nil t)
  (global-set-key (kbd "C-.") 'redo))


;; ---
;;
;; highlight-symbol
;; ---
(require 'highlight-symbol)
;; 1秒後自動ハイライトされるようになる
(setq highlight-symbol-idle-delay 1.0)
;; 自動ハイライトをしたいならば
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
;; ソースコードにおいてM-p/M-nでシンボル間を移動
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
;; 色をつける（global-hl-line-modeとの兼ね合いで変になるけど...）
(global-set-key [(control f3)] 'highlight-symbol)
;; シンボル置換
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)


;; ---
;;
;; volatile-highlights
;; ---
(require 'volatile-highlights)
(volatile-highlights-mode t)


;; ---
;;
;; 括弧補完
;; ---
(require 'smartparens-config)
(smartparens-global-mode t)


;; ---
;;
;; C++ まわりの設定
;; ---
;;
;;ヘッダファイル(.h)をc++モードで開く
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
              auto-mode-alist))
