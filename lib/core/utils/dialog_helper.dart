import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_gallery/core/utils/assets.dart';

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
  static void showInfoDialog(BuildContext context, String title,
      {VoidCallback? onOkPressed}) {
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

  static void uploadImageDialog(BuildContext context,
      {VoidCallback? onButton1Pressed, VoidCallback? onButton2Pressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(32.0),
              border: Border.all(
                color: Colors.white, // Add white color here
                width: 2, // Adjust border width as needed
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.white.withOpacity(.3), // Transparent color
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: onButton1Pressed,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xffEFD8F9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(AssetsPaths.galleryBtn, fit: BoxFit.fill, width: 40, height: 40,),
                              const SizedBox(width: 8),
                              const Text(
                                'Gallery',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: onButton2Pressed,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xffEBF6FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AssetsPaths.camera , fit: BoxFit.fill, width: 40, height: 40,),
                              const SizedBox(width: 8),
                              const Text(
                                'Camera',
                                style: TextStyle(
                                  color: Colors.black,
                                    fontSize: 22
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}

