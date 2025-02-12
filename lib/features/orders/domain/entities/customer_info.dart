class CustomerInfoEntity {
  dynamic id;
  String name;
  String phone;
  String address;
  double latitude;
  double longitude;

  CustomerInfoEntity({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

dummyCustomer() {
  return CustomerInfoEntity(
    name: "Sheronov Azizjon",
    phone: "+998 99 036 26 07",
    address:
    "Toshkent, Chilonzor tumani, Afrosiyob koʻchasi, 2",
    longitude: 69.269594,
    latitude: 41.330825
  );
}
