class GetProductReq {
  int? categoryId;
  String? deviceManufacturer;
  String? deviceModel;
  String? deviceToken;
  int? pageIndex;

  GetProductReq({
    this.categoryId,
    this.deviceManufacturer,
    this.deviceModel,
    this.deviceToken,
    this.pageIndex,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CategoryId'] = categoryId;
    data['DeviceManufacturer'] = deviceManufacturer;
    data['DeviceModel'] = deviceModel;
    data['DeviceToken'] = deviceToken;
    data['PageIndex'] = pageIndex;
    return data;
  }
}
