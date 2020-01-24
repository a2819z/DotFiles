echo "=============================================="
echo "                   NeoVim                     "
echo "=============================================="

if [[ "$(which nvim)" == "/usr/local/bin/nvim" ]]
then
    echo "Already Installed NeoVim"
else
    echo "Install Vim..."
    sudo apt -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

    if [[ "$(which git)" != "/usr/bin/git" ]]
    then
        echo "There is no Git. Install Git..."
        sudo apt -y install git 
    fi

    git clone https://github.com/neovim/neovim.git
    cd neovim
    make -j4
    sudo make install
fi

echo "Install NeoVim Plugin Pre-requirements..."
sudo apt -y install curl node

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/

nvim -c "PluginInstall" +qall
nvim -c "CocInstall coc-python coc-json coc-snippets|q"
