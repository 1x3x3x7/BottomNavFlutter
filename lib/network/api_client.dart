import 'package:my_app/model/image.dart';

class ApiClient {
  Future<List<ImageEntity>> fetchImages() async {
    List<ImageEntity> items = [
      ImageEntity(
          height: 333,
          width: 500,
          url:
              'https://images.unsplash.com/photo-1578345585277-8d125f29221c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=100'),
      ImageEntity(
          height: 301,
          width: 301,
          url:
              'https://images.unsplash.com/photo-1521392535762-ff64de43c1b6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=100'),
      ImageEntity(
          height: 333,
          width: 500,
          url:
              'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=100'),
    ];
    return new Future.delayed(Duration(seconds: 1), () => items);
  }
}
