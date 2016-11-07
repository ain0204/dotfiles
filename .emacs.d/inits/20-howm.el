;; ---
;; 
;; howm
;; ---
(require 'howm)
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(mapc
 (lambda (f)
   (autoload f
     "howm" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent
             howm-list-grep howm-create
             howm-keyword-to-kill-ring))
;; ファイルをorgに
(setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.org")
;; キーワード一覧を ~/howm/.howm-keys に置く
(setq howm-keyword-file "~/howm/.howm-keys")
; 新しくメモを作る時は、先頭の「=タイトル」だけ挿入。
(setq howm-template "= %title%cursor\n\n")