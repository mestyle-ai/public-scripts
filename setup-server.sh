#!/bin/bash

echo 'Install neovim'
sudo apt-get -y install neovim

echo 'Setup nvim and tmux'
cp ./.tmux.conf ~
cp ./init.vim ~/.config/nvim/


echo 'Install git lfs'
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get -y install git-lfs
git lfs install

echo 'Change directory to home'
cd ~

echo '[MUSE] Download pretrained files'
git clone https://huggingface.co/theeraphola/StyleDrop


echo '[StyleDrop] Clone StyleDrop code'
git clone https://github.com/mestyle-ai/StyleDrop-PyTorch.git

echo 'Prepare muse files in StyleDrop'
cp -rf ~/StyleDrop/assets/* ~/StyleDrop-PyTorch/assets/

