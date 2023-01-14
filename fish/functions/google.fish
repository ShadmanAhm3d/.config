
  function google
set search ""
echo "Googling: $argv"
for term in $argv
     set search "$search%20$term"
end
xdg-open "http://www.google.com/search?q=$search"
end
  


