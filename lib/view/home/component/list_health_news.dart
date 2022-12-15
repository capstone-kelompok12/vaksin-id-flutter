import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_id_flutter/view_model/home_view_model.dart';

import '../../../styles/theme.dart';
import '../../component/finite_state.dart';

class ListHealthNewsHomeScreen extends StatelessWidget {
  const ListHealthNewsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8, top: 28, left: 16, right: 16),
          child: SizedBox(
              width: double.infinity,
              child: Text('Berita seputar kesehatan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
        ),
        Expanded(
          child: Consumer<HomeViewModel>(
              builder: (context, value, _) => value.apiState == MyState.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.apiState == MyState.none
                      ? ListView.separated(
                          padding: const EdgeInsets.only(
                              bottom: 16, top: 8, left: 16, right: 16),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: 5,
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: blackColor.withOpacity(0.3),
                                  blurRadius: 3,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                value.launchURL(value.listNews![index].url!);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    child: Image.network(
                                        value.listNews![index].urlToImage!,
                                        width: 95,
                                        height: 110,
                                        fit: BoxFit.cover),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 95,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                value.listNews![index].title!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4),
                                                child: Text(
                                                  '${value.listNews![index].author}, ${DateFormat('dd/MM/yyyy').format(
                                                    value.listNews![index]
                                                            .publishedAt ??
                                                        DateTime.now(),
                                                  )}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      blackTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: medium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('Error Load Data...'),
                        )),
        )
      ],
    );
  }
}
