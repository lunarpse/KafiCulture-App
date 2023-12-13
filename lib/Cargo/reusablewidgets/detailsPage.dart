// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:project_2/Cargo/reusablewidgets/dialogueBox.dart';
import 'package:project_2/Cargo/reusablewidgets/size_button.dart';
import 'package:project_2/homepage/model/json_model.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:project_2/homepage/reusable_widgets/dialog_box.dart';
import 'package:readmore/readmore.dart';
import 'package:project_2/cart/riverpod/state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CargoDetailsPageWidget extends ConsumerStatefulWidget {
  const CargoDetailsPageWidget(
      {super.key,
      required this.details,
      required this.fetchProducts,
      required this.nextPage});

  final details;
  final fetchProducts;
  final nextPage;

  @override
  ConsumerState<CargoDetailsPageWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<CargoDetailsPageWidget> {
  int selectedIndex = 0;
  int quantity = 1;
  int selectedNumber = 2;

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    final screenHeight = MediaQuery.of(context).size.height;
    final bodyHeight = screenHeight - appBarHeight;
    final bodyWidth = MediaQuery.of(context).size.width;

    final func = ref.read(CartProvider.notifier);
    final image = widget.details.image;
    final name = widget.details.name;
    final description = widget.details.description;

    final price1 = selectedIndex == 0
        ? widget.details.price
        : selectedIndex == 1
            ? double.parse((widget.details.price * 2).toStringAsFixed(2))
            : double.parse((widget.details.price * 3).toStringAsFixed(2));

    final price = double.parse((quantity * price1).toStringAsFixed(2));

    final offerPrice1 = selectedIndex == 0
        ? widget.details.offerPrice
        : selectedIndex == 1
            ? double.parse((widget.details.offerPrice * 2).toStringAsFixed(2))
            : double.parse((widget.details.offerPrice * 3).toStringAsFixed(2));

    final offerPrice =
        double.parse((quantity * offerPrice1).toStringAsFixed(2));

    final discount = widget.details.discount;
    final rating = widget.details.rating;
    final totalRatings = widget.details.totalRatings;

    return BackgroundContainerWidget(
      opacity: 0.6,
      x: 8.0,
      y: 8.0,
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Container(
          height: bodyHeight,
          width: bodyWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Stack(
            children: [
              Hero(
                tag: widget.details,
                child: Container(
                  height: (bodyHeight / 3),
                  width: bodyWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/MenShoes/$image.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                top: (bodyHeight / 4) + 23,
                child: GlassContainer(
                  height: 120.0,
                  width: bodyWidth - 20,
                  blur: 4,
                  border: Border.fromBorderSide(BorderSide.none),
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white.withOpacity(0.2),
                  child: Container(
                    width: bodyWidth - 20.0,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 25.0),
                          width: (bodyWidth - 20.0) / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 23,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    rating,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    '($totalRatings)',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 140,
                          width: (bodyWidth - 20) / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 80,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(0.6)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$ $offerPrice",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ $price ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade400,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  Colors.grey.shade400,
                                              decorationThickness: 2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "($discount% Off)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.orange.shade800),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              //
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black.withOpacity(0.8)),
                                    child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          quantity = quantity - 1 == 0
                                              ? 1
                                              : quantity - 1;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                  Text(quantity.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black.withOpacity(0.8)),
                                    child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          quantity = quantity + 1;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: bodyHeight / 2 - 62,
                  child: Container(
                    color: Colors.white,
                    height: bodyHeight / 2 - 66,
                    width: bodyWidth - 20,
                    child: ListView(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Container(
                              // height: 43,
                              width: bodyWidth - 30,
                              child: ReadMoreText(
                                description,
                                // selectedIndex.toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                                trimLines: 2,
                                trimMode: TrimMode.Line,
                                moreStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                                lessStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Size',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  13 - 5 + 1,
                                  (index) {
                                    final number = index + 5;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex= index;
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: index == selectedIndex
                                                  ? Color.fromRGBO(
                                                      143, 93, 58, 1)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: index == selectedIndex
                                                  ? Border.all(
                                                      color:
                                                          Colors.brown.shade900,
                                                      width: 2)
                                                  : Border.all(
                                                      color: Color.fromRGBO(
                                                          143, 93, 58, 1),
                                                      width: 2)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '$number',
                                                style: TextStyle(
                                                    color:
                                                        index == selectedIndex
                                                            ? Colors.white
                                                            : Color.fromRGBO(
                                                                143, 93, 58, 1),
                                                    fontSize: 17,
                                                    fontWeight:
                                                        index == selectedIndex
                                                            ? FontWeight.normal
                                                            : FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            SizedBox(height: 12),
                            Text(
                              'Customers also liked',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 190,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 5,
                                        mainAxisExtent: 160),
                                itemCount: widget.fetchProducts.length,
                                itemBuilder: (context, index) {
                                  var fetchProduct =
                                      widget.fetchProducts[index];
                                  final image = fetchProduct.image;
                                  final name = fetchProduct.name;
                                  final totalRating = fetchProduct.totalRatings;
                                  final rating = fetchProduct.rating;
                                  final offerPrice = fetchProduct.offerPrice;
                                  final discount = fetchProduct.discount;

                                  return InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, widget.nextPage,
                                        arguments: fetchProduct),
                                    child: Card(
                                      elevation: 10,
                                      shadowColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 115,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(10)),
                                              child: Image.asset(
                                                'assets/images/MenShoes/$image.jpg',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 67,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  name,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 17,
                                                      color: Colors.orange,
                                                    ),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      "$rating ($totalRating)",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "\$ $offerPrice ",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "($discount% Off)",
                                                      style: TextStyle(
                                                          fontSize: 13.5,
                                                          color: Colors.orange,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  width: bodyWidth - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3,
                          spreadRadius: 2,
                          offset: Offset(0, -2))
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CargoDialogueBox();
                              });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(143, 93, 58, 1)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                            fixedSize: MaterialStateProperty.all(
                                Size((bodyWidth / 3) + 25, 50))),
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.orange,
                          size: 20,
                        ),
                        label: Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.orange,
                          size: 20,
                        ),
                        label: Text(
                          "Add To Cart",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(143, 93, 58, 1)),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                            fixedSize: MaterialStateProperty.all(
                                Size((bodyWidth / 3) + 25, 50)),
                            side: MaterialStatePropertyAll(BorderSide(
                                color: Color.fromRGBO(143, 93, 58, 1),
                                width: 3))),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildSizeButton(
  //   String title,
  //   int index,
  //   String sizename,
  // ) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedIndex = index;
  //       });
  //     },
  //     child: Container(
  //       height: widget.details.category == "Snacks"
  //           ? 40
  //           : widget.details.category == "Cookies"
  //               ? 40
  //               : 48,
  //       width: widget.details.category == "Snacks"
  //           ? 105
  //           : widget.details.category == "Cookies"
  //               ? 105
  //               : 110,
  //       // height: 40,
  //       // width: 105,
  //       decoration: BoxDecoration(
  //           color: index == selectedIndex
  //               ? Color.fromRGBO(143, 93, 58, 1)
  //               : Colors.white,
  //           borderRadius: BorderRadius.circular(10),
  //           border: index == selectedIndex
  //               ? Border.all(color: Colors.brown.shade900, width: 2)
  //               : Border.all(color: Color.fromRGBO(143, 93, 58, 1), width: 2)),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             title,
  //             style: TextStyle(
  //                 color: index == selectedIndex
  //                     ? Colors.white
  //                     : Color.fromRGBO(143, 93, 58, 1),
  //                 fontSize: 17,
  //                 fontWeight: index == selectedIndex
  //                     ? FontWeight.normal
  //                     : FontWeight.bold),
  //           ),
  //           if (widget.details.category == "Coffee")
  //             Text(
  //               sizename,
  //               style: TextStyle(
  //                   color: index == selectedIndex
  //                       ? Colors.white
  //                       : Color.fromRGBO(143, 93, 58, 1),
  //                   fontSize: 12,
  //                   fontWeight: index == selectedIndex
  //                       ? FontWeight.normal
  //                       : FontWeight.bold),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future bottomSheet() {
    return showModalBottomSheet(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      enableDrag: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Color.fromRGBO(143, 93, 58, 0.8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Divider(
                  color: Colors.black,
                  thickness: 4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    size: 35,
                    color: Colors.green,
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      Text(
                        "${widget.details.name} ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "is addedd to Cart",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.orange,
                      size: 20,
                    ),
                    label: Text(
                      "Cart",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(143, 93, 58, 1)),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        fixedSize: MaterialStateProperty.all(Size(140, 50)),
                        side: MaterialStatePropertyAll(BorderSide(
                            color: Color.fromRGBO(143, 93, 58, 1), width: 3))),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(143, 93, 58, 1)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                        fixedSize: MaterialStateProperty.all(Size(230, 50))),
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.orange,
                      size: 20,
                    ),
                    label: Text(
                      "Continue Shopping",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
