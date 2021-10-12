import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigloxxi/src/services/services.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foodPlatesService = Provider.of<FoodPlateService>(context).foodPlates;
    print('**********************  $foodPlatesService');
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
      body: _ListViewFoodPlates(foodPlatesService),
    );
  }
}

class _ListViewFoodPlates extends StatelessWidget {
  final List<PlateResponse> plates;

  const _ListViewFoodPlates(this.plates);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: this.plates.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return _ListTilePlatos(this.plates, index);
      },
    );
  }
}

class _ListTilePlatos extends StatelessWidget {
  final List<PlateResponse> plates;
  final int index;

  const _ListTilePlatos(
    this.plates,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final plate = this.plates[index].data![index];
    return ListTile(
      leading: Container(
        child: Image(
          // image: AssetImage('assets/images/food-banner.jpg'),
          image: NetworkImage(plate.link),
          fit: BoxFit.cover,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Pollo asado con Papas Fritas',
          //   style: TextStyle(fontSize: 14),
          // ),
          Text(
            plate.name,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          // Text(
          //   '\$5.500',
          //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          // ),
          Text(
            '\$${plate.price}',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 5),
        ],
      ),
      subtitle: Text(
        plate.description,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
      ),
      // Text(
      //   'Exquisito plato de Pollo asado a las brasa con crujientes papas fritas.',
      //   style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
      // ),
      isThreeLine: true,
      trailing: Icon(
        Icons.chevron_right,
        color: Color(0xffFD9827),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'details');
      },
    );
  }
}
