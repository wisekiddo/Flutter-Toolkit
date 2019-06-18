/*
 * Copyright 2019 ToolBone. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/cupertino.dart';

class ImageClipper extends CustomClipper<Path> {
    @override
    Path getClip(Size size) {
        var path = new Path();
        path.lineTo(0.0, size.height - 40.0);

        var controlPoint = Offset(size.width / 4, size.height);
        var endpoint = Offset(size.width / 2, size.height);

        path.quadraticBezierTo(
                controlPoint.dx, controlPoint.dy, endpoint.dx, endpoint.dy);

        var controlPoint2 = Offset(size.width * 3 / 4, size.height);
        var endpoint2 = Offset(size.width, size.height - 40.0);

        path.quadraticBezierTo(
                controlPoint2.dx, controlPoint2.dy, endpoint2.dx, endpoint2.dy);

        path.lineTo(size.width, 0.0);

        return path;
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
        return true;
    }
}