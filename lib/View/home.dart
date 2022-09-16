import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine/Styles/appcolor.dart';
import 'package:medicine/View/login.dart';
import 'package:medicine/services/order_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../Model/response/data_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> dataList = <Data>[];
  var ordersResponse;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var listCount = 0;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(
    'Dashboard',
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  );

  @override
  void initState() {
    getAllOrders();
    super.initState();
  }

  Future getAllOrders() async {
    final client =
        OrderService(Dio(BaseOptions(contentType: "application/json")));
    try {
      final response = await client.getAllOrders();
      if (response.succeeded == true) {
        ordersResponse = response;
        dataList = response.data!;
        listCount = dataList.length;

        setState(() {});
      } else {
        EasyLoading.showError("Failed to get Data");
      }
    } on DioError catch (ex) {
      EasyLoading.showError(ex.message);
    }
  }

  void _onRefresh() async {
    await getAllOrders();
    EasyLoading.showToast("Refresh successful");
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    title: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: onSearchTextChanged,
                    ),
                  );
                } else {
                  getAllOrders();
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text(
                    "Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  );
                }
              });
            },
            icon: customIcon,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.separated(
              itemCount: listCount,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(6),
              shrinkWrap: false,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    tileColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16),
                    style: ListTileStyle.drawer,
                    title: Text(
                      dataList[index].name ?? "",
                      style: const TextStyle(
                          color: AppColor.titleText, fontSize: 15),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Address : ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12, color: AppColor.titleText),
                                ),
                                Text(
                                  dataList[index].billingAddress ?? "N/A",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 13, color: AppColor.titleText),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Contact No : ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12, color: AppColor.titleText),
                                ),
                                Text(
                                  dataList[index].phoneNumber ?? "N/A",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12, color: AppColor.lightText),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Remarks : ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12, color: AppColor.titleText),
                                ),
                                Text(
                                  dataList[index].remarks ?? "N/A",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12, color: AppColor.lightText),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      onPressed: () {
                        EasyLoading.showToast("Delivered", dismissOnTap: true);
                      },
                      icon: const Icon(Icons.fact_check,
                          color: Colors.green, size: 25),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 4,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    dataList = [];
    if (text.isEmpty) {
      await getAllOrders();
      setState(() {});
      return;
    }

    for (var name in ordersResponse.data!) {
      if (name.name!.toLowerCase().contains(text.toLowerCase()) ||
          name.phoneNumber!.toLowerCase().contains(text.toLowerCase())) {
        dataList.add(name);
      }
    }
    listCount = dataList.length;
    setState(() {});
  }
}
