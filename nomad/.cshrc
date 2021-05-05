# $FreeBSD: src/etc/root/dot.cshrc,v 1.30.8.1 2009/04/15 03:14:26 kensmith Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA
alias rm	rm -i
# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	PAGER	more
setenv	BLOCKSIZE	K
setenv	CLICOLOR
setenv	G_FILENAME_ENCODING	@locale

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = '%n@%m:%~% '
	set filec
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif

bindkey ^[[3~ delete-char
