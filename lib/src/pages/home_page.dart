import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sigloxxi/src/services/services.dart';
import 'package:sigloxxi/src/widgets/custom_floating_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Color(0xff1F1F1F),
        // backgroundColor: Color(0xffFD9827),
        backgroundColor: Color(0xffEA7B00),
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Siglo XXI',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      body: _ListViewFoodPlates(),
      drawer: _Drawer(),
      floatingActionButton: ShoppingCartButton(
        onPressed: () {
          Navigator.pushNamed(context, 'cart_page');
        },
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            /// Drawer header
            Container(
              height: 200,
              color: Color(0xff1F1F1F),
              child: DrawerHeader(
                child: SvgPicture.asset('assets/svgs/cutlery.svg'),
              ),
            ),

            /// Cuerpo
            SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Disponibilidad de mesas',
                      style: TextStyle(
                        color: Color(0xff1F1F1F),
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Color(0xff1F1F1F),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'tables');
                    },
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    title: Text(
                      'Pagar cuenta',
                      style: TextStyle(
                        color: Color(0xff1F1F1F),
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Color(0xff1F1F1F),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'pagar_cuenta');
                    },
                  ),
                  Divider(color: Colors.grey),
                ],
              ),
            ),

            // Spacer(),
            // Container(
            //   height: 70,
            //   child: TextButton.icon(
            //     onPressed: ,
            //     icon: Icon(Icons.logout, color: Color(0xff1F1F1F)),
            //     label: Text(
            //       'Salir',
            //       style: TextStyle(
            //         color: Color(0xff1F1F1F),
            //         // color: Color(0xffEA7B00),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _ListViewFoodPlates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodPlatesService = Provider.of<FoodPlateService>(context);
    return ListView.separated(
      itemCount: foodPlatesService.foodPlates.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final foodPlates = foodPlatesService.foodPlates[index];
        return _ListTilePlatos(foodPlates);
      },
    );
  }
}

class _ListTilePlatos extends StatelessWidget {
  final PlatesResponse foodPlate;

  const _ListTilePlatos(
    this.foodPlate,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 100,
        width: 100,
        child: (foodPlate.link != null)
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage(foodPlate.link!),
                  fit: BoxFit.cover,
                ),
              )
            : Image(
                image: NetworkImage(
                    'https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-no-image-available-icon-flat.jpg'),
                fit: BoxFit.contain,
              ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foodPlate.name,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            '\$${foodPlate.price}',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 5),
        ],
      ),
      subtitle: Text(
        foodPlate.description,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Color(0xffFD9827),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: foodPlate);
      },
    );
  }
}
