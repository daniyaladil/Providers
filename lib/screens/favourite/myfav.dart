import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  List<int> selectedItems=[];

  @override
  Widget build(BuildContext context) {
    final favProvider=Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav Items"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(builder: (context,value,child){
              return
                  ListView.builder(
                  itemCount: favProvider.selectedItems.length,
                  itemBuilder: (context,index){
                return ListTile(
                  onTap: () {
                    value.removeItems(value.selectedItems[index]);
                  },
                  title: Text("Item "+value.selectedItems[index].toString()),
                  trailing: Icon(Icons.favorite),
                );
              }

              );
            }
            ),
          )
        ],
      ),
    );
  }
}
