//
//  SnapKitStyleExtension.swift
//  iTunesPodcast
//
//  Created by Valentin Rep on 02.07.2022..
//

import UIKit
import SnapKit

extension UIView {
    
    @discardableResult
    public func styleMakeConstraints(_ closure: (_ make: SnapKit.ConstraintMaker) -> Void) -> Self {
        snp.makeConstraints(closure)
        return self
    }
    
    @discardableResult
    public func styleUpdateConstraints(_ closure: (_ make: SnapKit.ConstraintMaker) -> Void) -> Self {
        snp.updateConstraints(closure)
        return self
    }
    
    @discardableResult
    public func styleParentView(_ parent: UIView) -> Self {
        if let stackView = parent as? UIStackView {
            stackView.addArrangedSubview(self)
        }
        else {
            parent.addSubview(self)
        }
        return self
    }
    
    @discardableResult
    public func styleAutoresizingMask(_ autoresizingMask: UIView.AutoresizingMask) -> Self {
        self.autoresizingMask = autoresizingMask
        return self
    }
    
    @discardableResult
    public func styleBackgroundColor(_ color: UIColor?) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func styleContentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult
    public func styleCornerRadius(cornerRadius: CGFloat) -> Self {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    public func styleRoundCorners() -> Self {
        return styleCornerRadius(cornerRadius: self.frame.height / 2)
    }
    
    @discardableResult
    public func styleContentHuggingPriority(_ priority: UILayoutPriority, forAxis axis: NSLayoutConstraint.Axis) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    public func styleContentCompressionResistancePriority(_ priority: UILayoutPriority, forAxis axis: NSLayoutConstraint.Axis) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    public func styleGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) -> Self {
        isUserInteractionEnabled = true
        addGestureRecognizer(gestureRecognizer)
        return self
    }
    
    @discardableResult
    public func styleHidden(_ hidden: Bool) -> Self {
        if self.isHidden != hidden {
            self.isHidden = hidden
        }
        return self
    }
    
    @discardableResult
    public func styleTag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    @discardableResult
    public func styleTintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    public func styleUserInteractionEnabled(_ enabled: Bool) -> Self {
        self.isUserInteractionEnabled = enabled
        return self
    }
    
    @discardableResult
    public func styleAlpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @discardableResult
    public func styleIsOpaque(_ isOpaque: Bool) -> Self {
        self.isOpaque = isOpaque
        return self
    }
    
    @discardableResult
    public func styleCenter(_ center: CGPoint) -> Self {
        self.center = center
        return self
    }
    
    @discardableResult
    public func styleFrame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }
    
    @discardableResult
    public func styleBounds(_ bounds: CGRect) -> Self {
        self.bounds = bounds
        return self
    }
    
    @discardableResult
    public func styleLayoutMargins(_ layoutMargins: UIEdgeInsets) -> Self {
        self.layoutMargins = layoutMargins
        return self
    }
    
    @discardableResult
    public func styleClipToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    public func styleBorder(_ width: CGFloat, color: UIColor) -> Self {
        self.layer.styleBorder(width, color: color)
        return self
    }
}

extension CALayer {
    
    @discardableResult
    public func styleBorder(_ width: CGFloat, color: UIColor) -> Self {
        self.borderWidth = width
        self.borderColor = color.cgColor
        return self
    }
}

extension UIStackView {
    
    @discardableResult
    public func styleSpacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
    
    @discardableResult
    public func styleAxis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    public func styleDistribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    public func styleLayoutMarginsRelativeArrangement(_ relative: Bool) -> Self {
        self.isLayoutMarginsRelativeArrangement = relative
        return self
    }
}

extension UIControl {
    
    @discardableResult
    public func styleTarget(_ target: AnyObject?, action: Selector, for controlEvents: UIControl.Event = .touchUpInside) -> Self {
        addTarget(target, action: action, for: controlEvents)
        return self
    }
}

extension UIButton {
    
    @discardableResult
    public func styleImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func styleBackgroundImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ align: NSTextAlignment) -> Self {
        titleLabel?.textAlignment = align
        return self
    }
    
    @discardableResult
    public func styleTitleColor(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    public func styleFont(_ font: UIFont?) -> Self {
        titleLabel?.font = font
        return self
    }
    
    @discardableResult
    func styleTitle(_ title: String?, for state: UIControl.State = .normal) -> Self {
        setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    public func styleIsEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    public func styleContentHorizontalAlignment(_ alignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = alignment
        return self
    }
}

extension UILabel {
    
    @discardableResult
    public func styleNumberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    public func styleLineBreakMode(_ wordBreak: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ align: NSTextAlignment) -> Self {
        textAlignment = align
        return self
    }
    
    @discardableResult
    public func styleHighlightedTextColor(_ color: UIColor) -> Self {
        highlightedTextColor = color
        return self
    }
    
    @discardableResult
    public func styleFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func styleAdjustsFontSizeToFitWidth() -> Self {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    public func styleMinimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult
    public func styleTextColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }
    
    @discardableResult
    public func styleText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func styleAttributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }
    
    @discardableResult
    public func styleAdjustsFontForContentSizeCategory(_ shouldAdjust: Bool) -> Self {
        self.adjustsFontForContentSizeCategory = shouldAdjust
        return self
    }
}

extension UITextField {
    
    @discardableResult
    public func stylePlaceholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    public func styleInputAccessoryView(_ view: UIView?) -> Self {
        self.inputAccessoryView = view
        return self
    }
    
    @discardableResult
    public func styleFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func styleTextColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func styleSecureTextEntry(_ secureTextEntry: Bool) -> Self {
        self.isSecureTextEntry = secureTextEntry
        return self
    }
}

extension UITextView {
    
    @discardableResult
    public func styleText(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func styleTextAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    public func styleTextColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func styleFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func styleAttriburedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        return self
    }
    
    @discardableResult
    public func styleIsEditable(_ isEditable: Bool) -> Self {
        self.isEditable = isEditable
        return self
    }
    
    @discardableResult
    public func styleIsSelectable(_ isSelectable: Bool) -> Self {
        self.isSelectable = isSelectable
        return self
    }
    
    @discardableResult
    public func styleIsScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    public func styleIsUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
}

extension UIScrollView {
    
    @discardableResult
    public func stylePagingEnabled(_ pagingEnabled: Bool) -> Self {
        self.isPagingEnabled = pagingEnabled
        return self
    }
    
    @discardableResult
    public func styleShowsHorizontalScrollIndicator(_ showsHorizontal: Bool) -> Self {
        self.showsHorizontalScrollIndicator = showsHorizontal
        return self
    }
    
    @discardableResult
    public func styleShowsVerticalScrollIndicator(_ showsVertical: Bool) -> Self {
        self.showsVerticalScrollIndicator = showsVertical
        return self
    }
    
    @discardableResult
    public func styleBounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }
}

extension UIImageView {
    
    @discardableResult
    public func styleImage(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
}

extension UISegmentedControl {
    
    @discardableResult
    func styleSelectedSegmentIndex(_ index: Int) -> Self {
        self.selectedSegmentIndex = index
        return self
    }
}

extension UITableViewCell {
    
    @discardableResult
    func styleSelectedBackgroundColor(_ color: UIColor) -> Self {
        self.selectedBackgroundView = UIView().styleBackgroundColor(color)
        return self
    }
    
}

extension UISwitch {
    
    @discardableResult
    func styleOnTintColor(_ color: UIColor) -> Self {
        self.onTintColor = color
        return self
    }
}
