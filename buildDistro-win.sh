#!/bin/bash
source ./common-win.sh

cd distro
zip -r ../$distro_name.zip $distro_name
cd ..
