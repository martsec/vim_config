my Vim config files
===================

::

  mv ~/.vim ~/.vim.old
  git clone https://github.com/martsec/vim_config.git
  cd ~/.vim
  git submodule init
  git submodule update
  cd ~/
  ln -s .vim/.vimrc .


