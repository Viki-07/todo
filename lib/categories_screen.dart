import 'package:flutter/material.dart';

class CategoriesScreeen extends StatelessWidget {
  const CategoriesScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
      
          return SizedBox(
            width: 175,
            child: Card(
              elevation: 10,
              
              // color: Colors.indigo.shade900,
              child: Column(
                children: [
                  Row(
                    children: const [Text('Personal')],
                  )
                ],
              ),
            ),
          );
        });
  }
}
