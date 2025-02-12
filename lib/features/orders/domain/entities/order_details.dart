import 'customer_info.dart';
import 'order_product.dart';
import 'payment.dart';

class Order {

  dynamic id;
  CustomerInfoEntity customer;
  String status;
  Payment payment;
  List<OrderProduct> products;

  Order({
    required this.id,
    required this.customer,
    required this.status,
    required this.payment,
    required this.products,
  });
}