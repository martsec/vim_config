# Vim configuration

Features:
* File storage viewer (`nerdtree`)
* Spell check for English in text documents (md, asciidoc, text...)
* Better Status lines and buffer/tabs information (`vim-airline`)
* IDE like features
  * Workspace features (`vim-ctrlspace`)
  * Python auto completion (`coc-vim` + `coc-python`) 
  * Linting with `flake8` (`ale`)
  * Fixing python code using `black` when saving file (`ale`)
  * Class outline viewer (`preservim/tagbar`)
  * Git branch showing and use `:G` to execute git commands (`fugitive`)
  * Possibility to set vim configurations at project level using `.editorconfig` files

# Vim config install

```
git clone https://github.com/martsec/vim_config.git ~/.vim

mkdir ~/.vim/swp ~/.vim/undodir ~/.vim/thesaurus ~/.vim/autoload
ln -s $HOME/.vim/.vimrc $HOME/.vimrc

# Install the plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the thesaurus 
wget https://raw.githubusercontent.com/zeke/moby/master/words.txt -O ~/.vim/thesaurus/moby_thesaurus.txt

# Install coc dependencies (code completion + IDE like features)
curl -sL install-node.now.sh/lts | sudo bash

sudo apt-get update
sudo apt-get install fonts-powerline

# generates an index (or tag) file of classes, objects...
sudo apt install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev
git clone https://github.com/universal-ctags/ctags.git && cd ctags
./autogen.sh
mkdir ~/.vim/libs
./configure #--prefix=/where/you/want # defaults to /usr/local
make
sudo make install # may require extra privileges depending on where to install

# Asciidoctor
sudo apt-get install -y asciidoctor default-jdk
sudo gem install asciidoctor-pdf
sudo gem install asciidoctor-diagram


vim +PlugInstall +q +q


vim +'CocInstall coc-json coc-tsserver'
vim +'CocInstall coc-pyright'
```


If you are using WSL please install all powerline fonts on windows and select it as the terminal font. See https://github.com/vim-airline/vim-airline/wiki/Dummies-Guide-to-the-status-bar-symbols-(Powerline-fonts)-on-Fedora,-Ubuntu-and-Windows#handling-the-delicate-flower-of-windows and https://stackoverflow.com/a/63148518/5375579

Example commands (NOTE: `<leader>` is currently `,` and `<CR>` is enter key)

* Code of completion
  * `gd` go to definition
  * `gr` find references
  * `K` show documentation
  * `<leader>rn` rename
* Comment
  * `gcc` toggle line comment (normal mode)
  * `gc` toggle comment (visual mode)
* File explorer (NERDTree):
  * `s` open file in vertical split
  * `ì` open file in split
  * `t` open in new tab
  * Select the desired directory, press `m` (NERDTree menu) and then a `a` to create new file. End it with `/` to create a directory instead
  * 
* Async executions via `tpope/vim-dispatch`
* Use `:Dispatch cmd` to run a non blocking window a commands
* Then use `:Copen` to open it

* Workspace ([vim-ctrlspace](https://awesomeopensource.com/project/yehuohan/vim-ctrlspace))
  * `Ctrl`+ `space bar` open menu (base)
  * `w` to show workspaces
  *

* Buffers (`#` indicates buffer number)
  * `:buffers` to list them
  * `:b#` go to buffer #
  * `:bd` close current buffer
  * `:bd#` close buffer #
  * `:vs|b#` or `:sp|b#` open buffer in split window
  *

* Window (split) management 
  * `Ctrl+H` left
  * `Ctrl+J` down
  * `Ctrl+K` up
  * `Ctrl+L` right
  * `Ctrl+W` `q` to close the window you are at
  * `Ctrl+W` `o` to focus on that split (closes all others)
  * `ctrl+W` `_` Max out the height of the current split
  * `ctrl+W` `|` Max out the width of the current split
  * `ctrl+W` `=` Normalize all split sizes, which is very handy when resizing terminal
  * `Ctrl+W` `R` Swap top/bottom or left/right split
  * `Ctrl+W` `T` Break out current window into a new tabview
  * `Ctrl+W` `o` lose every window in the current tabview but the current one  
  * `ctrl+W` `_` Max out the height of the current split
  * `Ctrl+W` `R` Swap top/bottom or left/right split
  * `Ctrl+W` `T` Break out current window into a new tabview
  * `Ctrl+W` `o` lose every window in the current tabview but the current one

* Documentation (asciidoctor):
  * Compiles as HTML when saved
  * `<leader>ch` to  manually compile to html
  * `<leader>cp` to compile to pdf
  * `<leader>b` to *bold* selected text (in visual mode)
  * `<leader>i` to _italics_ selected text (in visual mode)


Extra:
https://stackoverflow.com/questions/5400806/what-are-the-most-used-vim-commands-keypresses/5400978#5400978
https://www.vimfromscratch.com/articles/vim-for-python
https://github.com/rapphil/vim-python-ide
https://github.com/vim-ctrlspace/vim-ctrlspace


https://github.com/dense-analysis/ale
