import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final VoidCallback onTap;
  bool isLoading;
  RoundedButton({required this.isLoading,required this.onTap, Key? key}) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 63, 64, 74),
              Color.fromARGB(255, 86, 93, 102)
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child:  widget.isLoading ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
