import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/size.dart';
import 'package:flutter_app/utils/insta_util.dart';
import 'package:flutter_app/utils/profile_img_path.dart';
import 'package:flutter_app/widgets/comment.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 가장 앞에 나오는 아이콘 leading 에 정의한다.
        leading: IconButton(
          icon: ImageIcon(
            AssetImage('assets/actionbar_camera.png'),
            color: Colors.black,
          ),
          onPressed: null,
        ),
        // 타이틀에 이미지를 사용할 수 있다.
        title: Image.asset(
          'assets/insta_text_logo.png',
          height: 26,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/actionbar_camera.png'),
              color: Colors.black,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/direct_message.png'),
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return _postItem(context, index);
          }),
    );
  }

  Column _postItem(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader('username $index'),
        _postImage(index),
        _postActions(),
        _postLikes(),
        _postCaption(index, context),
        _allComments(),
      ],
    );
  }

  FlatButton _allComments() {
    int num = getRng(60);

    return FlatButton(
      child: Text(
        'show all $num comments',
        style: TextStyle(color: Colors.grey[400]),
      ),
      onPressed: null,
    );
  }

  Padding _postCaption(int index, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: common_gap, vertical: common_s_gap),
        child: Comment(showProfile: true,
            username: 'username $index',
            caption: 'Yeah~ This is my first flutter app project~~~~~~~~~~~~~~~~~~ Let\'s enjoy!',
            dateTime: DateTime.now())
    );
  }

  Row _postLikes() {
    int num = getRng(99);

    return Row(
      children: <Widget>[
        num == 0
            ? Text('')
            : Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Text('$num likes',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Row _postActions() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/heart_selected.png'),
          ),
          onPressed: null,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/comment.png'),
          ),
          onPressed: null,
        ),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/direct_message.png'),
          ),
          onPressed: null,
        ),
        Spacer(),
        IconButton(
          icon: ImageIcon(
            AssetImage('assets/bookmark.png'),
          ),
          onPressed: null,
        ),
      ],
    );
  }

  Row _postHeader(String username) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_gap),
          child: CircleAvatar(
            backgroundImage:
            CachedNetworkImageProvider(getProfileImgPath(username)),
            radius: profile_radius,
          ),
        ),
        Expanded(child: Text(username)),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: null,
        )
      ],
    );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/400/400',
      placeholder: (context, url) {
        return Container(
          width: size.width,
          height: size.width,
          child: Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/loading_img.gif'),
            ),
          ),
        );
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
    );
  }
}
