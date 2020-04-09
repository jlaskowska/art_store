import 'package:art_store/models/product.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ZoomProduct extends StatefulWidget {
  final Product product;
  final BoxConstraints constraints;

  ZoomProduct({Key key, @required this.product, @required this.constraints}) : super(key: key);

  @override
  _ZoomProductState createState() => _ZoomProductState();
}

class _ZoomProductState extends State<ZoomProduct> {
  static const double minScale = 0.7;
  static const double maxScale = 4.0;

  double _scale = 1.0;
  double _previousScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: Hero(
          tag: widget.product.id,
          child: GestureDetector(
            onScaleStart: (ScaleStartDetails details) {
              setState(() => _previousScale = _scale);
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                _scale = _previousScale * details.scale;
                _scale = _scale.clamp(minScale, maxScale);
              });
            },
            onScaleEnd: (ScaleEndDetails details) {
              setState(() => _previousScale = 1.0);
            },
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
              child: Image.asset(
                widget.product.assetPath,
                fit: BoxFit.fitHeight,
                width: widget.constraints.maxWidth,
                height: widget.constraints.maxHeight * 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
