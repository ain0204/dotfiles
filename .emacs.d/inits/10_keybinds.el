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

;; "C-h"にbackspaceを割り当てる
;; (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; nnで「ん」が入力できるようする設定。
(setq quail-japanese-use-double-n t)
