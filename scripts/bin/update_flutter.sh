#!/bin/sh

FLUTTER_PACKAGE="flutter-beta"

yay -S --force "${FLUTTER_PACKAGE}"
sudo chown -R :flutterusers /opt/flutter
sudo chmod -R g+w /opt/flutter
