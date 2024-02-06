import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key, required this.adUnitId,});


  final String adUnitId;
  @override
  // ignore: library_private_types_in_public_api
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  late BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();

    // Replace 'your_banner_ad_unit_id' with your actual AdMob banner ad unit ID
    //var adUnitId;
    _bannerAd = BannerAd(
      adUnitId: 'your_banner_ad_unit_id',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 200.0,
      color: Colors.grey,
      padding: const EdgeInsets.all(16.0),
      width: _bannerAd.size.width.toDouble(),
      //height: _bannerAd.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd),
    );
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }
}

final BannerAdListener listener = BannerAdListener(
 // Called when an ad is successfully received.
 // ignore: avoid_print
 onAdLoaded: (Ad ad) => print('Ad loaded.'),
 // Called when an ad request failed.
 onAdFailedToLoad: (Ad ad, LoadAdError error) {
   // Dispose the ad here to free resources.
   ad.dispose();
   // ignore: avoid_print
   print('Ad failed to load: $error');
 },
 // Called when an ad opens an overlay that covers the screen.
 // ignore: avoid_print
 onAdOpened: (Ad ad) => print('Ad opened.'),
 // Called when an ad removes an overlay that covers the screen.
 // ignore: avoid_print
 onAdClosed: (Ad ad) => print('Ad closed.'),
 // Called when an impression occurs on the ad.
 // ignore: avoid_print
 onAdImpression: (Ad ad) => print('Ad impression.'),
);
