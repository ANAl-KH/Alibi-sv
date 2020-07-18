class Dotdata {
  int fee;
  String orderid;
  String txid;
  Dotdata({this.fee, this.orderid, this.txid});
  factory Dotdata.fromJson(Map<String, dynamic> json) {
    return Dotdata(
        fee: json['fee'], orderid: json['order_id'], txid: json['tx_id']);
  }
}

class Dotres {
  int code;
  String msg;
  Dotdata data;
  Dotres({this.code, this.msg, this.data});
  factory Dotres.fromJsom(Map<String, dynamic> parsedJson) {
    return Dotres(
        code: parsedJson['code'],
        msg: parsedJson['msg'],
        data: Dotdata.fromJson(parsedJson['data']));
  }
}
