# dotvim
My .vim configuration.


I got tired of copying my .vim files around and found this wonderful idea [here] (http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/).

# How To:

> git clone https://github.com/joaopalotti/dotvim.git .vimrc
> cd ~/.vim
> git submodule init
> git submodule update
> git submodule foreach git pull origin master

After that, go to ~/.vim/bundle/YouCompleteMe, and install it:
> python install.py

Enjoy!

