import 'package:batch4/AlbumApp/album_service.dart';
import 'package:batch4/AlbumApp/album_view_model.dart';
import 'package:batch4/WeatherApp/Common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({super.key});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  AlbumViewModel albumViewModel = AlbumViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    albumViewModel.fetchAlbumsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // AlbumService albumService = AlbumService();
          // await albumService.postAlbumService(
          //     email: "numanshakir007@gmail.com", password: "12345678");

          // await albumService.getAlbumsService();
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
        child: Obx(
          () => albumViewModel.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: albumViewModel.albumsData.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CustomText(
                              title:
                                  "ID = ${albumViewModel.albumsData.value[index].id}"),
                          CustomText(
                              title:
                                  "User Id = ${albumViewModel.albumsData.value[index].userId}"),
                          CustomText(
                              title:
                                  "Title = ${albumViewModel.albumsData.value[index].title}"),
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
