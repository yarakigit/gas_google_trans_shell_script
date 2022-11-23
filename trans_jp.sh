GAS_URL=`cat settings.json | jq '.gas_url'`
GAS_URL=`echo ${GAS_URL} | sed -e 's/\"//g'`

JP_TXT=$1
JP_TXT=`echo "$JP_TXT" | nkf -WMQ | tr = %`
curl -L "$GAS_URL?trans=$JP_TXT&jp2eg=1&eg2jp=0" | sed -e 's/\[//g' | sed -e 's/\]//g' | jq '.string'