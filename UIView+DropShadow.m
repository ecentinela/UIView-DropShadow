#import <QuartzCore/QuartzCore.h>
#import "UIView+DropShadow.h"

@implementation UIView(DropShadow)

- (void)dropShadowWithOffset:(CGSize)offset Radius:(CGFloat)radius Color:(UIColor *)color Opacity:(CGFloat)opacity
{
    // set properties
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;

    // disable clipsToBounds to not clip off the shadow
    self.clipsToBounds = NO;

    // better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    self.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
}

@end
