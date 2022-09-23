if status is-interactive
    # Commands to run in interactive sessions can go here

 set -U fish_greeting 
  alias :wq="exit"
  alias update="sudo apt-get update"
  alias upgrade= "sudo apt-get upgrade"
end
