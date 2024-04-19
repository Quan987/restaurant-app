import 'package:flutter/material.dart';
import 'package:project2/components/button.dart';
import 'package:project2/models/extra_item.dart';
import 'package:project2/models/food.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({
    super.key,
    required this.menu,
  });

  final Food menu;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final Map<ExtraItem, bool> isSelected = {};

  void initiateExtraItemSelect() {
    for (ExtraItem item in widget.menu.extra) {
      isSelected[item] = false;
    }
  }

  @override
  void initState() {
    super.initState();
    initiateExtraItemSelect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2)),
                    ],
                  ),
                  child: Image.asset(
                    widget.menu.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    // iconSize: 40,
                    icon: const Icon(
                      Icons.arrow_circle_left,
                      size: 40,
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.menu.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          widget.menu.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const Divider(height: 40),
                      Text(
                        "Extras".toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.menu.extra.length,
                          itemBuilder: (context, index) {
                            var extraItem = widget.menu.extra[index];
                            return CheckboxListTile(
                              checkColor: Colors.white,
                              activeColor: Colors.blue[600],
                              value: isSelected[extraItem],
                              onChanged: (value) {
                                setState(() {
                                  isSelected[extraItem] = value!;
                                });
                              },
                              title: Text(
                                extraItem.name,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              subtitle: Text(
                                "\$${extraItem.price}",
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  MyButton(
                    title: "Add to cart",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
