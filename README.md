# Vim config install

```
git clone https://github.com/martsec/vim_config.git ./.vim
mkdir .vim .vim/swp .vim/undodir
ln -s .vim/.vimrc .vimrc
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
