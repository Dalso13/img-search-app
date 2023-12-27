import 'package:flutter/material.dart';
import 'package:img_search_app/model/pixabay_modal.dart';
import 'package:img_search_app/repository/pixabay_img_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final repository = PixaBayImgRepository();
  final controller = TextEditingController();
  List<PixaBayImgModel>? searchData;
  bool isSearch = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(width: 2, color: Color(0xFF4FB6B2))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(width: 2, color: Color(0xFF4FB6B2))),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      setState(() {
                        isSearch = false;
                      });
                      searchData =
                          await repository.getImgModel(controller.text);
                      setState(() {
                        isSearch = true;
                      });
                    },
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            isSearch
                ? Expanded(
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        children: searchData != null
                            ? searchData!
                                .map((e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      e.imageUrl,
                                      fit: BoxFit.cover,
                                    )))
                                .toList()
                            : []),
                  )
                : const Center(child: CircularProgressIndicator()),
          ]),
        ),
      ),
    );
  }
}
