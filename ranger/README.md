## Instalation

Run install script:

    ./install.sh

For ubuntu 18.03 (and older), install a newer version (>v1.9.0):

    wget https://ubuntu.pkgs.org/20.04/ubuntu-universe-amd64/ranger_1.9.3-1build1_all.deb.html
    sudo dpkg -i ranger_1.9.3-1build1_all.deb

Alternately, use the package manager of your operating system to install ranger. You can also install ranger through PyPI: `pip install ranger-fm`. But `apt` is recommended.

## Preview formats

* Images: https://github.com/ranger/ranger/wiki/Image-Previews
    - Try with `w3mimgdisplay` (working). You might need to create a symbolic link:

      `sudo ln -s /usr/lib/w3m/w3mimgdisplay /usr/bin`

    - Try with `ueberzug` (this could work with `tmux`, I haven't managed yet):

       `pip3 install ueberzug pillow-simd`

* PDF: https://unix.stackexchange.com/questions/407116/preview-pdf-as-image-in-ranger

  v1.9.0 has it already:
  https://github.com/vifon/ranger/blob/ab8fd9e8256a1a6c296934af6ffb77bd34671bb2/ranger/data/scope.sh

* Markdown: https://www.bfoliver.com/2015/05/18/markdowninranger/

* Bat support for code highlighting: https://github.com/ranger/ranger/commit/1fded77e8d2cfe7d7e1d1a41677708dd8f67da56

Other:

  * isene/LS_COLORS: https://github.com/isene/LS_COLORS

        mkdir -p ~/.config/ranger/colorschemes
        cd ~/.config/ranger/colorschemes
        wget https://raw.githubusercontent.com/isene/LS_COLORS/master/ranger/isene.py

        mkdir -p ~/.config/ranger/plugins
        cd ~/.config/ranger/plugins
        wget https://raw.githubusercontent.com/isene/LS_COLORS/master/ranger/plugin_linemode.py

Add these lines to rc.conf:

        set colorscheme isene
        default_linemode classify

  * ranger_devicons: https://github.com/alexanderjeurissen/ranger_devicons

        git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
        echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

* colorscheme: http://dotshare.it/dots/8298/
