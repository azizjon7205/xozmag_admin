class Customer {
  dynamic id;
  String name;
  String phone;
  String address;
  double latitude;
  double longitude;

  Customer({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

dummyCustomer() {
  return Customer(
    name: "Sheronov Azizjon",
    phone: "+998 99 036 26 07",
    address:
    "Toshkent, Chilonzor tumani, Afrosiyob koʻchasi, 2",
    longitude: 69.269594,
    latitude: 41.330825
  );
}
