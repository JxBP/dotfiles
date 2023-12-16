# dotfiles

These are my personal [dotfiles](https://wiki.archlinux.org/title/Dotfiles).
I'm putting them on GitHub as backup and in case they might be helpful to you or somebody else.

# Using

You can either manually copy the files or snippets you want or use my [manage.pl](https://github.com/JxBP/dotfiles/blob/master/_manage/manage.pl.pl) script.
Using the script will require you to set the $DOTFILES environment variable to where you cloned this repository.
Then simply run this command with the dotfiles ("packages") you want to symlink them in the correct places.

```sh
perl manage.pl link [packages...]
```

You can find more documentation about the script in its comments.


# Important for Zsh

My manage.pl script by default links my Zsh configuration to $HOME/.config/zsh which requires the ZDOTDIR environment variable to be set to that directory.
You could use pam_env(8) for that.
