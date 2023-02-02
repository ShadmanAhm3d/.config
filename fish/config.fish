#sashimi is the scheme
if status is-interactive
    # Commands to run in interactive sessions can go here

 set -U fish_greeting 
alias faf "cd ~ && cd (find * -type d | fzf)"
alias fef "cd ~ && cd (find . -type d | fzf)"
  alias :wq="exit"
  alias sl="ls"
  alias update="sudo apt-get update"
  alias upgrade= "sudo apt-get upgrade"



  function leetcode
set search ""
echo "Googling: $argv"
for term in $argv
     set search "$search%20$term"
end
xdg-open "https://leetcode.com/problemset/all/?page=1"
end
  

  function codeforces 
set search ""
echo "Googling: $argv"
for term in $argv
     set search "$search%20$term"
end
xdg-open "https://codeforces.com/problemset"
end


end
