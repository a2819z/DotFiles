echo "=============================================="
echo "                   Python                     "
echo "=============================================="

if [["$(which python3)" == "/usr/bin/python3"]]
then
    echo "Python is already installed"
else
    sudo pacman -S python3
fi

pip3 install --user virtualenv
