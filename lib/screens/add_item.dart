import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/service/local_db.dart';

class HiveExamplePage extends StatefulWidget {
  const HiveExamplePage({super.key});

  @override
  State<HiveExamplePage> createState() => _HiveExamplePageState();
}

class _HiveExamplePageState extends State<HiveExamplePage> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextFormField(
              controller: nameController,
            ),
            
          ),
          ListTile(
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            title: Text(
              Hive.box(LocalDB.dbName).get('name') ?? '',
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          LocalDB.setName(nameController.text);
          setState(() {});
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
