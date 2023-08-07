/// responseData : [{"id":4831,"name":"RPI Classic + product","companyName":"RPI classic +","validFrom":"04 Jul 23, 12:10 PM","validTo":"16 Jul 23, 12:10 PM","occasionalCode":"330837","noOfCards":0,"subscriptionType":"Regular","displaySubscriptionType":"Annual sub","isExpired":null,"status":"Active","displayStatus":"Active","isRenewable":"N","productId":333,"parentNetworkId":25,"totalPurchased":0,"noOfCompanyCardsIssued":1,"alreadyIssued":1,"isBuyable":"N","maxCards":1,"noOfCardsCanBePurchased":0,"alreadyIssuedOrPurchased":1},{"id":4593,"name":"National Classic","companyName":"","validFrom":"03 May 23, 01:30 PM","validTo":"02 May 24, 01:30 PM","occasionalCode":"45413900","noOfCards":0,"subscriptionType":"Regular","displaySubscriptionType":"Annual sub","isExpired":null,"status":"Active","displayStatus":"Active","isRenewable":"N","productId":318,"parentNetworkId":18,"totalPurchased":0,"noOfCompanyCardsIssued":0,"alreadyIssued":0,"isBuyable":"Y","maxCards":1,"noOfCardsCanBePurchased":1,"alreadyIssuedOrPurchased":0},{"id":4581,"name":"RPI Classic + product","companyName":"RPI classic +","validFrom":"25 Apr 23, 09:34 AM","validTo":"07 May 23, 09:34 AM","occasionalCode":"279733","noOfCards":0,"subscriptionType":"Regular","displaySubscriptionType":"Annual sub","isExpired":null,"status":"Expired","displayStatus":"Expired","isRenewable":"N","productId":333,"parentNetworkId":25,"totalPurchased":0,"noOfCompanyCardsIssued":0,"alreadyIssued":0,"isBuyable":"N","maxCards":1,"noOfCardsCanBePurchased":1,"alreadyIssuedOrPurchased":0},{"id":4580,"name":"RPI Classic product","companyName":"RPI classic","validFrom":"25 Apr 23, 09:19 AM","validTo":"07 May 23, 09:19 AM","occasionalCode":"712037","noOfCards":0,"subscriptionType":"Regular","displaySubscriptionType":"Annual sub","isExpired":null,"status":"Expired","displayStatus":"Expired","isRenewable":"N","productId":332,"parentNetworkId":25,"totalPurchased":0,"noOfCompanyCardsIssued":0,"alreadyIssued":0,"isBuyable":"N","maxCards":1,"noOfCardsCanBePurchased":1,"alreadyIssuedOrPurchased":0}]
/// responseStatus : {"STATUS":"SUCCESS","MESSAGE":"Query successful","STATUSCODE":"200"}
/// extraData : []

class MySubscriptionListModel {
  MySubscriptionListModel({
      List<ResponseData>? responseData, 
      ResponseStatus? responseStatus, 
      List<dynamic>? extraData,}){
    _responseData = responseData;
    _responseStatus = responseStatus;
    _extraData = extraData;
}

  MySubscriptionListModel.fromJson(dynamic json) {
    if (json['responseData'] != null) {
      _responseData = [];
      json['responseData'].forEach((v) {
        _responseData?.add(ResponseData.fromJson(v));
      });
    }
    _responseStatus = json['responseStatus'] != null ? ResponseStatus.fromJson(json['responseStatus']) : null;
    if (json['extraData'] != null) {
      _extraData = [];
      // json['extraData'].forEach((v) {
      //   _extraData?.add(ExtraData.fromJson(v));
      // }
      // );
    }
  }
  List<ResponseData>? _responseData;
  ResponseStatus? _responseStatus;
  List<dynamic>? _extraData;
MySubscriptionListModel copyWith({  List<ResponseData>? responseData,
  ResponseStatus? responseStatus,
  List<dynamic>? extraData,
}) => MySubscriptionListModel(  responseData: responseData ?? _responseData,
  responseStatus: responseStatus ?? _responseStatus,
  extraData: extraData ?? _extraData,
);
  List<ResponseData>? get responseData => _responseData;
  ResponseStatus? get responseStatus => _responseStatus;
  List<dynamic>? get extraData => _extraData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_responseData != null) {
      map['responseData'] = _responseData?.map((v) => v.toJson()).toList();
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
/// MESSAGE : "Query successful"
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

/// id : 4831
/// name : "RPI Classic + product"
/// companyName : "RPI classic +"
/// validFrom : "04 Jul 23, 12:10 PM"
/// validTo : "16 Jul 23, 12:10 PM"
/// occasionalCode : "330837"
/// noOfCards : 0
/// subscriptionType : "Regular"
/// displaySubscriptionType : "Annual sub"
/// isExpired : null
/// status : "Active"
/// displayStatus : "Active"
/// isRenewable : "N"
/// productId : 333
/// parentNetworkId : 25
/// totalPurchased : 0
/// noOfCompanyCardsIssued : 1
/// alreadyIssued : 1
/// isBuyable : "N"
/// maxCards : 1
/// noOfCardsCanBePurchased : 0
/// alreadyIssuedOrPurchased : 1

class ResponseData {
  ResponseData({
      num? id, 
      String? name, 
      String? companyName, 
      String? validFrom, 
      String? validTo, 
      String? occasionalCode, 
      num? noOfCards, 
      String? subscriptionType, 
      String? displaySubscriptionType, 
      dynamic isExpired, 
      String? status, 
      String? displayStatus, 
      String? isRenewable, 
      num? productId, 
      num? parentNetworkId, 
      num? totalPurchased, 
      num? noOfCompanyCardsIssued, 
      num? alreadyIssued, 
      String? isBuyable, 
      num? maxCards, 
      num? noOfCardsCanBePurchased, 
      num? alreadyIssuedOrPurchased,}){
    _id = id;
    _name = name;
    _companyName = companyName;
    _validFrom = validFrom;
    _validTo = validTo;
    _occasionalCode = occasionalCode;
    _noOfCards = noOfCards;
    _subscriptionType = subscriptionType;
    _displaySubscriptionType = displaySubscriptionType;
    _isExpired = isExpired;
    _status = status;
    _displayStatus = displayStatus;
    _isRenewable = isRenewable;
    _productId = productId;
    _parentNetworkId = parentNetworkId;
    _totalPurchased = totalPurchased;
    _noOfCompanyCardsIssued = noOfCompanyCardsIssued;
    _alreadyIssued = alreadyIssued;
    _isBuyable = isBuyable;
    _maxCards = maxCards;
    _noOfCardsCanBePurchased = noOfCardsCanBePurchased;
    _alreadyIssuedOrPurchased = alreadyIssuedOrPurchased;
}

  ResponseData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _companyName = json['companyName'];
    _validFrom = json['validFrom'];
    _validTo = json['validTo'];
    _occasionalCode = json['occasionalCode'];
    _noOfCards = json['noOfCards'];
    _subscriptionType = json['subscriptionType'];
    _displaySubscriptionType = json['displaySubscriptionType'];
    _isExpired = json['isExpired'];
    _status = json['status'];
    _displayStatus = json['displayStatus'];
    _isRenewable = json['isRenewable'];
    _productId = json['productId'];
    _parentNetworkId = json['parentNetworkId'];
    _totalPurchased = json['totalPurchased'];
    _noOfCompanyCardsIssued = json['noOfCompanyCardsIssued'];
    _alreadyIssued = json['alreadyIssued'];
    _isBuyable = json['isBuyable'];
    _maxCards = json['maxCards'];
    _noOfCardsCanBePurchased = json['noOfCardsCanBePurchased'];
    _alreadyIssuedOrPurchased = json['alreadyIssuedOrPurchased'];
  }
  num? _id;
  String? _name;
  String? _companyName;
  String? _validFrom;
  String? _validTo;
  String? _occasionalCode;
  num? _noOfCards;
  String? _subscriptionType;
  String? _displaySubscriptionType;
  dynamic _isExpired;
  String? _status;
  String? _displayStatus;
  String? _isRenewable;
  num? _productId;
  num? _parentNetworkId;
  num? _totalPurchased;
  num? _noOfCompanyCardsIssued;
  num? _alreadyIssued;
  String? _isBuyable;
  num? _maxCards;
  num? _noOfCardsCanBePurchased;
  num? _alreadyIssuedOrPurchased;
ResponseData copyWith({  num? id,
  String? name,
  String? companyName,
  String? validFrom,
  String? validTo,
  String? occasionalCode,
  num? noOfCards,
  String? subscriptionType,
  String? displaySubscriptionType,
  dynamic isExpired,
  String? status,
  String? displayStatus,
  String? isRenewable,
  num? productId,
  num? parentNetworkId,
  num? totalPurchased,
  num? noOfCompanyCardsIssued,
  num? alreadyIssued,
  String? isBuyable,
  num? maxCards,
  num? noOfCardsCanBePurchased,
  num? alreadyIssuedOrPurchased,
}) => ResponseData(  id: id ?? _id,
  name: name ?? _name,
  companyName: companyName ?? _companyName,
  validFrom: validFrom ?? _validFrom,
  validTo: validTo ?? _validTo,
  occasionalCode: occasionalCode ?? _occasionalCode,
  noOfCards: noOfCards ?? _noOfCards,
  subscriptionType: subscriptionType ?? _subscriptionType,
  displaySubscriptionType: displaySubscriptionType ?? _displaySubscriptionType,
  isExpired: isExpired ?? _isExpired,
  status: status ?? _status,
  displayStatus: displayStatus ?? _displayStatus,
  isRenewable: isRenewable ?? _isRenewable,
  productId: productId ?? _productId,
  parentNetworkId: parentNetworkId ?? _parentNetworkId,
  totalPurchased: totalPurchased ?? _totalPurchased,
  noOfCompanyCardsIssued: noOfCompanyCardsIssued ?? _noOfCompanyCardsIssued,
  alreadyIssued: alreadyIssued ?? _alreadyIssued,
  isBuyable: isBuyable ?? _isBuyable,
  maxCards: maxCards ?? _maxCards,
  noOfCardsCanBePurchased: noOfCardsCanBePurchased ?? _noOfCardsCanBePurchased,
  alreadyIssuedOrPurchased: alreadyIssuedOrPurchased ?? _alreadyIssuedOrPurchased,
);
  num? get id => _id;
  String? get name => _name;
  String? get companyName => _companyName;
  String? get validFrom => _validFrom;
  String? get validTo => _validTo;
  String? get occasionalCode => _occasionalCode;
  num? get noOfCards => _noOfCards;
  String? get subscriptionType => _subscriptionType;
  String? get displaySubscriptionType => _displaySubscriptionType;
  dynamic get isExpired => _isExpired;
  String? get status => _status;
  String? get displayStatus => _displayStatus;
  String? get isRenewable => _isRenewable;
  num? get productId => _productId;
  num? get parentNetworkId => _parentNetworkId;
  num? get totalPurchased => _totalPurchased;
  num? get noOfCompanyCardsIssued => _noOfCompanyCardsIssued;
  num? get alreadyIssued => _alreadyIssued;
  String? get isBuyable => _isBuyable;
  num? get maxCards => _maxCards;
  num? get noOfCardsCanBePurchased => _noOfCardsCanBePurchased;
  num? get alreadyIssuedOrPurchased => _alreadyIssuedOrPurchased;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['companyName'] = _companyName;
    map['validFrom'] = _validFrom;
    map['validTo'] = _validTo;
    map['occasionalCode'] = _occasionalCode;
    map['noOfCards'] = _noOfCards;
    map['subscriptionType'] = _subscriptionType;
    map['displaySubscriptionType'] = _displaySubscriptionType;
    map['isExpired'] = _isExpired;
    map['status'] = _status;
    map['displayStatus'] = _displayStatus;
    map['isRenewable'] = _isRenewable;
    map['productId'] = _productId;
    map['parentNetworkId'] = _parentNetworkId;
    map['totalPurchased'] = _totalPurchased;
    map['noOfCompanyCardsIssued'] = _noOfCompanyCardsIssued;
    map['alreadyIssued'] = _alreadyIssued;
    map['isBuyable'] = _isBuyable;
    map['maxCards'] = _maxCards;
    map['noOfCardsCanBePurchased'] = _noOfCardsCanBePurchased;
    map['alreadyIssuedOrPurchased'] = _alreadyIssuedOrPurchased;
    return map;
  }

}