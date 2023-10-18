import 'dart:convert';
import 'package:toktik/domain/entities/video_post.dart';

String localVideoModelToJson(data) => json.encode(data.toJson());

class LocalVideoModel {
  // 1. Propiedades
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  // 2. Constructor
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  // 3. Constructo con nombre: fromJsonMap()
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
        name: json['name'] ?? 'No name',
        videoUrl: json['videoUrl'],
        likes: json['likes'] ?? 0,
        views: json['views'] ?? 0,
  );

  // 4. Método: toVideoPostEntity()
  VideoPost toVideoPostEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views,
  );
}
