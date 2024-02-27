#!/usr/bin/env bash

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Arc-Dark"

export COLOR_01="#4b5164" # Black (Host)
export COLOR_02="#e14245" # Red (Syntax string)
export COLOR_03="#5ca75b" # Green (Command)
export COLOR_04="#f6ab32" # Yellow (Command second)
export COLOR_05="#4877b1" # Blue (Path)
export COLOR_06="#a660c3" # Magenta (Syntax var)
export COLOR_07="#5294e2" # Cyan (Prompt)
export COLOR_08="#a9a9aa" # White

export COLOR_09="#4b5164" # Bright Black
export COLOR_10="#e14245" # Bright Red (Command error)
export COLOR_11="#5ca75b" # Bright Green (Exec)
export COLOR_12="#f6ab32" # Bright Yellow
export COLOR_13="#4877b1" # Bright Blue (Folder)
export COLOR_14="#a660c3" # Bright Magenta
export COLOR_15="#5294e2" # Bright Cyan
export COLOR_16="#a9a9aa" # Bright White

export BACKGROUND_COLOR="#383c4a" # Background
export FOREGROUND_COLOR="#d3dae3" # Foreground (Text)

export CURSOR_COLOR="${FOREGROUND_COLOR}" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Catppuccin Frappé"

export COLOR_01="#51576D" # Black (Host)
export COLOR_02="#E78284" # Red (Syntax string)
export COLOR_03="#A6D189" # Green (Command)
export COLOR_04="#E5C890" # Yellow (Command second)
export COLOR_05="#8CAAEE" # Blue (Path)
export COLOR_06="#F4B8E4" # Magenta (Syntax var)
export COLOR_07="#81C8BE" # Cyan (Prompt)
export COLOR_08="#B5BFE2" # White

export COLOR_09="#626880" # Bright Black
export COLOR_10="#E78284" # Bright Red (Command error)
export COLOR_11="#A6D189" # Bright Green (Exec)
export COLOR_12="#E5C890" # Bright Yellow
export COLOR_13="#8CAAEE" # Bright Blue (Folder)
export COLOR_14="#F4B8E4" # Bright Magenta
export COLOR_15="#81C8BE" # Bright Cyan
export COLOR_16="#A5ADCE" # Bright White

export BACKGROUND_COLOR="#303446" # Background
export FOREGROUND_COLOR="#C6D0F5" # Foreground (Text)

export CURSOR_COLOR="#C6D0F5" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Catppuccin Macchiato"

export COLOR_01="#494D64" # Black (Host)
export COLOR_02="#ED8796" # Red (Syntax string)
export COLOR_03="#A6DA95" # Green (Command)
export COLOR_04="#EED49F" # Yellow (Command second)
export COLOR_05="#8AADF4" # Blue (Path)
export COLOR_06="#F5BDE6" # Magenta (Syntax var)
export COLOR_07="#8BD5CA" # Cyan (Prompt)
export COLOR_08="#B8C0E0" # White

export COLOR_09="#5B6078" # Bright Black
export COLOR_10="#ED8796" # Bright Red (Command error)
export COLOR_11="#A6DA95" # Bright Green (Exec)
export COLOR_12="#EED49F" # Bright Yellow
export COLOR_13="#8AADF4" # Bright Blue (Folder)
export COLOR_14="#F5BDE6" # Bright Magenta
export COLOR_15="#8BD5CA" # Bright Cyan
export COLOR_16="#A5ADCB" # Bright White

export BACKGROUND_COLOR="#24273A" # Background
export FOREGROUND_COLOR="#CAD3F5" # Foreground (Text)

export CURSOR_COLOR="#CAD3F5" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Catppuccin Mocha"

export COLOR_01="#45475A" # Black (Host)
export COLOR_02="#F38BA8" # Red (Syntax string)
export COLOR_03="#A6E3A1" # Green (Command)
export COLOR_04="#F9E2AF" # Yellow (Command second)
export COLOR_05="#89B4FA" # Blue (Path)
export COLOR_06="#F5C2E7" # Magenta (Syntax var)
export COLOR_07="#94E2D5" # Cyan (Prompt)
export COLOR_08="#BAC2DE" # White

export COLOR_09="#585B70" # Bright Black
export COLOR_10="#F38BA8" # Bright Red (Command error)
export COLOR_11="#A6E3A1" # Bright Green (Exec)
export COLOR_12="#F9E2AF" # Bright Yellow
export COLOR_13="#89B4FA" # Bright Blue (Folder)
export COLOR_14="#F5C2E7" # Bright Magenta
export COLOR_15="#94E2D5" # Bright Cyan
export COLOR_16="#A6ADC8" # Bright White

export BACKGROUND_COLOR="#1E1E2E" # Background
export FOREGROUND_COLOR="#CDD6F4" # Foreground (Text)

export CURSOR_COLOR="#CDD6F4" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Doom-One"

export COLOR_01="#1c1f24" # Black (Host)
export COLOR_02="#FF6C6B" # Red (Syntax string)
export COLOR_03="#98BE65" # Green (Command)
export COLOR_04="#DA8548" # Yellow (Command second)
export COLOR_05="#51AFEF" # Blue (Path)
export COLOR_06="#C678DD" # Magenta (Syntax var)
export COLOR_07="#5699af" # Cyan (Prompt)
export COLOR_08="#dfdfdf" # White

export COLOR_09="#5b6268" # Bright Black
export COLOR_10="#FF6C6B" # Bright Red (Command error)
export COLOR_11="#98BE65" # Bright Green (Exec)
export COLOR_12="#DA8548" # Bright Yellow
export COLOR_13="#51AFEF" # Bright Blue (Folder)
export COLOR_14="#C678DD" # Bright Magenta
export COLOR_15="#5699af" # Bright Cyan
export COLOR_16="#dfdfdf" # Bright White

export BACKGROUND_COLOR="#282c34" # Background
export FOREGROUND_COLOR="#bbc2cf" # Foreground (Text)

export CURSOR_COLOR="#528bff" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Dracula"

export COLOR_01="#44475A" # Black (Host)
export COLOR_02="#FF5555" # Red (Syntax string)
export COLOR_03="#50FA7B" # Green (Command)
export COLOR_04="#FFB86C" # Yellow (Command second)
export COLOR_05="#8BE9FD" # Blue (Path)
export COLOR_06="#BD93F9" # Magenta (Syntax var)
export COLOR_07="#FF79C6" # Cyan (Prompt)
export COLOR_08="#f8f8f2" # White

export COLOR_09="#000000" # Bright Black
export COLOR_10="#FF5555" # Bright Red (Command error)
export COLOR_11="#50FA7B" # Bright Green (Exec)
export COLOR_12="#FFB86C" # Bright Yellow
export COLOR_13="#8BE9FD" # Bright Blue (Folder)
export COLOR_14="#BD93F9" # Bright Magenta
export COLOR_15="#FF79C6" # Bright Cyan
export COLOR_16="#FFFFFF" # Bright White

export BACKGROUND_COLOR="#282A36" # Background
export FOREGROUND_COLOR="#f8f8f2" # Foreground (Text)

export CURSOR_COLOR="#f8f8f2" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Everforest Dark"

export COLOR_01="#4B565C" # Black (Host)
export COLOR_02="#E67E80" # Red (Syntax string)
export COLOR_03="#A7C080" # Green (Command)
export COLOR_04="#DBBC7F" # Yellow (Command second)
export COLOR_05="#7FBBB3" # Blue (Path)
export COLOR_06="#D699B6" # Magenta (Syntax var)
export COLOR_07="#83C092" # Cyan (Prompt)
export COLOR_08="#D3C6AA" # White

export COLOR_09="#5C6A72" # Bright Black
export COLOR_10="#F85552" # Bright Red (Command error)
export COLOR_11="#8DA101" # Bright Green (Exec)
export COLOR_12="#DFA000" # Bright Yellow
export COLOR_13="#3A94C5" # Bright Blue (Folder)
export COLOR_14="#DF69BA" # Bright Magenta
export COLOR_15="#35A77C" # Bright Cyan
export COLOR_16="#DFDDC8" # Bright White

export BACKGROUND_COLOR="#2D353B" # Background
export FOREGROUND_COLOR="#D3C6AA" # Foreground (Text)

export CURSOR_COLOR="#D3C6AA" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Gruvbox Dark"

export COLOR_01="#282828" # Black (Host)
export COLOR_02="#CC241D" # Red (Syntax string)
export COLOR_03="#98971A" # Green (Command)
export COLOR_04="#D79921" # Yellow (Command second)
export COLOR_05="#458588" # Blue (Path)
export COLOR_06="#B16286" # Magenta (Syntax var)
export COLOR_07="#689D6A" # Cyan (Prompt)
export COLOR_08="#A89984" # White

export COLOR_09="#928374" # Bright Black
export COLOR_10="#FB4934" # Bright Red (Command error)
export COLOR_11="#B8BB26" # Bright Green (Exec)
export COLOR_12="#FABD2F" # Bright Yellow
export COLOR_13="#83A598" # Bright Blue (Folder)
export COLOR_14="#D3869B" # Bright Magenta
export COLOR_15="#8EC07C" # Bright Cyan
export COLOR_16="#EBDBB2" # Bright White

export BACKGROUND_COLOR="#282828" # Background
export FOREGROUND_COLOR="#EBDBB2" # Foreground (Text)

export CURSOR_COLOR="#EBDBB2" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Gruvbox Material"

export COLOR_01="#3C3836" # Black (Host)
export COLOR_02="#EA6962" # Red (Syntax string)
export COLOR_03="#A9B665" # Green (Command)
export COLOR_04="#D8A657" # Yellow (Command second)
export COLOR_05="#7DAEA3" # Blue (Path)
export COLOR_06="#D3869B" # Magenta (Syntax var)
export COLOR_07="#89B482" # Cyan (Prompt)
export COLOR_08="#D4BE98" # White

export COLOR_09="#3C3836" # Bright Black
export COLOR_10="#EA6962" # Bright Red (Command error)
export COLOR_11="#A9B665" # Bright Green (Exec)
export COLOR_12="#D8A657" # Bright Yellow
export COLOR_13="#7DAEA3" # Bright Blue (Folder)
export COLOR_14="#D3869B" # Bright Magenta
export COLOR_15="#89B482" # Bright Cyan
export COLOR_16="#D4BE98" # Bright White

export BACKGROUND_COLOR="#282828" # Background
export FOREGROUND_COLOR="#D4BE98" # Foreground (Text)

export CURSOR_COLOR="#D4BE98" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Kanagawa"

export COLOR_01="#090618" # Black (Host)
export COLOR_02="#C34043" # Red (Syntax string)
export COLOR_03="#76946A" # Green (Command)
export COLOR_04="#C0A36E" # Yellow (Command second)
export COLOR_05="#7E9CD8" # Blue (Path)
export COLOR_06="#957FB8" # Magenta (Syntax var)
export COLOR_07="#6A9589" # Cyan (Prompt)
export COLOR_08="#DCD7BA" # White

export COLOR_09="#727169" # Bright Black
export COLOR_10="#E82424" # Bright Red (Command error)
export COLOR_11="#98BB6C" # Bright Green (Exec)
export COLOR_12="#E6C384" # Bright Yellow
export COLOR_13="#7FB4CA" # Bright Blue (Folder)
export COLOR_14="#938AA9" # Bright Magenta
export COLOR_15="#7AA89F" # Bright Cyan
export COLOR_16="#C8C093" # Bright White

export BACKGROUND_COLOR="#1F1F28" # Background
export FOREGROUND_COLOR="#DCD7BA" # Foreground (Text)

export CURSOR_COLOR="#DCD7BA" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Material"

export COLOR_01="#073641" # Black (Host)
export COLOR_02="#EB606B" # Red (Syntax string)
export COLOR_03="#C3E88D" # Green (Command)
export COLOR_04="#F7EB95" # Yellow (Command second)
export COLOR_05="#80CBC3" # Blue (Path)
export COLOR_06="#FF2490" # Magenta (Syntax var)
export COLOR_07="#AEDDFF" # Cyan (Prompt)
export COLOR_08="#FFFFFF" # White

export COLOR_09="#002B36" # Bright Black
export COLOR_10="#EB606B" # Bright Red (Command error)
export COLOR_11="#C3E88D" # Bright Green (Exec)
export COLOR_12="#F7EB95" # Bright Yellow
export COLOR_13="#7DC6BF" # Bright Blue (Folder)
export COLOR_14="#6C71C3" # Bright Magenta
export COLOR_15="#34434D" # Bright Cyan
export COLOR_16="#FFFFFF" # Bright White

export BACKGROUND_COLOR="#1E282C" # Background
export FOREGROUND_COLOR="#C3C7D1" # Foreground (Text)

export CURSOR_COLOR="#657B83" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Oceanic Next"

export COLOR_01="#121C21" # Black (Host)
export COLOR_02="#E44754" # Red (Syntax string)
export COLOR_03="#89BD82" # Green (Command)
export COLOR_04="#F7BD51" # Yellow (Command second)
export COLOR_05="#5486C0" # Blue (Path)
export COLOR_06="#B77EB8" # Magenta (Syntax var)
export COLOR_07="#50A5A4" # Cyan (Prompt)
export COLOR_08="#FFFFFF" # White

export COLOR_09="#52606B" # Bright Black
export COLOR_10="#E44754" # Bright Red (Command error)
export COLOR_11="#89BD82" # Bright Green (Exec)
export COLOR_12="#F7BD51" # Bright Yellow
export COLOR_13="#5486C0" # Bright Blue (Folder)
export COLOR_14="#B77EB8" # Bright Magenta
export COLOR_15="#50A5A4" # Bright Cyan
export COLOR_16="#FFFFFF" # Bright White

export BACKGROUND_COLOR="#121B21" # Background
export FOREGROUND_COLOR="#B3B8C3" # Foreground (Text)

export CURSOR_COLOR="#B3B8C3" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Ocean Dark"

export COLOR_01="#4F4F4F" # Black (Host)
export COLOR_02="#AF4B57" # Red (Syntax string)
export COLOR_03="#AFD383" # Green (Command)
export COLOR_04="#E5C079" # Yellow (Command second)
export COLOR_05="#7D90A4" # Blue (Path)
export COLOR_06="#A4799D" # Magenta (Syntax var)
export COLOR_07="#85A6A5" # Cyan (Prompt)
export COLOR_08="#EEEDEE" # White

export COLOR_09="#7B7B7B" # Bright Black
export COLOR_10="#AF4B57" # Bright Red (Command error)
export COLOR_11="#CEFFAB" # Bright Green (Exec)
export COLOR_12="#FFFECC" # Bright Yellow
export COLOR_13="#B5DCFE" # Bright Blue (Folder)
export COLOR_14="#FB9BFE" # Bright Magenta
export COLOR_15="#DFDFFD" # Bright Cyan
export COLOR_16="#FEFFFE" # Bright White

export BACKGROUND_COLOR="#1C1F27" # Background
export FOREGROUND_COLOR="#979CAC" # Foreground (Text)

export CURSOR_COLOR="#979CAC" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="One Dark"

export COLOR_01="#000000" # Black (Host)
export COLOR_02="#E06C75" # Red (Syntax string)
export COLOR_03="#98C379" # Green (Command)
export COLOR_04="#D19A66" # Yellow (Command second)
export COLOR_05="#61AFEF" # Blue (Path)
export COLOR_06="#C678DD" # Magenta (Syntax var)
export COLOR_07="#56B6C2" # Cyan (Prompt)
export COLOR_08="#ABB2BF" # White

export COLOR_09="#5C6370" # Bright Black
export COLOR_10="#E06C75" # Bright Red (Command error)
export COLOR_11="#98C379" # Bright Green (Exec)
export COLOR_12="#D19A66" # Bright Yellow
export COLOR_13="#61AFEF" # Bright Blue (Folder)
export COLOR_14="#C678DD" # Bright Magenta
export COLOR_15="#56B6C2" # Bright Cyan
export COLOR_16="#FFFEFE" # Bright White

export BACKGROUND_COLOR="#1E2127" # Background
export FOREGROUND_COLOR="#5C6370" # Foreground (Text)

export CURSOR_COLOR="#5C6370" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Palenight"

export COLOR_01="#292D3E" # Black (Host)
export COLOR_02="#F07178" # Red (Syntax string)
export COLOR_03="#C3E88D" # Green (Command)
export COLOR_04="#FFCB6B" # Yellow (Command second)
export COLOR_05="#82AAFF" # Blue (Path)
export COLOR_06="#C792EA" # Magenta (Syntax var)
export COLOR_07="#60ADEC" # Cyan (Prompt)
export COLOR_08="#ABB2BF" # White

export COLOR_09="#959DCB" # Bright Black
export COLOR_10="#F07178" # Bright Red (Command error)
export COLOR_11="#C3E88D" # Bright Green (Exec)
export COLOR_12="#FF5572" # Bright Yellow
export COLOR_13="#82AAFF" # Bright Blue (Folder)
export COLOR_14="#FFCB6B" # Bright Magenta
export COLOR_15="#676E95" # Bright Cyan
export COLOR_16="#FFFEFE" # Bright White

export BACKGROUND_COLOR="#292D3E" # Background
export FOREGROUND_COLOR="#BFC7D5" # Foreground (Text)

export CURSOR_COLOR="#BFC7D5" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Rosé Pine"

export COLOR_01="#26233A" # Black (Host)
export COLOR_02="#EB6F92" # Red (Syntax string)
export COLOR_03="#9CCFD8" # Green (Command)
export COLOR_04="#F6C177" # Yellow (Command second)
export COLOR_05="#31748F" # Blue (Path)
export COLOR_06="#C4A7E7" # Magenta (Syntax var)
export COLOR_07="#EBBCBA" # Cyan (Prompt)
export COLOR_08="#E0DEF4" # White

export COLOR_09="#6E6A86" # Bright Black
export COLOR_10="#EB6F92" # Bright Red (Command error)
export COLOR_11="#9CCFD8" # Bright Green (Exec)
export COLOR_12="#F6C177" # Bright Yellow
export COLOR_13="#31748F" # Bright Blue (Folder)
export COLOR_14="#C4A7E7" # Bright Magenta
export COLOR_15="#EBBCBA" # Bright Cyan
export COLOR_16="#E0DEF4" # Bright White

export BACKGROUND_COLOR="#191724" # Background
export FOREGROUND_COLOR="#E0DEF4" # Foreground (Text)

export CURSOR_COLOR="#E0DEF4" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Rosé Pine Moon"

export COLOR_01="#393552" # Black (Host)
export COLOR_02="#EB6F92" # Red (Syntax string)
export COLOR_03="#9CCFD8" # Green (Command)
export COLOR_04="#F6C177" # Yellow (Command second)
export COLOR_05="#3E8FB0" # Blue (Path)
export COLOR_06="#C4A7E7" # Magenta (Syntax var)
export COLOR_07="#EA9A97" # Cyan (Prompt)
export COLOR_08="#E0DEF4" # White

export COLOR_09="#6E6A86" # Bright Black
export COLOR_10="#EB6F92" # Bright Red (Command error)
export COLOR_11="#9CCFD8" # Bright Green (Exec)
export COLOR_12="#F6C177" # Bright Yellow
export COLOR_13="#3E8FB0" # Bright Blue (Folder)
export COLOR_14="#C4A7E7" # Bright Magenta
export COLOR_15="#EA9A97" # Bright Cyan
export COLOR_16="#E0DEF4" # Bright White

export BACKGROUND_COLOR="#232136" # Background
export FOREGROUND_COLOR="#E0DEF4" # Foreground (Text)

export CURSOR_COLOR="#E0DEF4" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Sweet"

export COLOR_01="#282C34" # Black (Host)
export COLOR_02="#ED254E" # Red (Syntax string)
export COLOR_03="#71F79F" # Green (Command)
export COLOR_04="#F9DC5C" # Yellow (Command second)
export COLOR_05="#7CB7FF" # Blue (Path)
export COLOR_06="#C74DED" # Magenta (Syntax var)
export COLOR_07="#00C1E4" # Cyan (Prompt)
export COLOR_08="#DCDFE4" # White

export COLOR_09="#282C34" # Bright Black
export COLOR_10="#ED254E" # Bright Red (Command error)
export COLOR_11="#71F79F" # Bright Green (Exec)
export COLOR_12="#F9DC5C" # Bright Yellow
export COLOR_13="#7CB7FF" # Bright Blue (Folder)
export COLOR_14="#C74DED" # Bright Magenta
export COLOR_15="#00C1E4" # Bright Cyan
export COLOR_16="#DCDFE4" # Bright White

export BACKGROUND_COLOR="#161925" # Background
export FOREGROUND_COLOR="#C3C7D1" # Foreground (Text)

export CURSOR_COLOR="#C3C7D1" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Tokyo Night"

export COLOR_01="#414868" # Black (Host)
export COLOR_02="#F7768E" # Red (Syntax string)
export COLOR_03="#9ECE6A" # Green (Command)
export COLOR_04="#E0AF68" # Yellow (Command second)
export COLOR_05="#7AA2F7" # Blue (Path)
export COLOR_06="#BB9AF7" # Magenta (Syntax var)
export COLOR_07="#7DCFFF" # Cyan (Prompt)
export COLOR_08="#A9B1D6" # White

export COLOR_09="#414868" # Bright Black
export COLOR_10="#F7768E" # Bright Red (Command error)
export COLOR_11="#9ECE6A" # Bright Green (Exec)
export COLOR_12="#E0AF68" # Bright Yellow
export COLOR_13="#7AA2F7" # Bright Blue (Folder)
export COLOR_14="#BB9AF7" # Bright Magenta
export COLOR_15="#7DCFFF" # Bright Cyan
export COLOR_16="#C0CAF5" # Bright White

export BACKGROUND_COLOR="#1A1B26" # Background
export FOREGROUND_COLOR="#C0CAF5" # Foreground (Text)

export CURSOR_COLOR="#C0CAF5" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Tokyo Night Storm"

export COLOR_01="#414868" # Black (Host)
export COLOR_02="#F7768E" # Red (Syntax string)
export COLOR_03="#9ECE6A" # Green (Command)
export COLOR_04="#E0AF68" # Yellow (Command second)
export COLOR_05="#7AA2F7" # Blue (Path)
export COLOR_06="#BB9AF7" # Magenta (Syntax var)
export COLOR_07="#7DCFFF" # Cyan (Prompt)
export COLOR_08="#C0CAF5" # White

export COLOR_09="#414868" # Bright Black
export COLOR_10="#F7768E" # Bright Red (Command error)
export COLOR_11="#9ECE6A" # Bright Green (Exec)
export COLOR_12="#E0AF68" # Bright Yellow
export COLOR_13="#7AA2F7" # Bright Blue (Folder)
export COLOR_14="#BB9AF7" # Bright Magenta
export COLOR_15="#7DCFFF" # Bright Cyan
export COLOR_16="#C0CAF5" # Bright White

export BACKGROUND_COLOR="#24283B" # Background
export FOREGROUND_COLOR="#C0CAF5" # Foreground (Text)

export CURSOR_COLOR="#C0CAF5" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------

export PROFILE_NAME="Tomorrow Night"

export COLOR_01="#000000" # Black (Host)
export COLOR_02="#CC6666" # Red (Syntax string)
export COLOR_03="#B5BD68" # Green (Command)
export COLOR_04="#F0C674" # Yellow (Command second)
export COLOR_05="#81A2BE" # Blue (Path)
export COLOR_06="#B293BB" # Magenta (Syntax var)
export COLOR_07="#8ABEB7" # Cyan (Prompt)
export COLOR_08="#FFFEFE" # White

export COLOR_09="#808080" # Bright Black
export COLOR_10="#CC6666" # Bright Red (Command error)
export COLOR_11="#B5BD68" # Bright Green (Exec)
export COLOR_12="#F0C574" # Bright Yellow
export COLOR_13="#80A1BD" # Bright Blue (Folder)
export COLOR_14="#B294BA" # Bright Magenta
export COLOR_15="#8ABDB6" # Bright Cyan
export COLOR_16="#FFFEFE" # Bright White

export BACKGROUND_COLOR="#1D1F21" # Background
export FOREGROUND_COLOR="#C5C8C6" # Foreground (Text)

export CURSOR_COLOR="#C4C8C5" # Cursor

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Gogh-Co/Gogh/master"}

if [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
	bash "${PARENT_PATH}/apply-colors.sh"
else
	if [[ "$(uname)" == "Darwin" ]]; then
		# OSX ships with curl and ancient bash
		bash -c "$(curl -so- "${BASE_URL}/apply-colors.sh")"
	else
		# Linux ships with wget
		bash -c "$(wget -qO- "${BASE_URL}/apply-colors.sh")"
	fi
fi

# -----------------------------------------------------------------------------------------
