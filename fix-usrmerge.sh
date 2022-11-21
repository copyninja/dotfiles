#!/bin/bash

set -o pipefail

convert_bin_sbin() {
    failed=$(sudo /usr/lib/usrmerge/convert-usrmerge 2>&1 | grep Both |sed -nE 's|.*(/usr/s?bin/.*) exist.|\1|p')
    while [[ "$?" -ne 0 ]]; do
        dpkg -S "$failed"
        echo "remove $failed"
        read remove
        if [[ "$remove" == "y" ]]; then
            echo "Removing $failed"
            sudo rm -f "$failed"
        fi
        failed=$(sudo /usr/lib/usrmerge/convert-usrmerge 2>&1 | grep Both |sed -nE 's|.*(/usr/s?bin/.*) exist.|\1|p')
    done
}

convert_lib_udev() {
    failed=$(sudo /usr/lib/usrmerge/convert-usrmerge 2>&1 | grep Both |sed -nE 's|.*(/usr/lib/.*) exist.|\1|p')
    while [[ "$?" -ne 0 ]]; do
        dpkg -S "$failed"
        echo "remove $failed"
        read remove
        if [[ "$remove" == "y" ]]; then
            echo "Removing $failed"
            sudo rm -f "$failed"
        fi
        failed=$(sudo /usr/lib/usrmerge/convert-usrmerge 2>&1 | grep Both |sed -nE 's|.*(/usr/lib/.*) exist.|\1|p')
    done
}

convert_lib_udev
