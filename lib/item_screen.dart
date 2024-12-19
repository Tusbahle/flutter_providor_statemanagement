import 'package:flutter/material.dart';
import 'package:item_store/item_controller.dart';
import 'package:provider/provider.dart';

class ItemScreen extends StatelessWidget {
  var _itemField = new TextEditingController();
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item store"),
      ),
      body: Column(
        children: [
          //input field
          TextFormField(
            controller: _itemField,
            decoration: InputDecoration(
                labelText: "Enter item name",
                suffix: IconButton(
                    onPressed: () {
                      Provider.of<ItemController>(ctx, listen: false)
                          .addItem(_itemField.text);
                      _itemField.clear();
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ))),
          ),
//listviev
          Expanded(child: Consumer<ItemController>(
              builder: (context, itemController, child) {
            return ListView.builder(
              itemCount: itemController.items.length,
              itemBuilder: (a, index) {
                return ListTile(
                  title: Text(itemController.items[index]),
                  trailing: IconButton(onPressed: (){
                      Provider.of<ItemController>(context, listen: false).removeItem(index);
                  }, icon: Icon(Icons.remove_circle_rounded, color: Colors.red,)),
                );
              },
            );
          }))
        ],
      ),
    );
  }
}
