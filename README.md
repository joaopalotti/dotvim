# dotvim
My .vim configuration.


I got tired of copying my .vim files around and found this wonderful idea [here] (http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/).

# How To:

``` bash
git clone https://github.com/joaopalotti/dotvim.git .vim
cd ~/.vim
git submodule init
git submodule update --init --recursiv
git submodule foreach git pull origin master
```

After that, go to ~/.vim/bundle/YouCompleteMe, and install it:
``` bash
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```
Enjoy!


# ToDo

Check if it is worth using YouCompleteMe
