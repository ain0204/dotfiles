;; ---
;;
;; open-junk-file
;; ---
(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/junk/%Y-%m%d.org")

(defun my-open-junk-file()
  "junk file の保存先があるか確認してからopen-junk-fileする"
  (interactive)
  (if (file-exists-p "~/Documents/junk")
      (open-junk-file)
    (message "Junk file error: Please make dir ~/Documents/junk")))

(global-set-key "\C-xj" 'my-open-junk-file)
