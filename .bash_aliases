## Custom bash aliases & a little optione ;)

# Activating some bash options 
shopt -s autocd 

# edit this file
alias brc='$EDITOR ~/.bashrc'

# full system backup
alias sysbackup='sudo sh ~/scripts/sysbackup.sh'

# awesome - rc.lua 
alias ac='$EDITOR ~/.config/awesome/rc.lua' 

# 'ls' 
alias ls='ls -1 --color=auto'
alias la='ls -a1 --color=auto' 
alias ll='ls -a1l --color=auto'

# update grub menu entries (after kernel upgrade)
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# -- ssh keys --
# import github shh key
alias key-github='ssh-add ~/.ssh/id_github'

# import cluster ssh key
alias key-cluster='ssh-add ~/.ssh/id_cluster'

# ssh to cluster.wr
alias sshcl='ssh -X wilkens@cluster.wr.informatik.uni-hamburg.de'
# --          --

# star wars in telnet
alias telnet-sw='telnet towel.blinkenlights.nl'

# alias for print script
alias print='~/scripts/print.sh'

#alias for creating pdfs and cleaning up afterwards
alias mkpdf='~/scripts/mkpdf.sh'

#alias for changing backlight brightness
alias bl='sudo ~/scripts/bl.sh'