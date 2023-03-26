import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class Dogs {
  const Dogs(
      {required this.name,
      required this.age,
      required this.description,
      required this.image});

  final String name;
  final int age;
  final String description;
  final String image;
}

final List<Dogs> dogs = <Dogs>[
  const Dogs(
      name: 'Pack',
      age: 8,
      description:
          'mostly kept as pets, though many breeds are capable of surviving on their own',
      image: 'assets/labrador-retriever-1210559_640.jpg'),
  const Dogs(
      name: 'Chihuahua',
      age: 5,
      description:
          'very friendly and lovely dog but doesn\'t fit well with strangers ',
      image: 'assets/chihuahua-453063_640.jpg'),
  const Dogs(
      name: 'Lola',
      age: 2,
      description:
          'They assist search and rescue teams in the wake of natural disasters or reports of people lost in the outdoors',
      image: 'assets/dog-g00c2179f4_640.jpg'),
  const Dogs(
      name: 'Daisy',
      age: 5,
      description:
          'help conservationists find and protect endangered species using their super-powered schnozes.',
      image: 'assets/dog-gee0bf7588_640.jpg'),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Dogs'),
      ),
      body: ListView.builder(
        itemCount: dogs.length,
        itemExtent: 60.0,
        itemBuilder: _itemlistbuilder,
      ),
    );
  }

  Widget _itemlistbuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: (() => showDialog(
            context: context,
            builder: (context) => _dialogbuilder(context, dogs[index]),
          )),
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            dogs[index].name,
            style: Theme.of(context).textTheme.headlineSmall,
          )),
    );
  }

  _dialogbuilder(BuildContext context, Dogs dog) {
    ThemeData localData = Theme.of(context);

    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.asset(
          dog.image,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                dog.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '${dog.age} months old',
                style: localData.textTheme.subtitle2
                    ?.copyWith(fontStyle: FontStyle.italic),
              ),
              Text(
                dog.description,
                style: localData.textTheme.bodySmall,
              ),
              Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          child: const Text('I\'M ALLERGIC')),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(onPressed: (() {}), child: const Text('ADOPT'))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
