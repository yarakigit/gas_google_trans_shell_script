GAS_URL=`cat settings.json | jq '.gas_url'`
GAS_URL=`echo ${GAS_URL} | sed -e 's/\"//g'`

EG_TXT=$1
EG_TXT=`echo $EG_TXT | sed -e "s; ;%20;g"`
curl -L "$GAS_URL?trans=$EG_TXT&jp2eg=0&eg2jp=1" | sed -e 's/\[//g' | sed -e 's/\]//g' | jq '.string'