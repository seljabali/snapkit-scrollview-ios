import Foundation
import SnapKit
import UIKit

class ScrollingViewController: UIViewController {

    private let homeScrollView = UIScrollView()
    private let aLabel = UILabel()
    private let bLabel = UILabel()
    private let cLabel = UILabel()
    private let dLabel = UILabel()
    private let eLabel = UILabel()
    private let DummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Scrolling"
        initializeViews()
        setConstraints()
    }

    private func initializeViews() {
        homeScrollView.apply {
            $0.alwaysBounceVertical = true
            $0.alwaysBounceHorizontal = false
            $0.showsHorizontalScrollIndicator = false
            view.addSubview($0)
        }
        aLabel.apply {
            $0.text = DummyText
            $0.numberOfLines = 9
            homeScrollView.addSubview($0)
        }
        bLabel.apply {
            $0.text = DummyText
            $0.numberOfLines = 9
            homeScrollView.addSubview($0)
        }
        cLabel.apply {
            $0.text = DummyText
            $0.numberOfLines = 9
            homeScrollView.addSubview($0)
        }
        dLabel.apply {
            $0.text = DummyText
            $0.numberOfLines = 9
            homeScrollView.addSubview($0)
        }
        eLabel.apply {
            $0.text = DummyText
            $0.numberOfLines = 9
            homeScrollView.addSubview($0)
        }
    }

    private func setConstraints() {
        homeScrollView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(view)
        }
        aLabel.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide).inset(Padding.m)
        }
        bLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(aLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(HorizontalSpacings.m)
        }
        cLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(bLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(HorizontalSpacings.m)
        }
        dLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(cLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(HorizontalSpacings.m)
        }
        eLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(HorizontalSpacings.m)
        }
    }

}
