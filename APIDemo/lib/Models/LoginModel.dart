/// responseData : {"customerId":15,"sessionId":"ZHDpogWbTr5OmnfzefEQ4AxmRdaxmPOwRQpD7mle","locale":"en","preferredLangId":1,"preferredLangName":"EN","customerName":"Rajesh\nDalmia","customerEmail":"rajdalmia@gmail.com","gender":"M","phone":"9830019569","pushNotification":"Y","profilePic":"https://test.velospot.ch/customer/public/uploads/customers/profile_picture/profilePic-1679386851.jpg","preferredCityId":22,"preferredCityName":"CITY\nNational (AG-BE-BS-NE-VD-VS)","preferredNetworkId":18,"preferredNetworkName":"IMY National\n(AG-BE-BS-NE-VD-VS)"}
/// responseStatus : {"STATUS":"SUCCESS","MESSAGE":"Query\nsuccessful","STATUSCODE":"200"}
/// extraData : {"helplineLink":"https://test.velospot.ch/customer/public/staticFooter"}

class LoginModel {
  LoginModel({
      ResponseData? responseData, 
      ResponseStatus? responseStatus, 
      ExtraData? extraData,}){
    _responseData = responseData;
    _responseStatus = responseStatus;
    _extraData = extraData;
}

  LoginModel.fromJson(dynamic json) {
    _responseData = json['responseData'] != null ? ResponseData.fromJson(json['responseData']) : null;
    _responseStatus = json['responseStatus'] != null ? ResponseStatus.fromJson(json['responseStatus']) : null;
    _extraData = json['extraData'] != null ? ExtraData.fromJson(json['extraData']) : null;
  }
  ResponseData? _responseData;
  ResponseStatus? _responseStatus;
  ExtraData? _extraData;
LoginModel copyWith({  ResponseData? responseData,
  ResponseStatus? responseStatus,
  ExtraData? extraData,
}) => LoginModel(  responseData: responseData ?? _responseData,
  responseStatus: responseStatus ?? _responseStatus,
  extraData: extraData ?? _extraData,
);
  ResponseData? get responseData => _responseData;
  ResponseStatus? get responseStatus => _responseStatus;
  ExtraData? get extraData => _extraData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_responseData != null) {
      map['responseData'] = _responseData?.toJson();
    }
    if (_responseStatus != null) {
      map['responseStatus'] = _responseStatus?.toJson();
    }
    if (_extraData != null) {
      map['extraData'] = _extraData?.toJson();
    }
    return map;
  }

}

/// helplineLink : "https://test.velospot.ch/customer/public/staticFooter"

class ExtraData {
  ExtraData({
      String? helplineLink,}){
    _helplineLink = helplineLink;
}

  ExtraData.fromJson(dynamic json) {
    _helplineLink = json['helplineLink'];
  }
  String? _helplineLink;
ExtraData copyWith({  String? helplineLink,
}) => ExtraData(  helplineLink: helplineLink ?? _helplineLink,
);
  String? get helplineLink => _helplineLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['helplineLink'] = _helplineLink;
    return map;
  }

}

/// STATUS : "SUCCESS"
/// MESSAGE : "Query\nsuccessful"
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

/// customerId : 15
/// sessionId : "ZHDpogWbTr5OmnfzefEQ4AxmRdaxmPOwRQpD7mle"
/// locale : "en"
/// preferredLangId : 1
/// preferredLangName : "EN"
/// customerName : "Rajesh\nDalmia"
/// customerEmail : "rajdalmia@gmail.com"
/// gender : "M"
/// phone : "9830019569"
/// pushNotification : "Y"
/// profilePic : "https://test.velospot.ch/customer/public/uploads/customers/profile_picture/profilePic-1679386851.jpg"
/// preferredCityId : 22
/// preferredCityName : "CITY\nNational (AG-BE-BS-NE-VD-VS)"
/// preferredNetworkId : 18
/// preferredNetworkName : "IMY National\n(AG-BE-BS-NE-VD-VS)"

class ResponseData {
  ResponseData({
      num? customerId, 
      String? sessionId, 
      String? locale, 
      num? preferredLangId, 
      String? preferredLangName, 
      String? customerName, 
      String? customerEmail, 
      String? gender, 
      String? phone, 
      String? pushNotification, 
      String? profilePic, 
      num? preferredCityId, 
      String? preferredCityName, 
      num? preferredNetworkId, 
      String? preferredNetworkName,}){
    _customerId = customerId;
    _sessionId = sessionId;
    _locale = locale;
    _preferredLangId = preferredLangId;
    _preferredLangName = preferredLangName;
    _customerName = customerName;
    _customerEmail = customerEmail;
    _gender = gender;
    _phone = phone;
    _pushNotification = pushNotification;
    _profilePic = profilePic;
    _preferredCityId = preferredCityId;
    _preferredCityName = preferredCityName;
    _preferredNetworkId = preferredNetworkId;
    _preferredNetworkName = preferredNetworkName;
}

  ResponseData.fromJson(dynamic json) {
    _customerId = json['customerId'];
    _sessionId = json['sessionId'];
    _locale = json['locale'];
    _preferredLangId = json['preferredLangId'];
    _preferredLangName = json['preferredLangName'];
    _customerName = json['customerName'];
    _customerEmail = json['customerEmail'];
    _gender = json['gender'];
    _phone = json['phone'];
    _pushNotification = json['pushNotification'];
    _profilePic = json['profilePic'];
    _preferredCityId = json['preferredCityId'];
    _preferredCityName = json['preferredCityName'];
    _preferredNetworkId = json['preferredNetworkId'];
    _preferredNetworkName = json['preferredNetworkName'];
  }
  num? _customerId;
  String? _sessionId;
  String? _locale;
  num? _preferredLangId;
  String? _preferredLangName;
  String? _customerName;
  String? _customerEmail;
  String? _gender;
  String? _phone;
  String? _pushNotification;
  String? _profilePic;
  num? _preferredCityId;
  String? _preferredCityName;
  num? _preferredNetworkId;
  String? _preferredNetworkName;
ResponseData copyWith({  num? customerId,
  String? sessionId,
  String? locale,
  num? preferredLangId,
  String? preferredLangName,
  String? customerName,
  String? customerEmail,
  String? gender,
  String? phone,
  String? pushNotification,
  String? profilePic,
  num? preferredCityId,
  String? preferredCityName,
  num? preferredNetworkId,
  String? preferredNetworkName,
}) => ResponseData(  customerId: customerId ?? _customerId,
  sessionId: sessionId ?? _sessionId,
  locale: locale ?? _locale,
  preferredLangId: preferredLangId ?? _preferredLangId,
  preferredLangName: preferredLangName ?? _preferredLangName,
  customerName: customerName ?? _customerName,
  customerEmail: customerEmail ?? _customerEmail,
  gender: gender ?? _gender,
  phone: phone ?? _phone,
  pushNotification: pushNotification ?? _pushNotification,
  profilePic: profilePic ?? _profilePic,
  preferredCityId: preferredCityId ?? _preferredCityId,
  preferredCityName: preferredCityName ?? _preferredCityName,
  preferredNetworkId: preferredNetworkId ?? _preferredNetworkId,
  preferredNetworkName: preferredNetworkName ?? _preferredNetworkName,
);
  num? get customerId => _customerId;
  String? get sessionId => _sessionId;
  String? get locale => _locale;
  num? get preferredLangId => _preferredLangId;
  String? get preferredLangName => _preferredLangName;
  String? get customerName => _customerName;
  String? get customerEmail => _customerEmail;
  String? get gender => _gender;
  String? get phone => _phone;
  String? get pushNotification => _pushNotification;
  String? get profilePic => _profilePic;
  num? get preferredCityId => _preferredCityId;
  String? get preferredCityName => _preferredCityName;
  num? get preferredNetworkId => _preferredNetworkId;
  String? get preferredNetworkName => _preferredNetworkName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = _customerId;
    map['sessionId'] = _sessionId;
    map['locale'] = _locale;
    map['preferredLangId'] = _preferredLangId;
    map['preferredLangName'] = _preferredLangName;
    map['customerName'] = _customerName;
    map['customerEmail'] = _customerEmail;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['pushNotification'] = _pushNotification;
    map['profilePic'] = _profilePic;
    map['preferredCityId'] = _preferredCityId;
    map['preferredCityName'] = _preferredCityName;
    map['preferredNetworkId'] = _preferredNetworkId;
    map['preferredNetworkName'] = _preferredNetworkName;
    return map;
  }

}