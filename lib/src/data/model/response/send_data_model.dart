class DataModel {
  String? id;
  String? fullname;
  String? email;
  int? ltv;
  double? contractValue;
  int? netValue;
  double? installmentValue;
  double? lastInstallmentValue;
  double? iofFee;
  double? originationFee;
  int? term;
  int? collateral;
  int? collateralInBrl;
  double? collateralUnitPrice;
  String? firstDueDate;
  String? lastDueDate;
  double? interestRate;
  double? monthlyRate;
  double? annualRate;

  DataModel(
      {this.id,
      this.fullname,
      this.email,
      this.ltv,
      this.contractValue,
      this.netValue,
      this.installmentValue,
      this.lastInstallmentValue,
      this.iofFee,
      this.originationFee,
      this.term,
      this.collateral,
      this.collateralInBrl,
      this.collateralUnitPrice,
      this.firstDueDate,
      this.lastDueDate,
      this.interestRate,
      this.monthlyRate,
      this.annualRate});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    ltv = json['ltv'];
    contractValue = json['contract_value'];
    netValue = json['net_value'];
    installmentValue = json['installment_value'];
    lastInstallmentValue = json['last_installment_value'];
    iofFee = json['iof_fee'];
    originationFee = json['origination_fee'];
    term = json['term'];
    collateral = json['collateral'];
    collateralInBrl = json['collateral_in_brl'];
    collateralUnitPrice = json['collateral_unit_price'];
    firstDueDate = json['first_due_date'];
    lastDueDate = json['last_due_date'];
    interestRate = json['interest_rate'];
    monthlyRate = json['monthly_rate'];
    annualRate = json['annual_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['email'] = email;
    data['ltv'] = ltv;
    data['contract_value'] = contractValue;
    data['net_value'] = netValue;
    data['installment_value'] = installmentValue;
    data['last_installment_value'] = lastInstallmentValue;
    data['iof_fee'] = iofFee;
    data['origination_fee'] = originationFee;
    data['term'] = term;
    data['collateral'] = collateral;
    data['collateral_in_brl'] = collateralInBrl;
    data['collateral_unit_price'] = collateralUnitPrice;
    data['first_due_date'] = firstDueDate;
    data['last_due_date'] = lastDueDate;
    data['interest_rate'] = interestRate;
    data['monthly_rate'] = monthlyRate;
    data['annual_rate'] = annualRate;
    return data;
  }
}
