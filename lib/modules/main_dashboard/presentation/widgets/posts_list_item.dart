import 'package:cookly/core/router/router.dart';
import 'package:flutter/material.dart';

import '../../bloc/main_dashboard_cubit.dart';

class PostsListItem extends StatelessWidget {
  final Post post;
  const PostsListItem(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => router.go('/post_details'),
      child: Padding(
        padding: const EdgeInsets.all(15),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
            ),
            width: MediaQuery.sizeOf(context).width,
            height: 150,
            child: Row(
              children: [
                Image.network(
                  post.link,
                  height: 100,
                  width: 100,
                  scale: 1.5,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        post.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 35, right: 10, bottom: 20),
                        child: Text(
                          post.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
    );
  }
}