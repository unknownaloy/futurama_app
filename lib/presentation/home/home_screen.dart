import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/home/home_view_model.dart';
import 'package:futurama_app/reusables/custom_refresh_widget.dart';
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
          error: (message) => CustomRefreshWidget(
            message: message,
            onRefresh: () => model.fetchInfoData(),
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
          success: () {
            if (model.infoData == null) {
              return CustomRefreshWidget(
                message: "Data not available",
                onRefresh: () => model.fetchInfoData(),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Semantics(
                      label: "Hello there",
                      header: true,
                      child: Text(
                        "Hello there 👋🏿",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      model.infoData!.synopsis,
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
                      semanticsLabel: "Heading, year",
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Semantics(
                        label: "Year is ${model.infoData!.yearsAired}",
                        child: Chip(
                          label: Text(
                            model.infoData!.yearsAired,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
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
                      semanticsLabel: "Creators",
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: [
                        ...model.infoData!.creators.map(
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
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// TODO: Move to a util class
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
