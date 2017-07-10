# vim-profile
#### My VIM profile including .vimrc and associated settings. Used on an Ubuntu system with ZSH.
#### Usage:
* Clone the repo and move 'vim-profile' directory to be your '/home/<user>/.vim' directory. Such as (assuming you already are in your HOME directory):
    * ``mv vim-profile .vim``
* You will also need to 'symlink' the '.vimrc' file to your root HOME directory:
    * ``ln -s /home/<user>/.vim/.vimrc /home/<user>/.vimrc``
* Set the new '.vimrc' as the 'source' to use in your terminal session:
    * ``source ~/.vimrc``
