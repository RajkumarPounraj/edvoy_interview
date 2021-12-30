import 'dart:math';

import 'package:edvoy_app/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Container(
          color: Theme.of(context).backgroundColor,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PreferredSize(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      color: buttonStart,
                      child: Center(
                        child: ListTile(
                          leading: SizedBox(
                            width: 48,
                            height: 48,
                            child: CircleAvatar(
                              child: const Icon(
                                Icons.support_agent_rounded,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              backgroundColor: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          trailing: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,
                          ),
                          title: Text('Edvoy support',
                              style: GoogleFonts.francoisOne(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 1)),
                          onTap: () {},
                        ),
                      ),
                    ),
                    preferredSize: const Size.square(60.0),
                  ),
                  _divider(),
                ],
              ),
              _bottomView()
            ],
          ),
        ),
      ),
    );
  }

  _bottomView() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 0.4,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                        flex: 4,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(45.0),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              child: Transform.rotate(
                                  angle: pi / 4,
                                  child: Icon(
                                    Icons.attach_file,
                                    color: Colors.blue[600],
                                    size: 26,
                                  )),
                            ),
                          ),
                        )),
                    Flexible(
                      flex: 16,
                      child: Container(
                        //width: 100,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.5))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 17.0, bottom: 13),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                hintText: 'Type a message',
                                hintStyle: TextStyle(fontSize: 15),
                                labelStyle: TextStyle(fontSize: 13),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 4,
                      child: SizedBox(
                        width: 45,
                        height: 45,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 22,
                          ),
                          backgroundColor: buttonStart,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _divider() {
    return Container(
      height: 1,
      color: Colors.grey.withOpacity(0.35),
    );
  }
}
