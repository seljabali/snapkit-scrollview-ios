import Foundation
import SnapKit
import UIKit

class ScrollingViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = PassThroughView()

    private let aLabel = UILabel()
    private let bLabel = UILabel()
    private let cLabel = UILabel()
    private let dLabel = UILabel()
    private let eLabel = UILabel()

    private let dummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Scrolling"
        initializeViews()
        setConstraints()
    }

    private func initializeViews() {
        // Hierarchy: view controller's view -> scrollView -> contentView/passThroughView -> content/labels
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        for subview in [aLabel, bLabel, cLabel, dLabel, eLabel] {
            contentView.addSubview(subview)
        }
        scrollView.apply {
            $0.alwaysBounceVertical = true
            $0.alwaysBounceHorizontal = false
            $0.showsHorizontalScrollIndicator = false
            // Use these insets instead of lining up with safeAreaLayoutGuide below. It's 'true' by default
            $0.insetsLayoutMarginsFromSafeArea = true
        }
        aLabel.apply {
            $0.text = dummyText
            $0.numberOfLines = 0
        }
        bLabel.apply {
            $0.text = dummyText
            $0.numberOfLines = 0
        }
        cLabel.apply {
            $0.text = dummyText
            $0.numberOfLines = 0
        }
        dLabel.apply {
            $0.text = dummyText
            $0.numberOfLines = 0
        }
        eLabel.apply {
            $0.text = dummyText
            $0.numberOfLines = 0
        }
    }

    private func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.width.equalTo(scrollView)
        }
        aLabel.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView).inset(Padding.m)
        }
        bLabel.snp.makeConstraints { make in
            make.top.equalTo(aLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(contentView).inset(HorizontalSpacings.m)
        }
        cLabel.snp.makeConstraints { make in
            make.top.equalTo(bLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(contentView).inset(HorizontalSpacings.m)
        }
        dLabel.snp.makeConstraints { make in
            make.top.equalTo(cLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(contentView).inset(HorizontalSpacings.m)
        }
        eLabel.snp.makeConstraints { make in
            make.top.equalTo(dLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(contentView).inset(HorizontalSpacings.m)
            // Make sure that the bottom of the contentView is lined up with the bottom of the last view
            make.bottom.equalTo(scrollView).offset(-VerticalSpacings.m)
        }
    }
}
