import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:sakib/control/qibla_compass_state_data.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/loading_scenario.dart';
import 'package:sakib/widget/option_app_bar.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({super.key});

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? _animationController;
  double begin = 0.0;
  Timer? _timer;
  StreamSubscription<QiblahDirection>? _qiblahStreamSubscription;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _loadSavedQiblaData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startQiblahStream();
  }

  void _startQiblahStream() {
    _qiblahStreamSubscription?.cancel();

    _qiblahStreamSubscription = FlutterQiblah.qiblahStream.listen(
      (qiblaDirection) {
        final newAngle = (qiblaDirection.qiblah * (pi / 180) * -1);

        if (_animationController != null) {
          setState(() {
            animation = Tween(
              begin: begin,
              end: newAngle,
            ).animate(_animationController!);
            begin = newAngle;
            _animationController?.forward(from: 0);
          });

          _saveQiblaData(newAngle);
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _qiblahStreamSubscription?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  Future<void> _loadSavedQiblaData() async {
    try {
      begin = await QiblaCompassStateData.loadQiblaAngle();
    } catch (e) {
      begin = 0.0;
    }

    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _saveQiblaData(double angle) async {
    try {
      await QiblaCompassStateData.saveQiblaAngle(angle);
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar('Qibla'),
      body: StreamBuilder<QiblahDirection>(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScenario();
          }

          return Center(
            child: SizedBox(
              child: animation != null
                  ? AnimatedBuilder(
                      animation: animation!,
                      builder: (context, child) => Transform.rotate(
                        angle: animation!.value,
                        child: Image.asset('assets/images/qibla.png'),
                      ),
                    )
                  : const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
