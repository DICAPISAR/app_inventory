import 'package:app_inventory/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var spaceBettwenOptions = width * 0.05;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spaceBettwenOptions),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Ingresar Articulos',
                pathImage: 'assets/images/input_items.png',
                singularName: 'Ingreso de Articulo',
                nameNextScreen: 'listInputItems',
              ),
              OptionHomeMenu(
                title: 'Retirar Articulos',
                pathImage: 'assets/images/output_items.png',
                singularName: 'Retiro de Articulo',
                nameNextScreen: 'listOutputItems',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Articulos',
                pathImage: 'assets/images/items.png',
                singularName: 'Articulo',
                nameNextScreen: 'listItems',
              ),
              OptionHomeMenu(
                title: 'Proveedores',
                pathImage: 'assets/images/providers.png',
                singularName: 'Proveedor',
                nameNextScreen: 'listProviders',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Marcas',
                pathImage: 'assets/images/brands.png',
                singularName: 'Marca',
                nameNextScreen: 'listBrands',
              ),
              OptionHomeMenu(
                title: 'Tipos de Art??culos',
                pathImage: 'assets/images/type_items.png',
                singularName: 'Tipo de Articulo',
                nameNextScreen: 'listTypesItems',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              OptionHomeMenu(
                title: 'Gr??ficas',
                pathImage: 'assets/images/graph.png',
                singularName: 'Grafica',
                nameNextScreen: 'graphics',
              ),
              OptionHomeMenu(
                title: 'Configuraci??n',
                pathImage: 'assets/images/settings.png',
                singularName: 'Configuraci??n',
                nameNextScreen: 'list',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
