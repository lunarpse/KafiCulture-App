// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../cart/riverpod/cargo_state_provider.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';

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
    double appBarHeight = AppbarWidget().preferredSize.height;
    final screenHeight = MediaQuery.of(context).size.height;
    final bodyHeight = screenHeight - appBarHeight;
    final bodyWidth = MediaQuery.of(context).size.width;

    final func = ref.read(CargoProvider.notifier);
    final image = widget.details.image;
    final name = widget.details.name;
    final description = widget.details.description;

    final price1 = widget.details.price;

    final price = double.parse((quantity * price1).toStringAsFixed(2));

    final offerPrice1 = widget.details.offerPrice;

    final offerPrice =
        double.parse((quantity * offerPrice1).toStringAsFixed(2));

    final discount = widget.details.discount;
    final rating = widget.details.rating;
    final totalRatings = widget.details.totalRatings;

    return BackgroundContainerWidget(
      opacity: 0.3,
      x: 8.0,
      y: 8.0,
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Container(
          height: bodyHeight,
          width: bodyWidth,
          decoration: BoxDecoration(
              color: parentContainerBoxdecorationColor,
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
                              AssetImage("assets/images/MenShoes/$image.png"),
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
                  color: glasscontainerColor,
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
                                    color: glasscontainerNameColor,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: glasscontainerStarIconColor,
                                    size: 23,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    rating,
                                    style: TextStyle(
                                        color: glasscontainerRatingColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    '($totalRatings)',
                                    style: TextStyle(
                                      color: glasscontainerTotalratingColor,
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
                                width: 167,
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
                                          fontSize: 25,
                                          color: glasscontainerOfferpriceColor),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ $price ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: glasscontainerPriceColor,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  glasscontainerPriceDecorationColor,
                                              decorationThickness: 2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "($discount% Off)",
                                          style: TextStyle(
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  glasscontainerDiscountColor),
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
                                        color:
                                            glasscontainerRemoveIconDecorationColor),
                                    child: IconButton(
                                      color:
                                          glasscontainerRemoveIconButtonColor,
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
                                        color:
                                            glasscontainerAddIconDecorationColor),
                                    child: IconButton(
                                      color: glasscontainerAddIconButtonColor,
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
                    height: bodyHeight / 2 - 66,
                    width: bodyWidth - 20,
                    child: ListView(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              descriptionText,
                              style: TextStyle(
                                  color: descriptiontextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: bodyWidth - 30,
                              child: ReadMoreText(
                                description,
                                style: TextStyle(
                                    color: descriptionColor, fontSize: 17),
                                trimLines: 2,
                                trimMode: TrimMode.Line,
                                moreStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: descriptionMoreStyleColor),
                                lessStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: descriptionLessStyleColor),
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                  sizeText1,
                                  style: TextStyle(
                                      color: sizeText1Color,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  sizeText2,
                                  style: TextStyle(
                                      color: sizeText2Color,
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
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
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: index == selectedIndex
                                                  ? sizeActiveColor
                                                  : sizeInactiveColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: index == selectedIndex
                                                  ? Border.all(
                                                      color:
                                                          sizeActiveBorderColor,
                                                      width: 2)
                                                  : Border.all(
                                                      color:
                                                          sizeInactiveBorderColor,
                                                      width: 2)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '$number',
                                                style: TextStyle(
                                                    color: index ==
                                                            selectedIndex
                                                        ? sizeNameActiveColor
                                                        : sizeNameInactiveColor,
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
                            SizedBox(height: 12),
                            Text(
                              suggestionText,
                              style: TextStyle(
                                  color: suggestionTextColor,
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
                                      shadowColor: suggestionCardShadowColor,
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
                                                "assets/images/LadiesBag/$image.jpg",
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
                                                      color:
                                                          suggestionCardIconColor,
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
                                                          color:
                                                              suggestionCardDiscountColor,
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
                    color: container_Color,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: container_ShadowColor,
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
                          Navigator.pushNamed(context, '/cargocart');
                          func.additem({
                            "name": name,
                            "image": "assets/images/MenShoes/$image.png",
                            "price": offerPrice1,
                            "cost": offerPrice1 * quantity,
                            "quantity": quantity
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                elevatedButtonBackgroundColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                            fixedSize: MaterialStateProperty.all(
                                Size((bodyWidth / 3) + 25, 50))),
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          color: elevatedButtonIconColor,
                          size: 20,
                        ),
                        label: Text(
                          buttonName1,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: elevatedButtonTextColor),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          func.additem({
                            "name": name,
                            "image": "assets/images/MenShoes/$image.png",
                            "price": offerPrice1,
                            "cost": offerPrice1 * quantity,
                            "quantity": quantity
                          });

                          bottomSheet();
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: outlinedButtonIconColor,
                          size: 20,
                        ),
                        label: Text(
                          buttonName2,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: outlinedButtonTextColor),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                            fixedSize: MaterialStateProperty.all(
                                Size((bodyWidth / 3) + 25, 50)),
                            side: MaterialStatePropertyAll(BorderSide(
                                color: outlinedButtonSideColor, width: 3))),
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
                color: bottomsheetContainerColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Divider(
                  color: bottomsheetDividerColor,
                  thickness: 4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    size: 35,
                    color: bottomsheetDoneIconColor,
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Text(
                        "${widget.details.name} ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                        maxLines: 2,
                      ),
                      Text(
                        buttomsheetText,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
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
                      Navigator.pushNamed(context, '/cargocart');
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: outlinedButtonShopping_cartIconColor,
                      size: 20,
                    ),
                    label: Text(
                      buttomsheetButtonName1,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: outlinedButton_TextColor),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        fixedSize: MaterialStateProperty.all(Size(140, 50)),
                        side: MaterialStatePropertyAll(BorderSide(
                            color: outlinedButton_SideColor, width: 3))),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/shoepage');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            elevatedButton_BackgroundColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                        fixedSize: MaterialStateProperty.all(Size(230, 50))),
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: elevatedButtonShopping_bagIconColor,
                      size: 20,
                    ),
                    label: Text(
                      buttomsheetButtonName2,
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
