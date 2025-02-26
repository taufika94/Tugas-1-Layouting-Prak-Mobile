import 'package:flutter/material.dart';
import 'bakery_item_card.dart';
import 'login_page.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  String _quantity = '';
  String _selectedItem = 'Roti Tawar';
  String _orderDetails = '';
  double _totalPrice = 0.0;

  // Harga per item
  final Map<String, double> _prices = {
    'Roti Tawar': 10000,
    'Croissant': 15000,
    'Ciabatta': 12000,
    'Sourdough': 20000,
  };

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      int quantity = int.parse(_quantity);
      double price = _prices[_selectedItem]!;
      setState(() {
        _totalPrice = price * quantity;
      });
      // Tampilkan dialog konfirmasi
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Konfirmasi Pesanan'),
            content: Text(
              'Apakah Anda yakin ingin memesan?\nRoti: $_selectedItem\nJumlah: $quantity\nTotal: Rp $_totalPrice',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
                },
                child: Text('Batal'),
              ),
              TextButton(
                onPressed: () {
                  // Lakukan tindakan pemesanan di sini
                  setState(() {
                    _orderDetails =
                        'Roti: $_selectedItem\nJumlah: $quantity\nTotal: Rp $_totalPrice';
                  });
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Pesanan berhasil!')));
                  Navigator.of(context).pop(); // Tutup dialog
                },
                child: Text('Konfirmasi'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPN Bakery"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Kembali ke halaman login tanpa tombol back
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Menambahkan SingleChildScrollView untuk menghindari overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Menampilkan beberapa item roti secara horizontal
              Container(
                height: 190, // Tinggi container untuk item roti
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BakeryItemCard(
                        imagePath: 'assets/tawar.jpg',
                        itemName: 'Roti Tawar',
                        itemPrice: 'Rp 10.000',
                      ),
                      SizedBox(width: 10), // Jarak antar item
                      BakeryItemCard(
                        imagePath: 'assets/croissants.jpg',
                        itemName: 'Croissant',
                        itemPrice: 'Rp 15.000',
                      ),
                      SizedBox(width: 10), // Jarak antar item
                      BakeryItemCard(
                        imagePath: 'assets/ciabatta.jpg',
                        itemName: 'Ciabatta',
                        itemPrice: 'Rp 12.000',
                      ),
                      SizedBox(width: 10), // Jarak antar item
                      BakeryItemCard(
                        imagePath: 'assets/sourdough.jpg',
                        itemName: 'Sourdough',
                        itemPrice: 'Rp 20.000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Jarak sebelum form input
              // Form input untuk pemesanan
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedItem,
                      items:
                          _prices.keys.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value!;
                        });
                      },
                      decoration: InputDecoration(labelText: 'Pilih Roti'),
                    ),
                    SizedBox(height: 10), // Jarak antar elemen
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Jumlah'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _quantity = value;
                        });
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.parse(value) <= 0) {
                          return 'Jumlah harus berupa angka positif';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20), // Jarak antar elemen
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Pesan'),
                    ),
                    SizedBox(height: 20), // Jarak antar elemen
                    if (_orderDetails.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF443627)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          'Detail Pesanan:\n$_orderDetails',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
