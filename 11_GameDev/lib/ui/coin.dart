// CSCI 4100U - 12 - Game Development

import 'dart:ui';

import 'package:flutter/painting.dart';

import 'package:flame/sprite.dart';

class Coin {
  static const double MAX_X_OFFSET = 18.0;

  Size screenSize;
  double tileSize;
  double xOffset;
  double yOffset;
  double xSize;
  double ySize;
  double xSpeed;
  double ySpeed;
  int value;
  bool isCollected = false;

  List<String> images = [
    'coins/shine/shine1.png',
    'coins/shine/shine2.png',
    'coins/shine/shine3.png',
    'coins/shine/shine4.png',
    'coins/shine/shine5.png',
    'coins/shine/shine6.png',
  ];
  int frameNum;

  Rect rect;
  Sprite sprite;

  Coin({this.screenSize,  this.tileSize,
        this.xOffset,     this.yOffset,
        this.xSize = 50,  this.ySize = 50,
        this.xSpeed = 4,  this.ySpeed = 0,
        this.value = 100}) {

    frameNum = 0;
    sprite = Sprite(images[frameNum]);
    isCollected = false;
  }

  double toScreenX(double x) {
    return x * tileSize;
  }

  double toScreenY(double y) {
    return 370.0 - (y * tileSize);
  }

  void render(Canvas c) {
    if (!isCollected) {
      sprite.renderRect(c, rect);
    }
  }

  void update(double dt) {
    if (!isCollected) {
      xOffset -= xSpeed * dt;
      yOffset -= ySpeed * dt;

      // check if this tile is off the screen
      if (xOffset < -1) {
        // position it to the right
        xOffset = MAX_X_OFFSET + 2;
      }

      frameNum++;
      if (frameNum >= images.length) frameNum = 0;
      sprite = Sprite(images[frameNum]);

      // convert to screen coordinates
      rect = Rect.fromLTWH(toScreenX(xOffset), toScreenY(yOffset), xSize, ySize);
    }
  }

  void collect() {
    isCollected = true;
  }
}