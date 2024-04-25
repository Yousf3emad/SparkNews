import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../models/category_model.dart';
import '../screens/category_tab.dart';
import '../screens/data_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18.0),
                      bottomRight: Radius.circular(18.0),
                    )),
                child: Center(
                  child: Text(
                    "Spark News",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = null;
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(18.0),
                  child: Row(
                    children: [
                      Icon(
                        IconlyBold.category,
                        color: Colors.green.shade700,
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "Category",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 18.0, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      IconlyBold.setting,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 24.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: const Text(
            "News",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: selectedCategory == null
            ? CategoryTab(onClick: onCategoryClicked)
            : DataTab(
                categoryId: selectedCategory!.id,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClicked(category) {
    selectedCategory = category;
    setState(() {});
  }
}
