local user='%{$fg[magenta]%}%n@%m%{$reset_color%}:'
local pwd='%~'
local git='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'

PROMPT="${user}${pwd}${git} $ "

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}●%{$reset_color%}"
