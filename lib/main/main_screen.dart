import 'package:flutter/material.dart';
import 'package:img_search_app/view_model/main_view_model.dart';
import 'package:img_search_app/view_model/result/main_event.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = TextEditingController();



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<MainViewModel>().eventStream.listen((event) {
        switch (event) {
          case ShowSnackBar():
            final snackBar = SnackBar(
              content: Text(event.data),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowDialog():
            showDialog(
              context: context,
              barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
              builder: ((context) {
                return AlertDialog(
                  title: Text(event.data),
                  actions: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //창 닫기
                        },
                        child: Text("닫기"),
                      ),
                    ),
                  ],
                );
              }),
            );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
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
                          const BorderSide(width: 2, color: Color(0xFF4FB6B2))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFF4FB6B2))),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      viewModel.getImgModel(controller.text);
                    },
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            viewModel.isSearch
                ? Expanded(
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        children: viewModel.searchData != null
                            ? viewModel.searchData!
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
