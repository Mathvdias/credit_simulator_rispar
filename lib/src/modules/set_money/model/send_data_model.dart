class SendDataUser {
  String? fullname;
  String? email;
  int? ltv;
  int? amount;
  int? term;
  bool? hasProtectedCollateral;

  SendDataUser(
      {this.fullname,
      this.email,
      this.ltv,
      this.amount,
      this.term,
      this.hasProtectedCollateral});

  SendDataUser.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    ltv = json['ltv'];
    amount = json['amount'];
    term = json['term'];
    hasProtectedCollateral = json['has_protected_collateral'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['ltv'] = this.ltv;
    data['amount'] = this.amount;
    data['term'] = this.term;
    data['has_protected_collateral'] = this.hasProtectedCollateral;
    return data;
  }
}