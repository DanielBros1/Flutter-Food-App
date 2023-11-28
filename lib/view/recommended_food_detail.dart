import 'package:flutter/material.dart';

import '../data/models/restaurant.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final Restaurant restaurant;

  const RecommendedFoodDetail({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90,
            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey.shade200,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey.shade200,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration:  BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
              ),
            ),

            /// pinned = true => appBar will remain pinned at the top of the viewport while user scrolls thought the content below it
            pinned: true,
            // This will be main color of the restaurant
            backgroundColor: Colors.yellowAccent.shade100,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                restaurant.imageMainAssetPath ?? 'assets/foto_cluckin_bell.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut consectetur dui vel est commodo varius. "
                      "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\n"
                      "Duis vel suscipit massa. Integer non justo vitae odio dictum eleifend. Aliquam erat volutpat. Donec efficitur "
                      "ultricies quam, a venenatis neque eleifend id. Phasellus vel velit in est fermentum gravida vitae ac neque.\n\n"
                      "Quisque vitae nisl id quam suscipit ultricies. Maecenas ac justo quis risus imperdiet posuere. "
                      "Nam ullamcorper mi vel est fringilla, vel euismod justo ullamcorper. Ut euismod, libero a finibus varius, "
                      "turpis nunc laoreet elit, in semper eros libero non purus. In hac habitasse platea dictumst. Nam vel tortor "
                      "non libero efficitur bibendum. Fusce elementum odio et orci tincidunt, eu facilisis justo tristique.\n\n"
                      "Ut quis enim elit. Nam ultrices tristique velit vel iaculis. Sed nec lacus vel nunc eleifend ullamcorper "
                      "ut non est. Nam non diam at justo fringilla venenatis. Pellentesque habitant morbi tristique senectus "
                      "et netus et malesuada fames ac turpis egestas. Aenean id ex id odio vestibulum accumsan. Duis dictum ex vel "
                      "nisi cursus, ac iaculis quam egestas. Sed at felis nec justo aliquam dapibus a a odio.\n\n"
                      "Ut vel magna quis mauris laoreet ultrices. Sed ornare, ex non tincidunt vulputate, libero dolor venenatis "
                      "libero, nec laoreet nisi odio vel sapien. Sed gravida fringilla augue, non venenatis neque. Integer sit amet erat "
                      "metus. Fusce dapibus tristique nibh, nec fermentum dui ultricies non. Nullam nec neque vel tortor suscipit cursus "
                      "vel eu risus. Nulla facilisi. Curabitur feugiat leo vel tincidunt efficitur. Quisque venenatis lectus vel turpis "
                      "aliquam, nec fermentum nunc suscipit.\n\n"
                      "Proin suscipit bibendum ultricies. Sed posuere risus nec bibendum laoreet. Integer dapibus ultricies metus vel posuere. "
                      "Curabitur quis nulla id elit interdum tristique nec at tortor. Nam varius mi ac mauris varius, vitae lacinia velit "
                      "venenatis. Etiam ac nulla ac augue suscipit tincidunt. Curabitur vestibulum metus et ex aliquam, at venenatis nunc "
                      "rhoncus. Sed tincidunt orci quis lacus mattis, at consectetur turpis venenatis. Proin aliquet quam et nibh fermentum, "
                      "vel auctor justo varius.\n\n"
                      "Nullam bibendum dui ut lacinia eleifend. Phasellus varius justo et posuere tincidunt. Morbi at libero nec nisi gravida "
                      "posuere. Suspendisse potenti. Aenean ultrices lectus a justo bibendum, ac elementum elit rhoncus. Curabitur nec feugiat "
                      "orci. In hac habitasse platea dictumst. Sed vulputate turpis nec justo fringilla, ut placerat nisl auctor. Praesent quis "
                      "est a justo tempor dictum. Integer et massa at metus maximus bibendum. Vivamus elementum bibendum nisl, id interdum ex "
                      "tincidunt ac. Vivamus quis libero vitae ex semper facilisis. Duis euismod, ligula ut mattis rhoncus, quam leo pellentesque "
                      "augue, at facilisis libero felis in purus. Sed nec urna mi. Duis scelerisque, nulla eu bibendum scelerisque, mauris dolor "
                      "cursus neque, ut vulputate quam quam nec dui.\n\n"
                      "Quisque in sodales lacus. Integer quis ultricies arcu. Vestibulum vehicula euismod nisi in sodales. Vivamus auctor tortor a "
                      "magna venenatis, nec tincidunt velit cursus. Integer ut metus eu dui posuere euismod. Morbi euism...\n"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
