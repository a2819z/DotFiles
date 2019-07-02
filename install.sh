# install dotfile dependencies for manjaro linux
# using xfce

sudo pacman -Syy --noconfirm && sudo pacman -Syu --noconfirm
sudo pacman -S yay curl vim tmux htop cmake zsh --noconfirm

echo -n "Installing sub packages...\n"
sudo yay -S discord google-chrome okular fzf cppcheck uim gitkracken clang
echo -n "Done.\n"

# Python install
source ${PWD}/python/setting.sh

# Vim install
source ${PWD}/vim/setting.sh
ln -sf ${PWD}/vim/.vimrc ~/.vimrc

# Zsh install
source ${PWD}/zsh/setting.sh
ln -sf ${PWD}/zsh/.zshrc ~/.zshrc

echo -n "Set korean keyboard based uim...\n"
xmodmap -e 'remove mod1 = Alt_R'
xmodmap -e 'keycode 108 = Hangul'

xmodmap -e 'remove control = Control_R'
xmodmap -e 'keycode 105 = Hangul_Hanja'

xmodmap -pke > ~/.Xmodmap
echo -n "Done.\n"

echo -n "Installing terminal colorschemes"
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git ${HOME}/iTerm2-Color-Schemes
if [ ! -d "${HOME}/.local/share/xfce4/terminal" ]; then
    mkdir ${HOME}/.local/share/xfce4 && mkdir ${HOME}/.local/share/xfce4/terminal
fi
cp ${HOME}/iTerm2-Color-Schemes/xfce4termianl/colorschemes ~/.local/share/xfce4/termianl
rm -rf ${HOME}/iTerm2-Color-Schemes
