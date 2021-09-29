import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;

  const LoginBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _CajaColor(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.only(top: 30),
        child: SvgPicture.asset('assets/svgs/cutlery.svg'),
      ),
    );
  }
}

class _CajaColor extends StatelessWidget {
  const _CajaColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.4,
      decoration: _buildBoxDecoration(),
      child: Stack(
        children: [
          Positioned(child: _Burbujas(), top: 90, left: 70),
          Positioned(child: _Burbujas(), top: -40, left: -30),
          Positioned(child: _Burbujas(), top: -50, right: -20),
          Positioned(child: _Burbujas(), bottom: -50, left: 10),
          Positioned(child: _Burbujas(), bottom: 70, right: 20),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Color(0xff1F1F1F),
    );
  }
}

class _Burbujas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
