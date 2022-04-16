import 'dart:math';

import 'package:flutter/material.dart';

import '../models/coffee_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.3);
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = controller.page!;
    });
  }

  @override
  initState() {
    super.initState();
    controller.addListener(_listener);
  }

  @override
  dispose() {
    controller.removeListener(_listener);
    controller.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    final index = _currentPage.ceil();
    final coffee = listCoffees[index];
    return Center(
      child: Column(
        children: [
          Text(
            'R\$ ${coffee.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            coffee.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageview() {
    return Transform.scale(
      scale: 1.5,
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        itemCount: listCoffees.length,
        itemBuilder: (context, index) {
          final coffee = listCoffees[index];
          final percent = 1 - (_currentPage - index);
          final value = percent.clamp(0.0, 1.0);
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(value),
            child: Opacity(
              opacity: value,
              child: Image.network(coffee.image),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          color: Colors.brown[200],
        ),
        _buildHeader(),
        _buildPageview(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}
