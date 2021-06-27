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
            color: Color(0xffF6F9FA),
            child: Column(
              children: [
                _Header(),
                _SearchField(),
                Column(
                  children: [
                    _HeaderTitles(),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 15.0),
                          _CategoryWidget(
                            label: 'Pizzas',
                            image: 'category_1',
                            isSelected: true,
                            numberNotification: 2,
                          ),
                          _CategoryWidget(label: 'Burger', image: 'category_2'),
                          _CategoryWidget(
                              label: 'Sandwich', image: 'category_3'),
                          _CategoryWidget(
                              label: 'Desayuno', image: 'category_4'),
                          _CategoryWidget(
                              label: 'Brocheta', image: 'category_5'),
                          _CategoryWidget(
                              label: 'Brocheta 2', image: 'category_1'),
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
                )
              ],
            ),
          ),
        ),
      ),
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
          Text(
            'Categorias',
            style: TextStyle(
              color: Color(0xff0D1863),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
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
            color: Color(0xffCCCDDF),
          ),
          SizedBox(width: 20.0),
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
          SizedBox(width: 21),
          Text(
            'Entrega en: ',
            style: TextStyle(
              color: Color(0xff9691AE),
              fontSize: 15,
            ),
          ),
          Text(
            'Peru 2',
            style: TextStyle(
              color: Color(0xff341557),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 25,
          ),
          Spacer(),
          CircleAvatar(
            radius: 15,
            child: Icon(Icons.supervised_user_circle_rounded),
          ),
        ],
      ),
    );
  }
}
