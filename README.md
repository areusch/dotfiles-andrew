dotfiles
========

This is a template repo for dotfiles. To be used with the chef
constitution_configured_user recipe, but can be used with other
sync methods. Run the sync script after a git pull to install
appropriate symlinks and hardlinks.

Three types of linkages can be created:

*   symlinked dot-directories: the symlink <code>$HOME/.x</code> -> <code>$HOME/.managed/dotdirs/x</code>, where <code>x</code> is a dir
*   symlinked dot-files: the symlink <code>$HOME/.x</code> -> <code>$HOME/.managed/dotfiles/x</code>
*   hardlinked dot-files: the hardlink <code>$HOME/.x</code> -> <code>$HOME/.managed/nolink/x</code>

When sync creates a symlink, it first checks if the dotfile exists; if it does, no action is taken
by default. However this can be changed using the .trample file as follows.

In each directory <code>$HOME/.managed/dot{dirs,files}</code> and <code>$HOME/.managed/nolink</code>, a file <code>.trample</code> can
be created. <code>.trample</code> contains a newline-delimited list of files that should overwrite any installed
files, no matter what. So for instance, if you always want to use your github-managed .bashrc, the
file <code>$HOME/.managed/dotfiles/.trample</code> should contain a line reading:

    bashrc

NOTE this will **delete** any .bashrc that exists previously!