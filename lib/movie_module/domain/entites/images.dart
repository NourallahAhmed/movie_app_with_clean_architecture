import 'package:equatable/equatable.dart';

class MovieImages extends Equatable {
  final double aspectRatio;
  final int height;
  final String filePath;
  final int width;

  MovieImages({
    required this.aspectRatio,
    required this.height,
    required this.filePath,
    required this.width,
  });

  @override
  List<Object> get props => [aspectRatio, height, filePath, width];
}
