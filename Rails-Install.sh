#!/bin/bash

set -e

echo "Updating and installing packages. Give your password when asked."
sudo pacman -Sy --noconfirm  curl libyaml

echo "Installing RVM (Ruby Version Manager) for handling Ruby installation"
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "Installing Ruby"
rvm install 3.0.1
rvm use 3.0.1 --default

rvm rubygems current

gem install bundler
gem install rails

# Make sure RVM, Ruby and Rails are on the user's path
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
set +e
source ~/.bashrc
set -e

echo "Versions of stufs installed ᕙ( • ‿ • )ᕗ"
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-10 | xargs echo
echo -n "Ruby: "
ruby -v | cut -d " " -f 2
rails -v
echo -e "\n- - - - - -\n"

echo "Congrats you have installed ruby along with the rails framework (✿^‿^)"
