import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: const Color(0xffF6F9FA),
            child: Column(
              children: [
                const _Header(),
                const _SearchField(),
                const _CategoriesScroll(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const _CategoryList(
                          title: 'Pizzas',
                          items: [
                            _ItemDetails(
                              name: 'Pizza veloper',
                              description:
                                  'Lorem ipsum dolor sit amet, consetetur',
                              price: 150.0,
                              previousPrice: 170.0,
                              image: 'pizza_1',
                              porcentageDiscount: 20,
                            ),
                            _ItemDetails(
                              name: 'Pizza Cantos',
                              description:
                                  'Lorem ipsum dolor sit amet, consetetur',
                              price: 70.0,
                              image: 'pizza_2',
                            ),
                          ],
                        ),
                        const _CategoryList(title: 'Hamburguesas', items: [
                          _ItemDetails(
                            name: 'Burguer miau',
                            description:
                                'Lorem ipsum dolor sit amet, consetetur',
                            price: 70.0,
                            image: 'hamburguer_1',
                          ),
                          _ItemDetails(
                            name: 'Burguer miau',
                            description:
                                'Lorem ipsum dolor sit amet, consetetur',
                            price: 70.0,
                            image: 'hamburguer_1',
                          ),
                          _ItemDetails(
                            name: 'Burguer miau',
                            description:
                                'Lorem ipsum dolor sit amet, consetetur',
                            price: 70.0,
                            image: 'hamburguer_1',
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({Key? key, required this.title, required this.items})
      : super(key: key);

  final String title;
  final List<_ItemDetails> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(title,
                style: const TextStyle(
                  color: Color(0xff341557),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(height: 5.0),
          ...items
        ],
      ),
    );
  }
}

class _ItemDetails extends StatelessWidget {
  const _ItemDetails({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.previousPrice,
    this.porcentageDiscount,
  }) : super(key: key);

  final String name;
  final String description;
  final String image;
  final double price;
  final double? previousPrice;
  final double? porcentageDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4A72A8).withOpacity(.16),
            blurRadius: 15,
            offset: const Offset(0, 15),
          )
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset('assets/$image.png'),
                        if (porcentageDiscount != null)
                          Positioned(
                            left: -5,
                            top: -5,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffEE3169),
                              radius: 15,
                              child: Text(
                                '${porcentageDiscount!.toStringAsFixed(0)}%',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0D1863),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 8,
                        color: Color(0xff0D1863),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xffC3D61B),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    if (previousPrice != null)
                      Row(
                        children: [
                          const Text(
                            'Antes ',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xffBAC8D3),
                            ),
                          ),
                          Text(
                            '\$${previousPrice!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xffBAC8D3),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              backgroundColor: const Color(0xff572D86),
              child: SvgPicture.asset(
                'assets/shopping-cart.svg',
                height: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoriesScroll extends StatelessWidget {
  const _CategoriesScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeaderTitles(),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 15.0),
              const _CategoryWidget(
                label: 'Pizzas',
                image: 'category_1',
                isSelected: true,
                numberNotification: 2,
              ),
              const _CategoryWidget(label: 'Burger', image: 'category_2'),
              const _CategoryWidget(label: 'Sandwich', image: 'category_3'),
              _CategoryWidget(label: 'Desayuno', image: 'category_4'),
              _CategoryWidget(label: 'Brocheta', image: 'category_5'),
              _CategoryWidget(label: 'Brocheta 2', image: 'category_1'),
              _CategoryWidget(
                label: 'Brocheta 3',
                image: 'category_2',
                numberNotification: 3,
              ),
            ],
          ),
        ),
        // List View
      ],
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.image,
    this.numberNotification = 0,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final String image;
  final int numberNotification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Color(0xff572D86) : Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: 65.0,
                  height: 50.0,
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset('assets/$image.svg'),
                ),
                Text(
                  '$label',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Color(0xff707070),
                    fontSize: isSelected ? 10.0 : 8.0,
                  ),
                )
              ],
            ),
          ),
          if (numberNotification > 0)
            Positioned(
              right: -5,
              top: -5,
              child: CircleAvatar(
                child: Text(
                  '$numberNotification',
                  style: TextStyle(color: Colors.white),
                ),
                radius: 12,
                backgroundColor: Color(0xffC3D61B),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeaderTitles extends StatelessWidget {
  const _HeaderTitles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Categorias',
            style: TextStyle(
              color: Color(0xff0D1863),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            'Ofertas',
            style: TextStyle(
              color: Color(0xffE0201A),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/search.svg',
            color: const Color(0xffCCCDDF),
          ),
          const SizedBox(width: 20.0),
          SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.1)),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Colors.transparent, width: 0.1)),
                hintText: 'Que quieres comer hoy?',
                hintStyle: const TextStyle(
                  color: Color(0xff8b8b8b),
                  fontSize: 11.0,
                ),
                contentPadding: const EdgeInsets.all(0),
                alignLabelWithHint: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: Row(
        children: [
          SvgPicture.asset('assets/menu_icon.svg'),
          const SizedBox(width: 21),
          const Text(
            'Entrega en: ',
            style: TextStyle(
              color: Color(0xff9691AE),
              fontSize: 15,
            ),
          ),
          const Text(
            'Peru 2',
            style: TextStyle(
              color: Color(0xff341557),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 25,
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 15,
            child: Icon(Icons.supervised_user_circle_rounded),
          ),
        ],
      ),
    );
  }
}
