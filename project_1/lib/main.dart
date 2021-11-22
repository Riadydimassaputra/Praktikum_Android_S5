import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Belajar Flutter",
    home: Aplikasiku(),
  ));
}

class Aplikasiku extends StatelessWidget {
  const Aplikasiku({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Ku'),
      ),
      body: Center(
        child: Column(
          children: [
          
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: AssetImage('assets/imgs/android.png'),
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                borderRadius: BorderRadius.circular(19),
              ),
            ),
           
            Container(
              child: Image.network('https://picsum.photos/250?image=9'),
              width: 100,
              height: 100,
            ),
          ],
        ),
        ),
    );
  }
}