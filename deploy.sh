function install_font {
    mkdir -p "${HOME}/.local/share/fonts/"
    curl -OL https://github.com/be5invis/Iosevka/releases/download/v34.6.3/PkgTTC-Iosevka-34.6.3.zip
    unzip PkgTTC-Iosevka-34.6.3.zip -d "${HOME}/.local/share/fonts/iosevka/"
    fc-cache
}

for i in $(find . -maxdepth 1 -type d); do

    if [[ "$i" == "./.git" ]]; then
	continue
    fi
    
    mkdir -p "${HOME}/.config/${i}"
    ln -s "$(pwd)/${i}" "${HOME}/.config/${i}"
done

ln -s "$(pwd)/.tmux.conf" "${HOME}/.tmux.conf"

install_font
