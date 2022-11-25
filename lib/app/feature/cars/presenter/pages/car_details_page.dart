import 'package:flutter/material.dart';
import 'package:mobile_motors/app/feature/cars/presenter/pages/google_maps_page.dart';
import 'package:video_player/video_player.dart';

import '../../domain/entities/car_entity.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({
    Key? key,
    required this.carEntity,
  }) : super(key: key);

  final CarEntity carEntity;

  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  CarEntity get car => widget.carEntity;
  VideoPlayerController? _controller;
  @override
  void initState() {
    if(car.urlVideo != null){
     _controller = VideoPlayerController.network(car.urlVideo!)
      ..initialize().then((_) {
        setState(() {
          _controller!.play();
        
        });
      });}
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation:  FloatingActionButtonLocation.centerFloat,
      floatingActionButton: car.urlVideo != null ? FloatingActionButton(
        child: _controller!.value.isPlaying
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
              ? _controller!.pause()
              : _controller!.play();
          });
        },
        
      ) : null,
     
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: car.urlVideo != null ? SizedBox(
                height: 230,
                width: screen.width,
                    child: _controller!.value.isInitialized
                        ? VideoPlayer(_controller!)
                        : Container(),
                  ) : null,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Card(
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                height: 150,
                width: 135,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: car.urlPhoto != null ? NetworkImage(car.urlPhoto!) : const NetworkImage('https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text('Carro: ',style: TextStyle( fontWeight: FontWeight.bold),),
                  Text(car.name),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Marca: ',style: TextStyle( fontWeight: FontWeight.bold),),
                  Text(car.description),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Categoria: ',style: TextStyle( fontWeight: FontWeight.bold),),
                  Text(car.type),
                ],
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  GoogleMapsPage(latitude: double.parse(car.latitude!), longitude: double.parse(car.longitude!)),
                    ),
                  );
                
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: const Center(
                    child: Text(
                      'Abrir Maps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
              ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieDetailContainerWidget extends StatefulWidget {
  const MovieDetailContainerWidget({
    Key? key,
    required this.icon,
    required this.detail,
  }) : super(key: key);

  final Widget icon;
  final String detail;

  @override
  State<MovieDetailContainerWidget> createState() =>
      _MovieDetailContainerWidgetState();
}

class _MovieDetailContainerWidgetState
    extends State<MovieDetailContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          widget.icon,
          const SizedBox(
            height: 32,
          ),
          Text(widget.detail),
        ],
      ),
    );
  }
}
