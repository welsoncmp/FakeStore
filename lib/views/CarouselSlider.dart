import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> imagens;
  final List<Icon>? icone;
  final List<String>? texto;

  CarouselWidget({required this.imagens, this.icone, this.texto});

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.imagens.asMap().entries.map((entry) {
        int id = entry.key;
        String imagem = entry.value;
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 3, right: 3, top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white70,
            image: DecorationImage(
              image: NetworkImage(imagem),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              if (widget.icone != null && id < widget.icone!.length)
                widget.icone![id],
              if (widget.texto != null && id < widget.texto!.length)
                Text(widget.texto![id], style: TextStyle(fontSize: 16.0)),
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
          height: 190.0,
          autoPlay: true,
          viewportFraction: 0.9500,
          enlargeCenterPage: false,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInBack,
          pauseAutoPlayOnTouch: true,
          scrollDirection: Axis.horizontal,
          initialPage: 2,
          enableInfiniteScroll: true,
          reverse: false,
      ),
    );
  }
}
