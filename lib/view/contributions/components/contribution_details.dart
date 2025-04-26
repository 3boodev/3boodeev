import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/contribution_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';

class ContributionDetails extends StatelessWidget {
  final controller = Get.put(CertificationController());

  ContributionDetails({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
          padding: const EdgeInsets.all(defaultPadding - 5),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: bgColor),
          duration: const Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contributionList[index].name,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  contributionList[index].description,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.amber,fontSize: 14),
                ),
                const SizedBox(
                  height: defaultPadding * 2,
                ),
                const SizedBox(
                  height: defaultPadding - 5,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(contributionList[index].credential));
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Colors.pink,
                            Colors.blue.shade900,
                          ]),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.blue,
                                offset: Offset(0, -1),
                                blurRadius: 5),
                            BoxShadow(
                                color: Colors.red,
                                offset: Offset(0, 1),
                                blurRadius: 5),
                          ]),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Try It Now',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            CupertinoIcons.arrow_turn_up_right,
                            color: Colors.white,
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
