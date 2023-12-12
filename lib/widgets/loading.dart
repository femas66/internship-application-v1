import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 180,
      height: 100,
      padding: const EdgeInsets.all(0),
      child: Image.asset('assets/gif/loading.gif'),
    );
  }
}

showLoading() {
  BotToast.showCustomLoading(toastBuilder: (close) {
    return const LoadingWidget();
  });
}

stopLoading() {
  BotToast.closeAllLoading();
}
