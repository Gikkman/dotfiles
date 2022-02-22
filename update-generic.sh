##################################################
# Platform independent installs                  #
# These will RUN AFTER platform specifc installs #
##################################################

# Install oh-my-zsh and plugins
if ! $(${DOTDIR}/util/is-installed.sh zsh); then
    echo Installing oh-my-zh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/romkatv/powerlevel10k.git ${$ZSH_CUSTOM-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo Oh-My-Zsh already installed
fi