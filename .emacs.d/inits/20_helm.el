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
