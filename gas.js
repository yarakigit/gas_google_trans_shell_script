function doGet(e) {
    const input_json_str = JSON.stringify(e);
    const input_json_obj = JSON.parse(input_json_str);
    //const trans_string = e.paramerter.trans;
    var trans = e.parameter.trans;
    var jp2eg = e.parameter.jp2eg;
    var eg2jp = e.parameter.eg2jp;
    var trans_out = null;
    if (jp2eg==1) {
      trans_out = LanguageApp.translate(trans,'','en');
    }
    if (eg2jp==1){
      trans_out = LanguageApp.translate(trans,'','ja');
    }
    var obj = [
          {string : trans_out }
    ]
    const json = JSON.stringify(obj);
    const type = ContentService.MimeType.JSON;
    return ContentService.createTextOutput(json).setMimeType(type);
  }