;;---------------------------------------
;;
;; El-Get
;;---------------------------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
(el-get-bundle anzu) ;; 検索件数を表示
(el-get-bundle volatile-highlights) ;; undoやyankした後にどこが変わったかをハイライトする
(el-get-bundle elpa:hlinum) ;; 行番号をいい感じに表示
(el-get-bundle haskell-mode)
(el-get-bundle atom-dark-theme)
(el-get-bundle monokai-theme)
(el-get-bundle init-loader)
(el-get-bundle yasnippet)
(el-get-bundle color-moccur)
(el-get-bundle moccur-edit)
(el-get-bundle elscreen)
(el-get-bundle cursor-in-brackets) ;; 括弧入力後に自動的に括弧内にカーソル移動
(el-get-bundle buffer-move) ;; bufferの移動(配置の交換)
(el-get-bundle multiple-cursors)
;; (el-get-bundle drill-instructor)
;; (el-get-bundle helm-c-moccur)
;; (el-get-bundle wget)
;; (el-get-bundle )


;; ---
;;
;; init-loader
;; ---
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/inits/")


;; ---
;;
;; 基本的な表示・装飾に関して
;; ---
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

;; Color
(load-theme 'monokai t)
;; コメントの色が気に入らないので変更
(set-face-foreground 'font-lock-comment-delimiter-face "YellowGreen")
(set-face-foreground 'font-lock-comment-face "YellowGreen")
;; Regionの色
;; (set-face-foreground 'region "white")
;; (set-face-background 'region "dimgray")
(set-face-foreground 'region "white")
(set-face-background 'region "honeydew4")

;; 対応する括弧をハイライト
(show-paren-mode t)
(setq show-paren-style 'mixed)


;; ---
;;
;; util
;; ---
;; backupファイルの保存先
(add-to-list 'backup-directory-alist
             (cons (expand-file-name "~/") (expand-file-name "~/.emacs.d/.trash/")))

;; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)

;; 警告音を消す
(setq ring-bell-function 'ignore)

;; emacs クリップボード
(setq x-select-enable-clipboard t)


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
;; ysnippet
;; 試用中
;; ---
(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/yasnippets"))
 
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
 
(yas-global-mode 1)

;;
;; buffer-move
;; 
(global-set-key (kbd "M-g h") 'buf-move-left)
(global-set-key (kbd "M-g j") 'buf-move-down)
(global-set-key (kbd "M-g k") 'buf-move-up)
(global-set-key (kbd "M-g l") 'buf-move-right)


;;
;; カーソル分身
;; https://github.com/magnars/multiple-cursors.el
;;
(require 'multiple-cursors)
;; 指定リージョン全てで分身
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; 指定中のワードで分身
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
