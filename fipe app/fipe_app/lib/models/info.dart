class Info {
  String? price;
  String? brand;
  String? model;
  int? modelYear;
  String? fuel;
  String? codeFipe;
  String? referenceMonth;
  int? vehicleType;
  String? fuelAcronym;

  Info(
      {this.price,
      this.brand,
      this.model,
      this.modelYear,
      this.fuel,
      this.codeFipe,
      this.referenceMonth,
      this.vehicleType,
      this.fuelAcronym});

  Info.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    brand = json['brand'];
    model = json['model'];
    modelYear = json['modelYear'];
    fuel = json['fuel'];
    codeFipe = json['codeFipe'];
    referenceMonth = json['referenceMonth'];
    vehicleType = json['vehicleType'];
    fuelAcronym = json['fuelAcronym'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['brand'] = brand;
    data['model'] = model;
    data['modelYear'] = modelYear;
    data['fuel'] = fuel;
    data['codeFipe'] = codeFipe;
    data['referenceMonth'] = referenceMonth;
    data['vehicleType'] = vehicleType;
    data['fuelAcronym'] = fuelAcronym;
    return data;
  }
}
