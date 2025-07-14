import 'package:flutter/material.dart';

class ListLoadingComponent extends StatelessWidget {
  final int length;

  const ListLoadingComponent({
    super.key,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, _) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.link),
            title: Column(
              spacing: 7.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 200.0,
                  color: Colors.grey.shade200,
                ),
                Container(
                  height: 14,
                  width: 100.0,
                  color: Colors.grey.shade200,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
