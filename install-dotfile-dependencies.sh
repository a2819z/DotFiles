# install dotfile dependencies for manjaro linux

echo -n "Installing Pacman packages...\n"
sudo pacman -Syy --noconfirm && sudo pacman -Syu --noconfirm
sudo pacman -S yay curl stow vim tmux htop cmake zsh --noconfirm
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
echo -n "Done.\n"

echo -n "Installing sub packages...\n"
sudo yay -S discord google-chrome okular fzf cppcheck uim
echo -n "Done.\n"

echo -n "clone Vundle to ${HOME}/.vim/bundle/Vundle.vim...\n"
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
echo -n "Done.\n"

echo -n "Clone zsh plugins...\n"
git clone https://github.com/chrissicool/zsh-256color.git ${HOME}/.oh-my-zsh/plugins/zsh-256color
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/changyuheng/zsh-interactive-cd.git ${HOME}/.oh-my-zsh/plugins/zsh-interactive-cd
git clone https://github.com/djui/alias-tips.git ${HOME}/.oh-my-zsh/plugins/alias-tips
echo -n "Done.\n"

echo -n "Installing powerline fonts...\n"
git clone https://github.com/powerline/fonts.git ${HOME}/fonts
cd ${HOME}/fonts
./install.sh
cd ..
rm -rf fonts
echo -n "Done\n"

echo -n "Set korean keyboard based uim...\n"
$ xmodmap -e 'remove mod1 = Alt_R'
$ xmodmap -e 'keycode 108 = Hangul'

$ xmodmap -e 'remove control = Control_R'
$ xmodmap -e 'keycode 105 = Hangul_Hanja'

$ xmodmap -pke > ~/.Xmodmap
echo -n "Done.\n"
