;;
;; tLaTeX setup
;;
(defun Thai-LaTeX-mode-hook ()
  (or (assoc "tLaTeX" TeX-command-list)
      (setq TeX-command-list
            (cons
             (list "tLaTeX" "cp -p %t _%t; swath -f latex < _%t > %t; latex '\\nonstopmode\\input{%t}'; cp -p _%t %t; rm _%t" 'TeX-run-LaTeX nil t)
                  TeX-command-list))))

(add-hook 'LaTeX-mode-hook 'Thai-LaTeX-mode-hook)
