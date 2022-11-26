
import 'package:ambev_flutter/app/data/model/order_model.dart';
import 'package:ambev_flutter/app/data/provider/order_provider.dart';

class OrderRepository {
  final OrderApiClient api = OrderApiClient();

  Future<OrderModel> store (OrderModel order) async {
    var response = await api.store(order);

    return OrderModel.fromJson(response!['order']);
  }

  Future<List<OrderModel>> get (int userId) async {
    var response = await api.get(userId);
    var orders = <OrderModel>[];


    if (response != null) {
      for (var order in response['orders']) {
        orders.add(OrderModel.fromJson(order));
      }
    }

    return orders;
  }

  Future<OrderModel> update (OrderModel order) async {
    var response = await api.update(order);

    print(response);

    order = OrderModel.fromJson(response!['order']);

    return order;
  }

  Future<List<OrderModel>> getFornecedor () async {
    var response = await api.getFornecedor();
    var orders = <OrderModel>[];


    if (response != null) {
      for (var order in response['orders']) {
        orders.add(OrderModel.fromJson(order));
      }
    }

    return orders;
  }

  Future<List<OrderModel>> getAnalista (String type) async {
    var response = await api.getAnalista(type);
    var orders = <OrderModel>[];


    if (response != null) {
      for (var order in response['orders']) {
        orders.add(OrderModel.fromJson(order));
      }
    }

    return orders;
  }
}