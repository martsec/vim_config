# Vim config install

```
git clone https://github.com/martsec/vim_config.git ~/.vim

mkdir ~/.vim/swp ~/.vim/undodir ~/.vim/thesaurus ~/.vim/autoload
ln -s $HOME/.vim/.vimrc $HOME/.vimrc

# Install the plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the thesaurus 
wget https://raw.githubusercontent.com/zeke/moby/master/words.txt -O ~/.vim/thesaurus/moby_thesaurus.txt


vim +PlugInstall +q +q
```
