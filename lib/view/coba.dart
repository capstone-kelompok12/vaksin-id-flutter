import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/detail_faskes_view_model.dart';

class Coba extends StatelessWidget {
  const Coba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailFasKesViewModel>(
        builder: (context, value, child) => ListView.builder(
          itemBuilder: (context, index) => ElevatedButton(
            onPressed: () {},
            child: Text('sd'),
          ),
        ),
      ),
    );
  }
}
