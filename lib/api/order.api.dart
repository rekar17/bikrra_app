// import 'package:dio/dio.dart';
// import 'package:bikrra_app/api/django_server.dart';
// import 'package:bikrra_app/classes/order.class.dart';

// class OrderApiC {
//   static Future<bool> addOrder(OrderC order) async {
//     try {
//       final response = await DjangoServer.dio.post(
//         '/orders/',
//         data: order.toJson(),
//       );
//       if (response.statusCode == 201) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return false;
//     }
//   }

//   static Future<List<OrderC>?> getOrders() async {
//     try {
//       final response = await DjangoServer.dio.get('/orders/');
//       if (response.statusCode == 200) {
//         List<OrderC> orders = (response.data as List)
//             .map((order) => OrderC.fromJson(order))
//             .toList();
//         return orders;
//       } else {
//         return null;
//       }
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return null;
//     }
//   }

//   static Future<OrderC?> getOrderById(int id) async {
//     try {
//       final response = await DjangoServer.dio.get('/orders/$id/');
//       if (response.statusCode == 200) {
//         return OrderC.fromJson(response.data);
//       } else {
//         return null;
//       }
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return null;
//     }
//   }

//   static Future<bool> updateOrder(int id, OrderC order) async {
//     try {
//       final response = await DjangoServer.dio.put(
//         '/orders/$id/',
//         data: order.toJson(),
//       );
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return false;
//     }
//   }

//   static Future<bool> deleteOrder(int id) async {
//     try {
//       final response = await DjangoServer.dio.delete('/orders/$id/');
//       if (response.statusCode == 204) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return false;
//     }
//   }
// }
