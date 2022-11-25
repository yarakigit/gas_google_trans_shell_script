import requests
import json
import re

def main():
    json_file= open('settings.json', 'r')
    json_obj = json.load(json_file)
    gas_url = json_obj['gas_url']

    # Eng sample
    sample_eg = "This is a pen"
    re.sub('\s+', '%20', sample_eg)
    API_REQUEST_URL = "{GAS_URL}?trans={TXT}&jp2eg={JP2EG}&eg2jp={EG2JP}".format(GAS_URL=gas_url, TXT=sample_eg, JP2EG=0, EG2JP=1)
    ## txt2json
    response_api = requests.get(API_REQUEST_URL)
    print(txt2json(response_api))

    # JP sample
    sample_jp = "これはペンです"
    sample_jp= str(sample_jp.encode())#encode ascii
    sample_jp = sample_jp.replace("\\x","%").replace("x","").replace("b\'","").replace("\'","")
    re.sub('\s+', '%20', sample_jp)
    API_REQUEST_URL = "{GAS_URL}?trans={TXT}&jp2eg={JP2EG}&eg2jp={EG2JP}".format(GAS_URL=gas_url, TXT=sample_jp, JP2EG=1, EG2JP=0)
    ## txt2json
    response_api = requests.get(API_REQUEST_URL)
    print(txt2json(response_api))

def txt2json(response_api):
    response_api_json = json.loads(response_api.text[1:-1])
    return response_api_json['string']

if __name__ == "__main__":
    main()