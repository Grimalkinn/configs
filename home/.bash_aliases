alias v="nvim +startinsert -u ~/github/configs/nvim/init.vim";
alias vinit="v ~/github/configs/nvim/init.vim";
alias valias="v ~/.bash_aliases; refresh";
alias vbashrc="v ~/.bashrc";

alias pictures="cd ~/Pictures";
alias videos="cd ~/Videos";
alias desktop="cd ~/Desktop";
alias documents="cd ~/Documents";
alias music="cd ~/Music";
alias downloads="cd ~/Downloads";
alias git="cd ~/github";

alias please="sudo apt";
alias fucking="sudo apt";

alias refresh="source ~/.bashrc";
alias search="apt search $1";
alias install="please install $1 -y";
alias depend="please --fix-broken install -y";
alias uninstall="fucking purge --auto-remove $1; apt clean";
alias fuckoff="uninstall $1";
alias backup="sudo timeshift --create --comment $1 --tags B";
alias backuplist="sudo timeshift --list";
alias restore="sudo timeshift --restore --snapshot '$1' --target /dev/nvme0n1p5";
alias restart="jah reboot";

alias plasma="kquitapp5 plasmashell && kstart5 plasmashell";
alias netflix="bash ~/scripts/notflix.sh $1";
alias csc="echo compile $1; echo run $2";

alias qwen2.5="ollama run qwen2.5vl:7b";
alias qwen3.5="ollama run qwen3.5:9b";
alias deepseekr1A="ollama run huihui_ai/deepseek-r1-abliterated:14b";

alias aria="aria2c $1"; alias get="aria";
alias ytd="~/tmp/ytd-venv/bin/yt-dlp";
alias ytm="ytd -P "~/Music/youtube" -x --audio-format mp3 $1";
alias ytv="ytd -P "~/Videos/youtube" $1";
alias ytpm="ytd -x --audio-format mp3 -o \"%(playlist_index)02d - %(title)s.%(ext)s\"";
alias ytpv="ytd -x --audio-format mp3 -o \"%(playlist_title)s/%(playlist_index)02d - %(title)s.%(ext)s\" $1";

alias open="xdg-open";
alias launch="python3 ~/scripts/launch.py $1 $2";
#alias launch="echo '#alias $1=\"$2\";' >> ~/.bash_aliases; refresh";
#alias =; printt pwd
#alias =""; wtf pwd
#alias ="";
#alias ="";








