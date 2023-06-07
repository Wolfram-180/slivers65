import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const _title = 'Slivers Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _slivers = 10;
  String _imgUrl =
      'https://raw.githubusercontent.com/Wolfram-180/apps_resources/main/surf_places/cfshp1.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /* SliverAppBar(
            floating: true,
            snap: true,
            pinned: true,
            title: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                _imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ), */
          /*        SliverToBoxAdapter(
            child: Container(
              height: 150,
              child: Center(child: Text('text')),
            ),
          ), */
          SliverPersistentHeader(
            delegate: StickyHeaderDelegate(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                for (int i = 0; i < _slivers; i++)
                  Container(
                    height: 200,
                    color: i % 2 == 0 ? Colors.green : Colors.red,
                  )
              ],
            ),
          ),
          SliverPersistentHeader(
            delegate: StickyHeaderDelegate(),
            pinned: true,
          ),
          /*       SliverToBoxAdapter(
            child: Container(
              height: 150,
              child: Center(child: Text('text')),
            ),
          ), */
          SliverList(
            delegate: SliverChildListDelegate(
              [
                for (int i = 0; i < _slivers; i++)
                  Container(
                    height: 200,
                    color: i % 2 == 0 ? Colors.yellow : Colors.black,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('text2'),
      ),
    );
  }

  @override
  double get maxExtent => 150.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
