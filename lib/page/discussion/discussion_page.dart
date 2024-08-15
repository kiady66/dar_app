import 'package:dar_app/page/discussion/widget/discussionCard.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../api/api.dart';
import '../../entity/discussion.dart';


class DiscussionPage extends StatefulWidget {
  const DiscussionPage({super.key});
  static String id = 'discussion_page';

  @override
  DiscussionPageState createState() => DiscussionPageState();
}

class DiscussionPageState extends State<DiscussionPage> {
  static const _pageSize = 10;

  final PagingController<int, Discussion> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await getDiscussion(page: pageKey, pageSize: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discussions'),
      ),
      body: PagedListView<int, Discussion>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Discussion>(
          itemBuilder: (context, discussion, index) {
            return DiscussionCard(discussion: discussion);
          },
          firstPageProgressIndicatorBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          newPageProgressIndicatorBuilder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text('No discussions found'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}