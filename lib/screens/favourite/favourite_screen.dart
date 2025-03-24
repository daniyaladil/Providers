import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/favourite_provider.dart';
import 'package:provider_learning/screens/favourite/myfav.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav Items"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteScreen()));
            },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [ 
          Expanded(
            child: ListView.builder(
                itemBuilder: (context,index){
                  return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: () {
                        value.selectedItems.contains(index)?value.removeItems(index):value.addItems(index);
                      },
                      title: Text("Item "+index.toString()),
                      trailing: Icon(value.selectedItems.contains(index)?Icons.favorite:Icons.favorite_border),
                    );
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}
