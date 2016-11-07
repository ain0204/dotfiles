;; ---
;; 
;; multiple-cursors
;; カーソル分身
;; https://github.com/magnars/multiple-cursors.el
;; ---
(require 'multiple-cursors)
;; 指定リージョン全てで分身
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; 指定中のワードで分身
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
