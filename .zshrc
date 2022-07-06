# Created by newuser for 5.8.1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zini插件管理器
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

# 插件加载
# powerlevel10k主题
zinit ice depth=1; zinit light romkatv/powerlevel10k
# 命令补全
zinit ice as blockf
zinit light zsh-users/zsh-completions
# cd增加模糊匹配功能
# https://github.com/b4b4r07/enhancd
zinit ice lucid wait="1"
zinit light b4b4r07/enhancd
# 语法高亮
zinit light zdharma-continuum/fast-syntax-highlighting
# 虚拟文本提示
zinit light zsh-users/zsh-autosuggestions
# # zsh vi模式
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
# 替代C-r命令搜索
zinit ice lucid wait"0a" from"gh-r" as"program" atload'eval "$(mcfly init zsh)"' 
zinit light cantino/mcfly 

#p10k
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
 
# b4b4r07/enhancd配置
 export ENHANCD_FILTER="/usr/local/bin/peco:fzf:non-existing-filter"
 # cd..后不触发模糊匹配器
 export ENHANCD_DISABLE_DOT=1

# exa配置
alias es="exa -F" #更改别名

# mcfly配置
export MCFLY_KEY_SCHEME=vim # 使用vim 模式
export MCFLY_FUZZY=2 # 模糊搜索
# 根据系统匹配配色方案
if [[ "$(defaults read -g AppleInterfaceStyle 2&>/dev/null)" != "Dark" ]]; then
    export MCFLY_LIGHT=TRUE
fi
export MCFLY_INTERFACE_VIEW=BOTTOM #主题 TOP or BOTTOM

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 开启Arch局部中文环境
export LANGUAGE="zh_CN:UTF-8"

# PATH配置
# python
export PATH=$PATH:~/.local/bin

# cargo PATH (rust)
export PATH=$PATH:~/.cargo/bin

# fzf配置
#更改别名，使用tmux的浮窗效果
# alias fzf="fzf-tmux -p 80%,60%"
# 使用 fd ( https://github.com/sharkdp/fd )代替默认的 find
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# 使用 fd 生成目录完成的列表
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# 主题颜色
export FZF_DEFAULT_OPTS='--height 40% --layout reverse --info inline --border --preview "bat --style=numbers --color=always --line-range :500 {}" --color=bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'

#历史纪录条目数量
export HISTSIZE=10000
#注销后保存的历史纪录条目数量
export SAVEHIST=10000
#历史纪录文件
export HISTFILE=~/.histfile
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
#为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY      
#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
#在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_IGNORE_SPACE
# 不保留重复的历史记录项
setopt hist_ignore_all_dups
# 在命令前添加空格，不将此命令添加到记录文件中
setopt hist_ignore_space
# zsh 4.3.6 doesn't have this option
setopt hist_fcntl_lock 2>/dev/null
setopt hist_reduce_blanks
# 共享历史记录
setopt SHARE_HISTORY
