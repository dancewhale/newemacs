#!/bin/bash

git clone --depth=1 -b master https://github.com/emacs-eaf/emacs-application-framework.git ~/.emacs.d/.local/emacs-application-framework/ || true

cd  ~/.emacs.d/.local/emacs-application-framework
chmod +x install-eaf.py
./install-eaf.py

