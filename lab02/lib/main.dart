import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Car {
  Car(this.make, this.model, this.price);

  final String make;
  final int model;
  final int price;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarTablePage(),
    );
  }
}

class CarTablePage extends StatefulWidget {
  const CarTablePage({super.key});

  @override
  State<CarTablePage> createState() => _CarTablePageState();
}

class _CarTablePageState extends State<CarTablePage> {
  int currentIndex = 0;

  final List<Car> cars = [
    Car("Mercedes", 2022, 1200000),
    Car("Audi", 2023, 352900),
    Car("Perodua", 2024, 50000),
  ];

  int? sortColumnIndex = 2;
  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    cars.sort((a, b) => a.price.compareTo(b.price));
  }

  void sortBy(
    int columnIndex,
    bool ascending,
    int Function(Car a, Car b) compare,
  ) {
    setState(() {
      cars.sort((a, b) => ascending ? compare(a, b) : compare(b, a));
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Table Page"),
        backgroundColor: const Color.fromARGB(255, 30, 9, 53),
        foregroundColor: const Color.fromARGB(255, 233, 221, 243),
      ),

      body: DataTable(
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
        border: TableBorder.all(color: Colors.black),
        headingRowColor: WidgetStateProperty.all<Color>(
          const Color.fromARGB(255, 243, 222, 246),
        ),
        columns: [
          DataColumn(
            label: const Text("Car Make"),
            onSort: (i, ascending) =>
                sortBy(i, ascending, (a, b) => a.make.compareTo(b.make)),
          ),
          DataColumn(
            label: const Text("Model"),
            onSort: (i, ascending) =>
                sortBy(i, ascending, (a, b) => a.model.compareTo(b.model)),
          ),
          DataColumn(
            label: const Text("Price"),
            onSort: (i, ascending) =>
                sortBy(i, ascending, (a, b) => a.price.compareTo(b.price)),
          ),
        ],
        rows: cars.map((Car car) {
          return DataRow(
            cells: [
              DataCell(Text(car.make)),
              DataCell(Text("${car.model}")),
              DataCell(Text("${car.price}")),
            ],
          );
        }).toList(),
      ),
    );
  }
}