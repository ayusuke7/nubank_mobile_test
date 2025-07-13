import 'package:flutter/material.dart';

import '../../../config/di/setup_injector.dart';
import '../../../core/utils/validator.dart';
import '../controllers/home_controller.dart';
import 'loading_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _inputController = TextEditingController();
  final _homeController = it<HomeController>();

  String? _error;

  void _createAlias() {
    if (Validator.isURL(_inputController.text)) {
      _homeController.createAlias(_inputController.text);
      _inputController.clear();
      _error = null;
    } else {
      _error = 'Invalid URL';
    }

    setState(() {});
  }

  void _errorListener() {
    if (_homeController.value.status.isError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.yellow.shade100,
          content: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(
              Icons.error,
            ),
            title: Text(_homeController.value.error ?? 'Unknown error'),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _homeController.addListener(_errorListener);
  }

  @override
  void dispose() {
    _inputController.dispose();
    _homeController.removeListener(_errorListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shorten URL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10.0,
              children: [
                Flexible(
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      hintText: 'Shorten URL',
                      filled: true,
                      isDense: true,
                      fillColor: Color(0xFFE3E3E3),
                      contentPadding: const EdgeInsets.fromLTRB(
                        20.0,
                        10,
                        10,
                        10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _createAlias,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
            Offstage(
              offstage: _error == null,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "$_error",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 0, 20),
              child: Text(
                'Recently shortned URLs',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _homeController,
                builder: (context, state, _) {
                  if (state.status.isLoading) {
                    return ListLoadingComponent(
                      length: state.aliases.length + 1,
                    );
                  }

                  return ListView.builder(
                    itemCount: state.aliases.length,
                    itemBuilder: (context, index) {
                      final alias = state.aliases[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.link),
                          title: Text(alias.alias),
                          subtitle: Text(alias.url),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
