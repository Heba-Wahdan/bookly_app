import 'package:bookly/Core/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> CustomLaunchUrl(context, String? previewLink) async {
  if (previewLink != null) {
    Uri uri = Uri.parse(previewLink);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      customSnackBar(context, previewLink);
    }
  }
}
