import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/button.dart';
import 'package:sushi_shop/models/shop.dart';
import 'package:sushi_shop/theme/colors.dart';

import '../models/food.dart';

class FoodDetailspage extends StatefulWidget {
  final Food food;
  const FoodDetailspage({super.key, required this.food});

  @override
  State<FoodDetailspage> createState() => _FoodDetailspageState();
}

class _FoodDetailspageState extends State<FoodDetailspage> {
  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCard() {
    setState(
      () {
        if (quantityCount > 0) {
          final shop = context.read<Shop>();

          shop.addToCard(widget.food, quantityCount);

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Sucesso ao adicionar"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.done))
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Descrição',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    """O Temaki é uma obra-prima gastronômica japonesa que transcende as expectativas culinárias. Imagine um cone de sushi meticulosamente elaborado, onde cada mordida é uma experiência sensorial única. Com uma fusão equilibrada de nori crocante, arroz de sushi delicadamente temperado e uma variedade de recheios frescos, como peixe vibrante, abacate cremoso e molhos irresistíveis, o Temaki é mais do que uma refeição; é uma celebração de sabores.""",
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 14, height: 2),
                  ),
                ],
              ),
            ),
          ),
          //listView of food details
          // price + quantity + add to card button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: decrementQuantity,
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: incrementQuantity,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  text: "Add To Card",
                  onTap: () => addToCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
