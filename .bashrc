

Get_Current_Terminal() {
	if [[ "$WSLENV" != "" ]]; then
	  echo "Windows Terminal"; return
	fi
	if [[ "$TERM_PROGRAM" == "vscode" ]]; then
	  echo "VS Code"; return
	fi
	if [[ "$MSYSTEM" != "" ]]; then
	  echo "MSYS"; return
	fi
	if [[ "$__CFBundleIdentifier" != "" ]]; then
		if [[ "$__CFBundleIdentifier" =~ "apple.Terminal" ]]; then
			echo "MacOS Terminal"; return
		fi
		if [[ "$__CFBundleIdentifier" =~ "iterm" ]]; then
			echo "iTerm"; return
		fi
		if [[ "$__CFBundleIdentifier" =~ "termius" ]]; then
			echo "Termius"; return
		fi
		if [[ "$__CFBundleIdentifier" =~ "SecureCRT" ]]; then
			echo "SecureCRT"; return
		fi
	fi
	if [[ "$GNOME_TERMINAL_SCREEN" != "" ]]; then
	  echo "GNOME"; return
	fi
	echo "Other"; return
}
current_terminal=$(Get_Current_Terminal)
xposh_terms="Windows Terminal, VS Code, iTerm, Termius"
if ! [[ "$xposh_terms" =~ "$current_terminal" ]]; then
	xposh_min=".minimal"
fi
if [[ -x "$(command -v cygpath)" ]]; then
	POSH_PATH=$(cygpath ${POSH_PATH})
	export PATH=$PATH:${POSH_PATH}/bin
fi
if ! [[ -x "${POSH_PATH}" ]]; then
	POSH_PATH=/usr/local/opt/oh-my-posh
fi
export ShellName=$(basename $SHELL)
eval "$(oh-my-posh init "${ShellName}" --config "${POSH_PATH}/themes/xposh${xposh_min}.omp.json" | sed 's/-v MC_SID/"$MC_SID" != ""/g')"
