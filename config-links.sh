#! /bin/sh

declare -A arr

if ( ! test -d ~/.vim); then
  printf "Creating ~/.vim directory."
  mkdir ~/.vim
fi

#arr["fish/config.fish"]=~/.config/fish/config.fish
arr[".zshrc"]=~/.zshrc
arr["alacritty/alacritty.yml"]=~/.config/alacritty/alacritty.yml
arr["kitty.conf"]=~/.config/kitty/kitty.conf
arr[".vimrc"]=~/.vimrc
arr["vim/plug.vim"]=~/.vim/plug.vim
arr["vim/plugins"]=~/.vim/plugins
arr["vim/coc-settings.json"]=~/.config/nvim/coc-settings.json
arr[".tmux.conf"]=~/.tmux.conf

for from in "${!arr[@]}"
do
  to=${arr[$from]}
  if ( ! test -L $to ); then
    printf "Creating link: %s\n" "${to}"
    ln -s $PWD/$from $to
  fi
done
