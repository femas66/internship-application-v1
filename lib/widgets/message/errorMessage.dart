import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkl_apps/commons/style.dart';

showErrorMessage(String message, {String? title = "Gagal login"}) {
  BotToast.showCustomText(
    align: Alignment.center,
    toastBuilder: (close) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.black.withOpacity(0.45),
          alignment: Alignment.center,
          child: Container(
            width: 300,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
                  color: primaryColor,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Warning",
                        style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.warning_amber,
                        color: primaryColor,
                        size: 37,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 56,
                  alignment: Alignment.center,
                  child: Text(
                    "Gagal",
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Message
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                  width: double.infinity,
                  child: Text(
                    message,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: ElevatedButton(
                    onPressed: close,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      minimumSize: const Size(double.infinity, 30),
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      "Kembali",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    duration: const Duration(seconds: 3),
    onClose: () {},
    onlyOne: false,
  );
}
