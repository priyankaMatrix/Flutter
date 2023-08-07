/// responseData : {"customerId":"15","networkId":"18","category":"Wheels /\ntires","lockNumber":"6666","remarks":"Test"}
/// responseStatus : {"STATUS":"SUCCESS","MESSAGE":"Thank you for reporting a\ndamage on the bike. Our technical team will inspect the bike. If you have a question about a ride, please contact our\ncustomer service.","STATUSCODE":"200"}
/// extraData : []

class TicketModel {
  TicketModel({
      ResponseData? responseData, 
      ResponseStatus? responseStatus, 
      List<dynamic>? extraData,}){
    _responseData = responseData;
    _responseStatus = responseStatus;
    _extraData = extraData;
}

  TicketModel.fromJson(dynamic json) {
    _responseData = json['responseData'] != null ? ResponseData.fromJson(json['responseData']) : null;
    _responseStatus = json['responseStatus'] != null ? ResponseStatus.fromJson(json['responseStatus']) : null;
    if (json['extraData'] != null) {
      _extraData = [];
      // json['extraData'].forEach((v) {
      //   _extraData?.add(Dynamic.fromJson(v));
      // });
    }
  }
  ResponseData? _responseData;
  ResponseStatus? _responseStatus;
  List<dynamic>? _extraData;
TicketModel copyWith({  ResponseData? responseData,
  ResponseStatus? responseStatus,
  List<dynamic>? extraData,
}) => TicketModel(  responseData: responseData ?? _responseData,
  responseStatus: responseStatus ?? _responseStatus,
  extraData: extraData ?? _extraData,
);
  ResponseData? get responseData => _responseData;
  ResponseStatus? get responseStatus => _responseStatus;
  List<dynamic>? get extraData => _extraData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_responseData != null) {
      map['responseData'] = _responseData?.toJson();
    }
    if (_responseStatus != null) {
      map['responseStatus'] = _responseStatus?.toJson();
    }
    if (_extraData != null) {
      map['extraData'] = _extraData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// STATUS : "SUCCESS"
/// MESSAGE : "Thank you for reporting a\ndamage on the bike. Our technical team will inspect the bike. If you have a question about a ride, please contact our\ncustomer service."
/// STATUSCODE : "200"

class ResponseStatus {
  ResponseStatus({
      String? status, 
      String? message, 
      String? statuscode,}){
    _status = status;
    _message = message;
    _statuscode = statuscode;
}

  ResponseStatus.fromJson(dynamic json) {
    _status = json['STATUS'];
    _message = json['MESSAGE'];
    _statuscode = json['STATUSCODE'];
  }
  String? _status;
  String? _message;
  String? _statuscode;
ResponseStatus copyWith({  String? status,
  String? message,
  String? statuscode,
}) => ResponseStatus(  status: status ?? _status,
  message: message ?? _message,
  statuscode: statuscode ?? _statuscode,
);
  String? get status => _status;
  String? get message => _message;
  String? get statuscode => _statuscode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['STATUS'] = _status;
    map['MESSAGE'] = _message;
    map['STATUSCODE'] = _statuscode;
    return map;
  }

}

/// customerId : "15"
/// networkId : "18"
/// category : "Wheels /\ntires"
/// lockNumber : "6666"
/// remarks : "Test"

class ResponseData {
  ResponseData({
      String? customerId, 
      String? networkId, 
      String? category, 
      String? lockNumber, 
      String? remarks,}){
    _customerId = customerId;
    _networkId = networkId;
    _category = category;
    _lockNumber = lockNumber;
    _remarks = remarks;
}

  ResponseData.fromJson(dynamic json) {
    _customerId = json['customerId'];
    _networkId = json['networkId'];
    _category = json['category'];
    _lockNumber = json['lockNumber'];
    _remarks = json['remarks'];
  }
  String? _customerId;
  String? _networkId;
  String? _category;
  String? _lockNumber;
  String? _remarks;
ResponseData copyWith({  String? customerId,
  String? networkId,
  String? category,
  String? lockNumber,
  String? remarks,
}) => ResponseData(  customerId: customerId ?? _customerId,
  networkId: networkId ?? _networkId,
  category: category ?? _category,
  lockNumber: lockNumber ?? _lockNumber,
  remarks: remarks ?? _remarks,
);
  String? get customerId => _customerId;
  String? get networkId => _networkId;
  String? get category => _category;
  String? get lockNumber => _lockNumber;
  String? get remarks => _remarks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = _customerId;
    map['networkId'] = _networkId;
    map['category'] = _category;
    map['lockNumber'] = _lockNumber;
    map['remarks'] = _remarks;
    return map;
  }

}