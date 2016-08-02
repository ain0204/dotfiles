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
;;(el-get-bundle nayn-mode)
(el-get-bundle google-translate)
(el-get-bundle neotree)
(el-get-bundle popwin)
(el-get-bundle open-junk-file)


;;---------------------------------------
;;
;; キーバインド集
;;---------------------------------------
;; C-mにnewline-and-indentを割り当てる
;; 本来、C-mにはnewlineが割り当てられている
(define-key global-map (kbd "C-m") 'newline-and-indent)

;; "C-h"にbackspaceを割jり当てる
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

;; backupファイルの保存先
(add-to-list 'backup-directory-alist
             (cons (expand-file-name "~/") (expand-file-name "~/.emacs.d/.trash/")))

;; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)

;; emacs クリップボード
(setq x-select-enable-clipboard t)

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


;; ---
;;
;; auto-complete
;; ---
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "C-TAB") ;; トリガーキー
(setq ac-use-menu-map t) ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t) ;; 曖昧マッチ


;; ---
;;
;; helm
;; ---
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "C-:") 'helm-for-files) ;; 環境によってはC-;が持っていかれているので
(global-set-key (kbd "C-c y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; "C-h"にbackspaceを割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))


;; ---
;;
;; nyan-mode
;; ---
;; (require 'nyan-mode)
;; (nyan-mode)
;; (nyan-start-animation) ;; 動くぞ！ 


;; ---
;;
;; open-junk-file
;; ---
(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/junk/%Y-%m%d.org")
(global-set-key "\C-xj" 'open-junk-file)


;; ---
;;
;; popwin
;; 設定途中 C-x C-jに適用したい
;; ---
(require 'popwin)
(popwin-mode 1)


;; ---
;;
;; NeoTree
;; C: ルートディレクトリの変更
;; c, +, p: ファイル作成
;; d: ファイル削除
;; r: ファイル名変更
;; e: ディレクトリを開く
;; ---
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; 隠しファイルをデフォルトで表示
(setq neo-show-hidden-files t)

;; delete-other-window で neotree ウィンドウを消さない
(setq neo-persist-show t)

;; キーバインドをシンプルにする
(setq neo-keymap-style 'concise)

;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open t)


;; ---
;;
;; 翻訳
;; ---
(require 'google-translate)

(defvar google-translate-english-chars "[:ascii:]"
  "これらの文字が含まれているときは英語とみなす")
(defun google-translate-enja-or-jaen (&optional string)
  "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
  (interactive)
  (setq string
        (cond ((stringp string) string)
              (current-prefix-arg
               (read-string "Google Translate: "))
              ((use-region-p)
               (buffer-substring (region-beginning) (region-end)))
              (t
               (save-excursion
                 (let (s)
                   (forward-char 1)
                   (backward-sentence)
                   (setq s (point))
                   (forward-sentence)
                   (buffer-substring s (point)))))))
  (let* ((asciip (string-match
                  (format "\\`[%s]+\\'" google-translate-english-chars)
                  string)))
    (run-at-time 0.1 nil 'deactivate-mark)
    (google-translate-translate
     (if asciip "en" "ja")
     (if asciip "ja" "en")
     string)))
(global-set-key (kbd "C-c t") 'google-translate-enja-or-jaen)


