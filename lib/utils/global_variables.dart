//dimensions.dart dùng để điều chỉnh kích thước cho các thiết bị
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/add_post_screen.dart';
import 'package:instagram_flutter/screens/feed_screen.dart';

final webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text('Page2'),
  AddPostScreen(),
  Text('Page4'),
  Text('Page5'),
];
