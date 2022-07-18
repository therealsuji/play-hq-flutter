class OrderingUser {
  OrderingUser({
    this.avatar,
    this.rating,
    this.displayName,
    this.address,
    this.id,
    this.phone,
  });

  String? avatar;
  dynamic rating;
  String? displayName;
  String? address;
  String? id;
  String? phone;

  factory OrderingUser.fromJson(Map<String, dynamic> json) => OrderingUser(
    avatar: json["avatar"],
    rating: json["rating"],
    displayName: json["displayName"],
    address: json["address"],
    id: json["id"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "rating": rating,
    "displayName": displayName,
    "address": address,
    "id": id,
    "phone": phone,
  };
}