import 'package:app_inventory/components/components.dart';
import 'package:app_inventory/models/item_detail.dart';
import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/models/providresdb.dart';
import 'package:app_inventory/screens/contants.dart';
import 'package:app_inventory/themes/app_theme.dart';
import 'package:app_inventory/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class FormItemScreen extends StatelessWidget {
  const FormItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> formValues = {
      'userName': 'dicapisar@gmail.com',
      'password': '12345',
    };

    final FormScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as FormScreenArguments;

    final bool isRead = args.isRead ?? false;

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: AppTheme.primary,
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        height: height,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Form(
                    key: myFormKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Id',
                                hintText: 'Id',
                                keyboardType: TextInputType.number,
                                formProperty: 'id',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Estado',
                                hintText: 'Estado',
                                keyboardType: TextInputType.text,
                                formProperty: 'text',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Articulo',
                                hintText: 'Nombre del Articulo',
                                keyboardType: TextInputType.name,
                                formProperty: 'nameArticle',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Cantidad',
                                hintText: 'Cantidad',
                                keyboardType: TextInputType.number,
                                formProperty: 'count',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Precio por Unidad',
                                hintText: '\$ XX.XXX',
                                keyboardType: TextInputType.number,
                                formProperty: 'cost',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Marca',
                                hintText: 'Marca',
                                keyboardType: TextInputType.text,
                                formProperty: 'nameBrand',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                            if (!isRead) const _ButtonPlus()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomInputField(
                                labelText: 'Tipo de Articulo',
                                hintText: 'Tipo de Articulo',
                                keyboardType: TextInputType.text,
                                formProperty: 'typeItem',
                                formValues: formValues,
                                readOnly: isRead,
                              ),
                            ),
                            if (!isRead) const _ButtonPlus()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const _OptiosButtonsSearch(),
                        if (isRead) _TitleProviders(width: width),
                        if (isRead)
                          ListItem(
                              itemDetail: getDataItemsForm(),
                              screenNameRoute: 'form')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _FloatingAcctionButton(
        isRead: isRead,
      ),
    );
  }
}

class _TitleProviders extends StatelessWidget {
  final double width;
  const _TitleProviders({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: 30,
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 0.5,
            offset: Offset.fromDirection(1, 4),
          )
        ],
      ),
      child: const Center(
        child: Text(
          'Proveedores',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _FloatingAcctionButton extends StatelessWidget {
  final bool isRead;
  const _FloatingAcctionButton({
    Key? key,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Icon saveIcon = Icon(
      Icons.save,
      size: 45,
    );
    const Icon backIcon = Icon(
      Icons.arrow_back,
      size: 45,
    );

    return FloatingActionButton(
      backgroundColor: isRead ? Colors.red : Colors.green,
      onPressed: () {
        Navigator.pop(context);
      },
      child: isRead ? backIcon : saveIcon,
    );
  }
}

class _ButtonPlus extends StatelessWidget {
  const _ButtonPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.add,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}

class _OptiosButtonsSearch extends StatelessWidget {
  const _OptiosButtonsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _ButtonSearch(
          bigIcon: Icon(Icons.qr_code),
          smallIcon: Icon(Icons.add),
        ),
        SizedBox(
          width: 10,
        ),
        _ButtonSearch(
          bigIcon: Icon(
            Icons.line_weight_sharp,
          ),
          smallIcon: Icon(Icons.add),
        ),
      ],
    );
  }
}

class _ButtonSearch extends StatelessWidget {
  final Icon bigIcon;
  final Icon smallIcon;
  const _ButtonSearch(
      {Key? key, required this.bigIcon, required this.smallIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
          ),
          child: Icon(
            bigIcon.icon,
            color: Colors.white,
            size: 120,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            smallIcon.icon,
            color: Colors.white,
            size: 40,
          ),
        )
      ],
    );
  }
}

List<ItemDetail> getDataItemsForm() {
  final List<ItemDetail> listItemDetail = [];
  for (var inputRecord in getDataProvidersDBForm()) {
    List<String> details = [];
    AdviseItemLIst advise = AdviseItemLIst('', Colors.transparent);

    details.add(inputRecord.phoneNumber);
    details.add(inputRecord.address);
    details.add('');

    final itemDetail = ItemDetail(
      inputRecord.id,
      inputRecord.name,
      inputRecord.email,
      details,
      advise,
    );

    listItemDetail.add(itemDetail);
  }

  return listItemDetail;
}

List<ProvidersDB> getDataProvidersDBForm() {
  return Constant().getDataProviderDB();
}