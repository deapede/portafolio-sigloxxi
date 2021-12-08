import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigloxxi/src/models/models.dart';
import 'package:sigloxxi/src/services/services.dart';

class TablesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tablesService = Provider.of<TablesService>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff1F1F1F),
        // backgroundColor: Color(0xffFD9827),
        backgroundColor: Color(0xffEA7B00),
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Mesas Disponibles',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: tablesService.handleRefresh,
        color: Color(0xffEA7B00),
        child: _BuildListViewTables(tablesService: tablesService),
      ),
    );
  }
}

class _BuildListViewTables extends StatelessWidget {
  const _BuildListViewTables({
    Key? key,
    required this.tablesService,
  }) : super(key: key);

  final TablesService tablesService;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: tablesService.tables.length,
      itemBuilder: (context, index) {
        return _SingleCard(
          provider: tablesService.tables[index],
          tablesService: tablesService,
        );
      },
    );
  }
}

class _SingleCard extends StatelessWidget {
  final StatusMesa provider;
  final TablesService tablesService;

  const _SingleCard({
    Key? key,
    required this.provider,
    required this.tablesService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _alertaOcuparMesa(context);
      },
      child: Container(
        margin: EdgeInsets.all(15),
        height: 180,
        decoration: _decorationCard(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey.withOpacity(0.4),
              child: Image(
                image: AssetImage('assets/images/restaurant.png'),
                fit: BoxFit.contain,
                width: 45,
              ),
              radius: 30,
            ),
            SizedBox(height: 10),
            Text(
              'Mesa ${provider.number}',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: (provider.status) ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(width: 5),
                _estadosMesa(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _alertaOcuparMesa(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¡Aviso!'),
        content: (provider.status == false)
            ? Text('¿Desea Habilitar esta mesa?')
            : Text('¿Desea ocupar esta mesa?'),
        actions: [
          TextButton(
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: Color(0xffEA7B00),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text(
              'Aceptar',
              style: TextStyle(
                color: Color(0xffEA7B00),
              ),
            ),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xffEA7B00),
                          strokeWidth: 2,
                        ),
                        SizedBox(width: 10),
                        Text('Procesando...'),
                      ],
                    ),
                  ),
                ),
              );
              await tablesService.updtTables(
                provider.number,
                (provider.status == false) ? true : false,
                provider.userId,
                provider.id,
              );

              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration _decorationCard() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 5),
          blurRadius: 10,
        ),
      ],
    );
  }

  Widget _estadosMesa() {
    String estado = '';
    switch (provider.status) {
      case true:
        estado = 'Disponible';
        break;
      case false:
        estado = 'Ocupada';
        break;
    }

    return Text(
      estado,
      style: TextStyle(
        color: (provider.status) ? Colors.green : Colors.red,
        fontSize: 12,
      ),
    );
  }
}
