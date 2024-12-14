import 'product_color.dart';

class ProductAttribute {
  dynamic id;
  bool status;
  ProductColor? color;
  int? weight;
  int? capacity;
  int? twoDimensionalHeight;
  int? twoDimensionalWidth;
  int? threeDimensionalHeight;
  int? threeDimensionalWidth;
  int? threeDimensionalThick;
  int amount;
  int price;
  int? discountPrice;
  int? discountPercent;

  String? get name {
    if (color == null &&
        twoDimensionalWidth == null &&
        threeDimensionalThick == null) {
      return null;
    }
    if (twoDimensionalWidth != null) {}
    if (color != null) {
      return '${color!.name}'
          '${_twoName != null ? ' ($_twoName)' : ''}'
          '${_threeName != null ? ' ($_threeName)' : ''}'
          '${weight != null ? ' ($weight kg)' : ''}'
          '${capacity != null ? ' ($capacity l)' : ''}';
    }
    if (_twoName != null) {
      return '$_twoName${weight != null ? ' ($weight kg)' : ''}${capacity != null ? ' ($capacity l)' : ''}';
    }
    if (_threeName != null) {
      return '$_threeName${weight != null ? ' ($weight kg)' : ''}${capacity != null ? ' ($capacity l)' : ''}';
    }

    return '';
  }

  String? get _threeName {
    return threeDimensionalThick != null ? '$threeDimensionalHeight x $threeDimensionalWidth x $threeDimensionalThick' : null;
  }

  String? get _twoName {
    return twoDimensionalWidth != null ? '${twoDimensionalHeight}x$twoDimensionalWidth' : null;
  }

  ProductAttribute(
      {
        this.id = "123456",
        this.status = false,
      this.color,
      this.weight,
      this.capacity,
      this.twoDimensionalHeight,
      this.twoDimensionalWidth,
      this.threeDimensionalHeight,
      this.threeDimensionalThick,
      this.threeDimensionalWidth,
      this.amount = 0,
      this.price = 0,
      this.discountPercent,
      this.discountPrice});
}
