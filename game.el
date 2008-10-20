(require 'pak-misc)

(defun game-expand (expando)
  "Expand a game.pl string and return it as a string."
  (interactive "MExpando: ")
  (chomp (shell-command-as-string (concat "~/work/game/game.pl --test-string="
                                          (shell-quote-argument expando)))))

(defun insert-game-expand (expando)
  "Expand a game.pl string and insert it at point."
  (interactive "MExpando: ")
  (insert (game-expand expando)))

(defun insert-game-rant ()
  "Insert a random game.pl rant at point."
  (interactive)
  (insert (game-expand "<Rant>")))

(provide 'game)