dotfiles
========

This is a template repo for dotfiles. To be used with the chef
constitution_configured_user recipe, but can be used with other
sync methods. Run the sync script after a git pull to install
appropriate symlinks and hardlinks.

Three types of linkages can be created:
 * symlinked dot-directories: the symlink $HOME/.x -> $HOME/.managed/dotdirs/x, where x is a dir
 * symlinked dot-files: the symlink $HOME/.x -> $HOME/.managed/dotfiles/x
 * hardlinked dot-files: the hardlink $HOME/.x -> $HOME/.managed/nolink/x

When sync creates a symlink, it first checks if the dotfile exists; if it does, no action is taken
by default. However this can be changed using the .trample file as follows.

In each directory $HOME/.managed/dot{dirs,files} and $HOME/.managed/nolink, a file .trample can
be created. .trample contains a newline-delimited list of files that should overwrite any installed
files, no matter what. So for instance, if you always want to use your github-managed .bashrc, the
file $HOME/.managed/dotfiles/.trample should contain a line reading:

bashrc

NOTE this will *delete* any .bashrc that exists previously!