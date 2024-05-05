class ShopModal {
  String? sId;
  String? bIN;
  String? nameCompanySeler;
  String? comapnySelerCountry;
  String? adressComapnySeler;
  String? companySelerContact;
  String? comapnySelerEmail;
  String? comapnySelerLogin;
  String? comapnySelerPassword;
  String? companySelerInfo;
  String? companySelerLogo;
  int? iV;

  ShopModal(
      {this.sId,
      this.bIN,
      this.nameCompanySeler,
      this.comapnySelerCountry,
      this.adressComapnySeler,
      this.companySelerContact,
      this.comapnySelerEmail,
      this.comapnySelerLogin,
      this.comapnySelerPassword,
      this.companySelerInfo,
      this.companySelerLogo,
      this.iV});

  ShopModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    bIN = json['BIN'];
    nameCompanySeler = json['NameCompanySeler'];
    comapnySelerCountry = json['ComapnySelerCountry'];
    adressComapnySeler = json['AdressComapnySeler'];
    companySelerContact = json['CompanySelerContact'];
    comapnySelerEmail = json['ComapnySelerEmail'];
    comapnySelerLogin = json['ComapnySelerLogin'];
    comapnySelerPassword = json['ComapnySelerPassword'];
    companySelerInfo = json['CompanySelerInfo'];
    companySelerLogo = json['CompanySelerLogo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['BIN'] = this.bIN;
    data['NameCompanySeler'] = this.nameCompanySeler;
    data['ComapnySelerCountry'] = this.comapnySelerCountry;
    data['AdressComapnySeler'] = this.adressComapnySeler;
    data['CompanySelerContact'] = this.companySelerContact;
    data['ComapnySelerEmail'] = this.comapnySelerEmail;
    data['ComapnySelerLogin'] = this.comapnySelerLogin;
    data['ComapnySelerPassword'] = this.comapnySelerPassword;
    data['CompanySelerInfo'] = this.companySelerInfo;
    data['CompanySelerLogo'] = this.companySelerLogo;
    data['__v'] = this.iV;
    return data;
  }
}