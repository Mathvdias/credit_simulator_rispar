class SendDataUser {
  String? fullname;
  String? email;
  double? ltv;
  double? amount;
  double? term;
  bool? hasProtectedCollateral;

  SendDataUser(
      {required this.fullname,
      required this.email,
      required this.ltv,
      required this.amount,
      required this.term,
      required this.hasProtectedCollateral});

  SendDataUser.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    ltv = json['ltv'];
    amount = json['amount'];
    term = json['term'];
    hasProtectedCollateral = json['has_protected_collateral'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['email'] = email;
    data['ltv'] = ltv;
    data['amount'] = amount;
    data['term'] = term;
    data['has_protected_collateral'] = hasProtectedCollateral;
    return data;
  }
}
