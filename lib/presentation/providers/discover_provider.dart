import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';


class DiscoverProvider extends ChangeNotifier {
  // todo: repository, datasource

  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    // simulación de carga de comunicación http async
    // await Future.delayed(const Duration(seconds: 2));
    // final List<VideoPost> newVideos = videoPosts.map(
    //   (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    // ).toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos); // Agregar los videos al list
    initialLoading = false;
    notifyListeners();
  }
}
