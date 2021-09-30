import 'package:flutter/material.dart';

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
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => _ListTilePlatos(),
      ),
    );
  }
}

class _ListTilePlatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        child: Image(
          image: AssetImage('assets/images/food-banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pollo asado con Papas Fritas',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            '\$5.500',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 5),
        ],
      ),
      subtitle: Text(
        'Exquisito plato de Pollo asado a las brasa con crujientes papas fritas.',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
      ),
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
