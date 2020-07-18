//解析打点钱包接口返回的json所需要的类
/*打点钱包返回的json示例：
{
    "code": 0,
    "msg": "ok (Req-Id:5f779582-4027-f6c9-3a68-79deb15f30d8)",
    "data": {
        "fee": 134,
        "order_id": "31edd664-d8da-4b30-881d-37a282ac6059",
        "tx_id": "9cd7c669a257f65f16ed2499e3960dbbf8cb3cae2c17c9384549c0b97686693e"
    }
}*/
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
