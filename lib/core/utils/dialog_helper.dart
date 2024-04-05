import 'package:flutter/material.dart';

class DialogHelper {
  static late BuildContext _loadingDialogContext;

  static void showLoadingDialog(BuildContext context) {
    _loadingDialogContext = context;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.8,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog() {
    if (Navigator.of(_loadingDialogContext, rootNavigator: true).canPop()) {
      Navigator.of(_loadingDialogContext, rootNavigator: true).pop();
    }
  }

  // Your existing showInfoDialog method remains unchanged
  static void showInfoDialog(BuildContext context, String title, {VoidCallback? onOkPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    if (onOkPressed != null)
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: onOkPressed,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


