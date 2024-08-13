import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CarDisplay extends StatelessWidget {
  const CarDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Transform.scale(
          scale: 1.8,
          child: const SizedBox(
            height: 200,
            child: ModelViewer(
              src: 'assets/cars/car_black.glb',
              autoPlay: false,
              autoRotate: false,
              cameraControls: false,
              cameraOrbit: "35deg",
              debugLogging: false,
            ),
          ),
        ),
        Container(color: const Color.fromRGBO(0, 0, 0, 0), height: 200, ),
      ],
    );
  }
}
