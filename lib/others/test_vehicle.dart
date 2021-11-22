class TestVehicle {
  String icon;
  double value;
  double rate;
  double total;

  TestVehicle({
    required this.icon,
    required this.value,
    required this.rate,
    required this.total,
  });

  static List<TestVehicle> listTestVehicles = [
    TestVehicle(
        icon: "images/logo_CEP.jpg", value: 1000.0, rate: 0.0, total: 1000.0),
    TestVehicle(
        icon: "images/logo_CEP.jpg", value: 2000.0, rate: 0.0, total: 2000.0),
    TestVehicle(
        icon: "images/logo_CEP.jpg", value: 3000.0, rate: 0.0, total: 3000.0),
  ];
}
