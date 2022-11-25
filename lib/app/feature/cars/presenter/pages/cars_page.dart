import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_motors/app/feature/auth/presenter/controller/login_controller.dart';
import 'package:mobile_motors/app/feature/cars/domain/entities/car_entity.dart';
import 'package:mobile_motors/app/feature/cars/presenter/controller/car_controller.dart';
import 'package:mobile_motors/app/feature/cars/presenter/pages/car_details_page.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);
  static const String routeName = '/CarsPage';

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {

  final controller = GetIt.I.get<CarController>();
  final authController = GetIt.I.get<LoginController>();

  @override
  void initState() {
    controller.getCars();
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon:  Icon(Icons.person, color: Colors.white),
            onPressed: null,
          ),
          actions: [
            Padding(
              padding:const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {
                  authController.logout();
                },
                icon: const Icon(Icons.logout_outlined),
              ),
            ),

          ],
        ),
        body:Padding(
          padding: const EdgeInsets.all(15),
          child: ValueListenableBuilder<List<CarEntity>>(valueListenable: controller.store.cars, builder: (context, value, child){
            return controller.store.cars.value.isEmpty ? const Center(child: CircularProgressIndicator()) : ListView.builder(itemBuilder: (context, index){
              return value.isNotEmpty ? Card(
                elevation: 3,
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: ListTile(
                    onTap: (){
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CarDetailsPage(carEntity: value[index]),
                      ),
                    );
                    },
                    leading: value[index].urlPhoto != null ? Image.network(value[index].urlPhoto!) : Image.asset('assets/images/flutter_img.png'),
                    title: Text(value[index].name),
                    subtitle: Text(value[index].description),
                  ),
                ),
              ) : const Center(child: CircularProgressIndicator());
            }, itemCount: value.length,);
          }),
        ),);
  }
}