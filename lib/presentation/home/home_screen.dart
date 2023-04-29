import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    context.read<HomeViewModel>().fetchInfoData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Consumer<HomeViewModel>(
        builder: (_, model, __) => model.requestState.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (message) => Center(
            child: Text(message),
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (data) => SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Hello there 👋🏿",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    data!.synopsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),

                  /// Year
                  Text(
                    "Year",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      label: Text(
                        data.yearsAired,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  /// Creators
                  Text(
                    "Creators",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    children: [
                      ...data.creators.map(
                        (creator) => GestureDetector(
                          onTap: () {
                            // Handle url launcher here
                            _launchUrl(creator.url);
                          },
                          child: Chip(
                            label: Text(
                              creator.name,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);

  try {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch');
    }
  } catch (err) {
    // Handle error
    print("ERR => $err");
  }
}
