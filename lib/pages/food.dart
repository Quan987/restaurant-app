import 'package:testproject2/components/button.dart';
import 'package:testproject2/models/food.dart';
import 'package:testproject2/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({Key? key, required this.food}) : super(key: key) {
    for (Addon addon in food.availableAddon) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddon) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.food.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 25.0, right: 25, left: 25, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\$" + widget.food.price.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add-ons',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.food.availableAddon.length,
                                itemBuilder: (context, index) {
                                  Addon addon =
                                      widget.food.availableAddon[index];
                                  return ListTile(
                                    leading: Checkbox(
                                      value: widget.selectedAddons[addon],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          widget.selectedAddons[addon] = value!;
                                        });
                                      },
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    title: Text(
                                      addon.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    trailing: Text(
                                      "\$" + addon.price.toString(),
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0, left: 25, right: 25),
              child: MyButton(
                text: 'Add To Cart',
                onTap: () => addToCart(widget.food, widget.selectedAddons),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
