This project serves as a code sample of my post -- [Applying Rounded Corners](http://articles.cocoahope.com/archives/22)

Tab 1 - None rounded corners.
---


Tab 2 - Use CALayer property cornerRadius
---

    view.layer.cornerRadius = 8.0;
    view.layer.masksToBounds = YES;


Tab 3 - Add a clip before drawing
---

    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:8.0] addClip];


Tab 4 - Use mask image
---

    CGImageCreateWithMask(image.CGImage, maskRef);

