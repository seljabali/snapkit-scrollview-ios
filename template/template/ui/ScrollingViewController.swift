import Foundation
import SnapKit
import UIKit

class ScrollingViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    // Your new hierarchy is: view -> scrollView -> contentView -> labels

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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        for subview in [aLabel, bLabel, cLabel, dLabel, eLabel] {
            contentView.addSubview(subview)
        }
        scrollView.apply {
            $0.alwaysBounceVertical = true
            $0.alwaysBounceHorizontal = false
            $0.showsHorizontalScrollIndicator = false
            // Use these insets instead of lining up with safeAreaLayoutGuide below. It's 'true' by default, but I'm showing it to you anyway ;)
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

        // Content View
        contentView.snp.makeConstraints { make in
            // Make the top and bottom always be the top and bottom of the scroll view (since we want to scroll vertically only)
            make.top.bottom.equalTo(scrollView)

            // Hard set the left and right to be equal to the view
            make.left.right.equalTo(view)

            // Hard set the width and height to be equal to the scrollView. Remember, this is the sam as saying making the homeScrollView's left and right the same as the contentView. You're saying "snap these things to each other"
            make.width.equalTo(scrollView)
        }

        // Remember, these are all in `contentView` now
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

        // What you forgot to do is set a constraint for the "bottom" of the (now contentView) to the bottom of the last label (`eLabel`). You must do this, otherwise, there is no rule telling it to make sure that the bottom of the final label must always line up with the bottom of the scrollview!

        // In this case, eLabel is the bottom label
        eLabel.snp.makeConstraints { make in
            make.top.equalTo(dLabel.snp.bottom).offset(VerticalSpacings.m)
            make.left.right.equalTo(contentView).inset(HorizontalSpacings.m)

            // So, add this rule. Remember, you're saying "make sure that the bottom of the contentView is lined up with the bottom of the last label" or "make sure the bottom of the last label is the bottom of the contentView" (which is the same thing, right?) -- note that I added an inset here
            make.bottom.equalTo(scrollView).offset(VerticalSpacings.m)
        }
    }

    // Additional: Notice I added a `.ruby-version` file and a `Gemfile`. If you install a ruby manager on your machine, you can take advantage of this. Running `gem install bundler` and then `bundle install` will install `cocoapods` using `bundler` -- the .ruby-version helps keep everyone on the same version of ruby, while `bundler` makes sure we're on the same version of the dependencies.

    // then you just run `bundle exec pod install` to use the version of cocoapods specified in the `Gemfile` (and cached in the `Gemfile.lock` -- I can show you that :P

    // I hope this helps! Let me know if you have any questions! - Your friend, @jpmcglone :)
}
