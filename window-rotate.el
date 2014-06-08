(defun rotate-windows-helper(x d)
  (if (equal (cdr x) nil)
      (set-window-buffer (car x) d)
    (set-window-buffer (car x) (window-buffer (cadr x)))
    (rotate-windows-helper (cdr x) d)))

(defun rotate-windows ()
  "Rotate your windows."
  (interactive)
  (cond
   ((not (> (count-windows) 1))
    (message "You can't rotate a single window!"))
   (t
    (let ((pt (point)))
      (rotate-windows-helper (window-list) (window-buffer (car (window-list))))
      (select-window (car (last (window-list))))
      (goto-char pt)))))

; bind to the key super-r 
(global-set-key (kbd "s-r") 'rotate-windows)
