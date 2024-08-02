import 'package:dar_app/widget/discussionCard.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'api.dart';
import 'discussion.dart';
// Dummy function for fetching discussions
Future<List<Discussion>> fetchDiscussions(int page, int pageSize) async {
  // Simulate network delay
  await Future.delayed(const Duration(seconds: 2));

  // Replace this with your actual data fetching logic
  final discussionsJson = mockDiscussionListJson['discussions'] as List<dynamic>;

  final startIndex = (page - 1) * pageSize;
  final endIndex = startIndex + pageSize;
  final limitedEndIndex = endIndex > discussionsJson.length ? discussionsJson.length : endIndex;
  final pageDiscussionsJson = discussionsJson.sublist(startIndex, limitedEndIndex);

  return pageDiscussionsJson.map((json) => Discussion.fromJson(json as Map<String, dynamic>)).toList();
}

class DiscussionPage extends StatefulWidget {
  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
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
      final newItems = await fetchDiscussions(pageKey, _pageSize);
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