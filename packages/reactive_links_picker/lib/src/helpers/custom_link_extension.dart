import 'package:reactive_links_picker/reactive_links_picker.dart';

extension CustomExtension on CustomLink {
  link() {
    switch ("$label") {
      case "Email":
        return "mailto:$value";
      case "Phone":
        return "tel:$value";
      case "SMS":
        return "sms:$value";
      case "Website":
        return "https://www.$value";
      case "LinkedIn":
        return "https://www.linkedin.com/in/$value";
      case "Facebook":
        return "https://www.facebook.com/$value";
      case "Twitter X":
        return "https://www.twitter.com/$value";
      case "Instagram":
        return "https://www.instagram.com/_u/$value";
      case "Paypal":
        return "$value";
      case "Stripe":
        return "$value";
      default:
        return "";
    }
  }
}
