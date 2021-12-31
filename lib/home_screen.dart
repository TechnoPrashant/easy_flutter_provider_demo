import 'package:flutter/material.dart';
import 'package:proivder/provider_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProviderViewModel _providerViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _providerViewModel = Provider.of<ProviderViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ProviderViewModel>(builder: (context, item, child) {
      return Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  child: Text(item.counter.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 100,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(onTap: () {
                    item.incrementCounter();

                  }, child: customButton('+')),
                  const SizedBox(
                    width: 50,
                  ),
                  InkWell(onTap: () {
                    item.decrementCounter();

                  }, child: customButton('-'))
                ],
              )
            ],
          ),
        ),
      );
    }));
  }

  Widget customButton(String btnName) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(btnName,
            style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 50,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
