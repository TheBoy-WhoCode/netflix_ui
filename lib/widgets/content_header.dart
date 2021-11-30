import 'package:flutter/material.dart';
import 'package:netflix_ui/models/models.dart';
import 'package:netflix_ui/utils/utils.dart';
import 'package:netflix_ui/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
          ),
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: "List",
                onTap: () => logger.d("My List"),
              ),
              const _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "Info",
                  onTap: () => logger.d("Info"))
            ],
          ),
          left: 0,
          right: 0,
          bottom: 40,
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
          primary: Colors.black,
          backgroundColor: Colors.white),
      onPressed: () => logger.d("Play"),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
      ),
      label: const Text(
        "Play",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
