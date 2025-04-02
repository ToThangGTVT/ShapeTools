//
//  BaseView.swift
//  Documents
//
//  Created by GOLFZON on 2/4/25.
//

import UIKit

public class BaseView: UIView {
    var contentView: UIView!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXib()
    }

    private func loadXib() {
        let bundle = Bundle.module // Đúng bundle của SPM
        let nibName = String(describing: type(of: self))

        guard let view = UINib(nibName: nibName, bundle: bundle)
                .instantiate(withOwner: self, options: nil)
                .first as? UIView else {
            return
        }

        contentView = view
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
}
