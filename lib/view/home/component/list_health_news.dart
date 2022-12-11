import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../../styles/theme.dart';

class ListHealthNewsHomeScreen extends StatelessWidget {
  const ListHealthNewsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            bottom: 8, top: 28, left: 16, right: 16),
          child: SizedBox(
            width: double.infinity,
            child: Text('Berita seputar kesehatan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(
              bottom: 16, top: 8, left: 16, right: 16),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,),
            itemCount: 5,
            itemBuilder: (context, index) => Card(
              color: whiteColor,
              child: InkWell(
                onTap: () => print('listTap'),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8, left: 8, top: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(faker.image.image(
                            width: 92,
                            height: 92,
                            keywords: ['news'],
                            random: true)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 95,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Judul Berita',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4),
                                  child: Text(
                                    'Publisher, Tanggal Publsih',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}