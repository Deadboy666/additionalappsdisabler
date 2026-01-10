#!/usr/bin/env bash
set -eu

SLSsteamConfigDir=$HOME/.config/SLSsteam
FlatpakSLSsteamConfigDir=$HOME/.var/app/com.valvesoftware.Steam/.config/SLSsteam

    whereSLSsteamconfig(){
            if [ -d "$FlatpakSLSsteamConfigDir" ]; then
                mkdir -p $FlatpakSLSsteamConfigDir
                cd $FlatpakSLSsteamConfigDir/
            else
                    mkdir -p $SLSsteamConfigDir
                    cd $SLSsteamConfigDir/
                fi
                    echo "" &> /dev/null
                }

    openSLSsteamConfigDir(){
            if [ -d "$FlatpakSLSsteamConfigDir" ]; then
                xdg-open $FlatpakSLSsteamConfigDir/ &> /dev/null
            else
                    xdg-open $SLSsteamConfigDir/ &> /dev/null
                fi
                    echo "" &> /dev/null
                }

    sedadditionalapps(){
        whereSLSsteamconfig
        sed -i "s/^ - $appid.*/# - $appid/" config.yaml
        sed -i "s/\\\$appid/$appid/" config.yaml
        }

    enterappid(){
        read -rp "Enter AppID: " appid
        sedadditionalapps
        echo "$appid is commented out now we will now go to the directory of the config.yaml"
        echo "So You can Remove the Lines That Are Like This # - $appid"
        echo "Once Thats Done You Can Save and Exit The File In Your Pefered Text Editor"
        openSLSsteamConfigDir
        }

    enterappid
