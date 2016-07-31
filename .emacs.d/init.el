;;---------------------------------------
;;
;; パッケージ関連
;; package-refresh-contents でパッケージ情報を更新
;;---------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize) ;; 初期化


;;---------------------------------------
;;
;; キーバインド集
;;---------------------------------------
;; C-mにnewline-and-indentを割り当てる
;; 本来、C-mにはnewlineが割り当てられている
(define-key global-map (kbd "C-m") 'newline-and-indent)

;; "C-h"にbackspaceを割り当てる
(define-key global-map (kbd "C-h") 'delete-backward-char)

;; "C-c l"に折り返しトグルを割り当てる
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; "C-t"でウィンドウを切り替える
;; 初期値はtranspose-chars（入れ替えるやつ）が割り当てられてる。
(define-key global-map (kbd "C-t") 'other-window)

;; "C-c C-r" に置換を割り当てる
(define-key global-map (kbd "C-c C-r") 'replace-string)

;; nnで「ん」が入力できるようする設定。
(setq quail-japanese-use-double-n t)


;;---------------------------------------
;;
;; 基本的な表示・装飾に関して
;;---------------------------------------
;; モードラインの表示設定
;; 行番号 / カラム番号の表示
(line-number-mode t)
(column-number-mode t)

;; 行番号表示
(global-linum-mode t)

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


;; Color
(load-theme 'tango-dark t)
;; (set-background-color "Black")
;; (set-foreground-color "LightGray")
;; (set-cursor-color "Gray")


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
	(set-frame-parameter nil 'alpha 100)
	(setq alpha-on-flag nil)
	(message "alpha-off"))
    (progn
      (set-frame-parameter nil 'alpha 80)
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

(set-language-environment "Japanese")
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
