class CabOptionModel {
  String? taxiImage;
  String? taxiCategory;
  String? taxiInfo;
  String? price;

  CabOptionModel({this.taxiImage, this.taxiCategory, this.taxiInfo, this.price});

  CabOptionModel.fromJson(Map<dynamic, dynamic> json) {
    taxiImage = json['taxiImage'];
    taxiCategory = json['taxiCategory'];
    taxiInfo = json['taxiInfo'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxiImage'] = this.taxiImage;
    data['taxiCategory'] = this.taxiCategory;
    data['taxiInfo'] = this.taxiInfo;
    data['price'] = this.price;
    return data;
  }
}
