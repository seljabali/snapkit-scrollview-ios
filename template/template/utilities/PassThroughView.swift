import UIKit

public class PassThroughView: UIView {

    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }

}
