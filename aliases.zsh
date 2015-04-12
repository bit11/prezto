# -------------------------------------------
# zsh aliases
# Last edited 04 Mar 15
# -------------------------------------------
## Aliases-----------------------------------------------------------------

# Pacman
alias pacupg='packer -Syyu'				# Sync and upgrade packages
alias pacins='packer -S'					# Install given package
alias pacuni='sudo pacman -Rns'					# Uninstall, remove unneeded dependencies, config files
alias pacsrh='packer -Ss'                       # Search for package
alias pacaur='sudo pacman -U'					# Install .pkg.tar.xz files
alias pacorp='sudo pacman -Rns $(pacman -Qqdt)'	# Find and uninstall orphans
alias pacinf='pacman -Qi'						# Obtain info on package
alias pacmir='sudo pacman-mirrors -g'   		# Update mirror list

# Git Manager
alias gita='gitman -a'
alias gitr='gitman -r'
alias gitp='gitman -p'

# Package Cache Manager
alias paccacheu='paccacheman -u'					# Clear cache of uninstalled packages
alias paccachei='paccacheman -i'					# Clear cache of installed packages

# Misc
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                       		    # confirm before overwriting something
alias rm=' timeout 10 rm -iv --one-file-system' # Suspend rm after 5 seconds, ask for confirmation for even one file
alias xrdb='xrdb ~/.Xresources'					# Reload Xresources file
alias cal='cal -y'								# List whole year's calendar
alias makedwm='make clean && make -j4'          # Recompile dwm

#VBA
alias vba='gvbam $HOME/Documents/VisualBoyAdvance-1.7.2/"Super Mario Advance 2 - Super Mario World (USA, Australia).gba"'

#Disable/enable firewall
alias stopfirewall='sudo systemctl stop iptables' 	# Stop firewall
alias startfirewall='sudo systemctl start iptables'	# Start firewall

#Disable screensaver
alias movieon='xset -dpms; xset s off && xset q && xautolock -disable'
alias movieoff='xset +dpms; xset s on && xset q && xautolock -enable'
alias soff='xset dpms force off && slock'

# Connect to Imperial Network Drive
alias umountimperial='sudo umount /media/imperial'

# STAR-CCM+
alias starccm+='wmname LG3D && $HOME/starccm/STAR-CCM+9.02.005/star/bin/starccm+'

# Microsoft Office
#alias excel='WINEPREFIX=~/office07 wine $HOME/office07/drive_c/"Program Files"/"Microsoft Office"/Office12/EXCEL.EXE' # Open Excel
#alias word='WINEPREFIX=~/office07 wine $HOME/office07/drive_c/"Program Files"/"Microsoft Office"/Office12/WINWORD.EXE' # Open Word
#alias powerpoint='WINEPREFIX=~/office07 wine $HOME/office07/drive_c/"Program Files"/"Microsoft Office"/Office12/POWERPNT.EXE' # Open Powerpoint

## Functions-------------------------------------------------------------------

# Coloured man pages
man() {
	env LESS_TERMCAP_mb=$'\E[01;31m' \
		LESS_TERMCAP_md=$'\E[01;32;74m' \
		LESS_TERMCAP_me=$'\E[0m' \
		LESS_TERMCAP_se=$'\E[0m' \
		LESS_TERMCAP_so=$'\E[38;5;246m' \
		LESS_TERMCAP_ue=$'\E[0m' \
		LESS_TERMCAP_us=$'\E[04;38;5;146m' \
		man "$@"
}

#Combine cd and ls
cl() {
	dir=$1
	if [[ -z "$dir" ]]; then
		dir=$HOME
	fi
	if [[ -d "$dir" ]]; then
		cd "$dir"
		ls
	else
		echo "bash: cl: '$dir': Directory not found"
	fi
}

#
## File Extractor
# usage: ex <file>
ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjvf $1   ;;
			*.tar.gz)    tar xzvf $1   ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar xv $1     ;;
	  		*.gz)        gunzip $1    ;;
			*.tar)       tar xvf $1    ;;
			*.tbz2)      tar xjvf $1   ;;
			*.tgz)       tar xzvf $1   ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1;;
	  		*.7z)        7z xv $1      ;;
  			*)           echo "'$1' cannot be extracted via ex()" ;;
	esac
else
	echo "'$1' is not a valid file"
fi
}
