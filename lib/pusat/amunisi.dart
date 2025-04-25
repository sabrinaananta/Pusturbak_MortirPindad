import 'package:flutter/material.dart';

// fungsi menampilkan pop-up dialog 
void showAmunisiPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext dialogContext) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.grey[850],
      // isi dialog
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: 240,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Amunisi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                      _LabelText(text: "TJ", color: Colors.red),
                      _LabelText(text: "ASP", color: Colors.orange),
                      _LabelText(text: "CHY", color: Colors.amber),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _AmunisiValue(text: "1"),
                        _AmunisiValue(text: "32"),
                        _AmunisiValue(text: "30"),
                        _AmunisiValue(text: "24"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 18),
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ),
        ],
      ),
    ),
  );
}

// Widget Custom
class _LabelText extends StatelessWidget {
  final String text;
  final Color color;
  const _LabelText({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

// Kesimpulan Fungsionalitas
class _AmunisiValue extends StatelessWidget {
  final String text;
  const _AmunisiValue({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
