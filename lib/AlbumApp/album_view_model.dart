import 'package:batch4/AlbumApp/album_model.dart';
import 'package:batch4/AlbumApp/album_service.dart';
import 'package:get/get.dart';

class AlbumViewModel extends GetxController {
  AlbumService albumService = AlbumService();

  RxList<Album> albumsData = <Album>[].obs;
  RxBool isLoading = false.obs;

  fetchAlbumsData() async {
    isLoading.value = true;
    albumsData.value = await albumService.getAlbumsService();
    isLoading.value = false;
  }
}
