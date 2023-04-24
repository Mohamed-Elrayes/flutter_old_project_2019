import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';

import '../../core/route/routers.dart';
import '../../logic/cubit/bookmark/bookmark_cubit.dart';
import '../widgets/article_item_post_widget.dart';
import '../widgets/articles_list_widget.dart';
import '../widgets/custom_text_widget.dart';


class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget.title('Bookmark'),
      ),
      body: BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) {
          return ArticlesListView(
            itemCount: state.articleList.length,
            childBuilderAnimated: (context, int index) {
              return ArticleItemPost(
                articleItem: state.articleList[index],
                onTap: () => Navigator.of(context).pushNamed(
                    RoutesName.detailArticleItemPath,
                    arguments: state.articleList[index]),
                // onTap: () => context.read<BookmarkCubit>().bookmarkToggle(
                //       articleItem: state.articleList[index],
                //     ),
              );
            },
          );

          //  ListView.builder(
          //   itemCount: state.articleList.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return InkWell(
          //       onDoubleTap: () {
          //         context.read<BookmarkCubit>().bookmarkToggle(
          //               articleItem: state.articleList[index],
          //             );
          //       },
          //       child: ArticleItemPost(
          //         articleItem: state.articleList[index],
          //       ),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
