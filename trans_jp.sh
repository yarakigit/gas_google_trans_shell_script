GAS_URL=`cat $HOME/.gas_google_trans_shell_script/settings.json | jq '.gas_url'`
GAS_URL=`echo ${GAS_URL} | sed -e 's/\"//g'`

JP_TXT=$1
JP_TXT=`echo "$JP_TXT" | nkf -WMQ | tr = %`
JP_TXT=`echo $JP_TXT | sed -e "s; ;%20;g"`
curl -L "$GAS_URL?trans=$JP_TXT&jp2eg=1&eg2jp=0" | sed -e 's/\[//g' | sed -e 's/\]//g' | jq '.string'