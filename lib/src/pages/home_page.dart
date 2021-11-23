import 'package:flutter/material.dart';
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
      floatingActionButton: ShoppingCartButton(
        onPressed: () {
          Navigator.pushNamed(context, 'cart_page');
        },
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
            ? Image(
                image: NetworkImage(foodPlate.link!),
                fit: BoxFit.cover,
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
