echo "=============================================="
echo "                      Vim                     "
echo "=============================================="

if [[ "$(which vim)" == "/usr/bin/vim" ]]
then
    echo "Already Installed Vim"
else
    echo "Install Vim..."
    sudo apt install vim --noconfirm
fi

echo "Install Vim Plugin..."
if [[ "$(which git)" != "/usr/bin/git" ]]
then
    echo "There is no Git. Install Git..."
    sudo apt install git --noconfirm
else
    sudo git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

echo "YCM Compile..."
cd ${HOME}/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clangd-completer

# symbolic link ycm_conf
ln -sf ${PWD}/vim/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
