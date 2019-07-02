echo "=============================================="
echo "                     zsh                      "
echo "=============================================="

if [[ "$(which zsh)" == "/usr/bin/zsh" ]]
then
    echo "Already Installed zsh"
else
    echo "Install zsh..."
    sudo pacman -S zsh --noconfirm
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

echo "Install zsh plugin..."
if [[ "$(which git)" != "/usr/bin/git" ]]
then
    echo "There is no Git. Install Git..."
    sudo pacman -S git --noconfirm
else
    git clone https://github.com/chrissicool/zsh-256color.git ${HOME}/.oh-my-zsh/plugins/zsh-256color
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting
    git clone https://github.com/changyuheng/zsh-interactive-cd.git ${HOME}/.oh-my-zsh/plugins/zsh-interactive-cd
    git clone https://github.com/djui/alias-tips.git ${HOME}/.oh-my-zsh/plugins/alias-tips

    # powerline fonts
    git clone https://github.com/powerline/fonts.git ${HOME}/fonts
    cd ${HOME}/fonts
    ./install.sh
    cd ..
    rm -rf fonts
fi
