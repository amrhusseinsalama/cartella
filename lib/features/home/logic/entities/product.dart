import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final int id;
  final String title;
  final List<String> images;
  final int price;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
  });
  
  @override
  List<Object?> get props => [id];
}
