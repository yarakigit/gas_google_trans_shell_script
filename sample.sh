GAS_URL=`cat settings.json | jq '.gas_url'`
GAS_URL=`echo ${GAS_URL} | sed -e 's/\"//g'`

# Eng2Jp sample
EG_TXT="This is GAS Application"
EG_TXT=`echo $EG_TXT | sed -e "s; ;%20;g"`
curl -L "$GAS_URL?trans=$EG_TXT&jp2eg=0&eg2jp=1" | jq

# Jp2Eng sample
JP_TXT="これは鉛筆です"
JP_TXT=`echo "$JP_TXT" | nkf -WMQ | tr = %`
curl -L "$GAS_URL?trans=$JP_TXT&jp2eg=1&eg2jp=0" | jq