@echoff
title Assistant Setup
pause 6s
echo --------------------
echo "Please wait...."
pause 5s
mkdir $HOME$/.local/shared/themes/HybridAero
cp ./ $HOME$/.local/shared/themes/HybridAero
echo  "Parch..."
sudo apt install picom
cp ./parch/picom.conf $HOME$/.local/shared/
echo "Please wait close session"
exit