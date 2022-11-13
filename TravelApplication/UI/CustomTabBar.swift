//
//  CustomTabBar.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 04.11.2022.
//

import UIKit
import SnapKit

final class CustomTabBar: UITabBar {
       
    private let cornerRadius: CGFloat = 10
    private let arcHeight: CGFloat = 35
    private let customLayer = CAShapeLayer()
    private lazy var tabItemsStackView: UIStackView = _tabItemsStackView
    private lazy var userAccountButton: UIButton = _userAccountButton
     
    init() {
        super.init(frame: .zero)
        //setupSubviews(from: tabItems)
        addSubview(userAccountButton)
        applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSublayers(of layer: CALayer) {
//        super.layoutSublayers(of: layer)
//
//        let size = layer.bounds.size
//
//        layer.backgroundColor = UIColor.red.cgColor
//        //layer.fillColor = UIColor.gray.cgColor
//        layer.opacity = 0.7
//        layer.shadowPath = getBezierPath(size: size)
//
//        self.layer.insertSublayer(customLayer, at: 0)
//    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        drawTabBar()
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !self.bounds.contains(point) {
            let needPoint = self.convert(point, to: userAccountButton)
            if userAccountButton.point(inside: needPoint, with: event) {
                return userAccountButton
            }
        }
        return super.hitTest(point, with: event)
    }
    
//    func setupSubviews(from items: [TabItem]) {
//        addSubview(tabItemsStackView)
//        addSubview(userAccountButton)
//        items.forEach { tabItemsStackView.addArrangedSubview(createTabItem($0)) }
//    }
    
    func applyConstraints() {
//        tabItemsStackView.snp.makeConstraints { snp in
//            snp.edges.equalToSuperview()
//            snp.height.equalTo(self.snp.height)
//        }
        
        userAccountButton.snp.makeConstraints { snp in
            snp.width.height.equalTo(60)
            snp.centerX.equalToSuperview()
            snp.centerY.equalTo(self.snp.topMargin).offset(-10)
        }
    }
    
    private func getBezierPath(size: CGSize) -> CGPath {
        let path = UIBezierPath()

        var prevPoint = CGPoint(x: cornerRadius, y: 0)
        path.move(to: prevPoint)
        prevPoint.x = center.x - arcHeight
        path.addLine(to: prevPoint)

        path.addArc(withCenter: CGPoint(x: center.x, y: prevPoint.y) , radius: arcHeight, startAngle: .pi, endAngle: 0, clockwise: true)

        prevPoint.x = center.x + arcHeight
        prevPoint.y = 0
        path.move(to: prevPoint)
        prevPoint.x = size.width - cornerRadius

        path.addLine(to: prevPoint)

        prevPoint.y += cornerRadius
        path.addArc(withCenter: prevPoint, radius: cornerRadius, startAngle: 3 * .pi / 2, endAngle: 0, clockwise: true)

        prevPoint.x += cornerRadius
        prevPoint.y = size.height
        path.addLine(to: prevPoint)

        prevPoint.x = 0
        path.addLine(to: prevPoint)
        prevPoint.y = cornerRadius
        path.addLine(to: prevPoint)
        prevPoint.x = cornerRadius

        path.addArc(withCenter: prevPoint, radius: cornerRadius, startAngle: .pi, endAngle: 3 * .pi / 2, clockwise: true)

        return path.cgPath
    }
    
    func drawTabBar() {
        customLayer.path = getBezierPath(size: bounds.size)
        customLayer.strokeColor = UIColor.red.cgColor
        customLayer.fillColor = UIColor.orange.cgColor
        
        layer.insertSublayer(customLayer, at: 0)
    }
//    private func createTabItem(_ tabItem: TabItem) -> UIView {
//        let item = TabItemControl(item: tabItem)
//        item.addTarget(self, action: #selector(didSelectItem(_:)), for: .touchUpInside)
//        //item.backgroundColor = .blue
//        let itemLabel = UILabel()
//        let itemIcon = UIImageView()
//        item.addSubview(itemLabel)
//        item.addSubview(itemIcon)
//        itemLabel.text = tabItem.displayName
//        itemIcon.image = tabItem.icon?.withRenderingMode(.alwaysTemplate)
//        itemIcon.tintColor = .green
//        itemLabel.textColor = .green
//
//        itemIcon.snp.makeConstraints { snp in
//            snp.width.height.equalTo(30)
//            snp.centerX.equalToSuperview()
//            snp.top.equalToSuperview().offset(8)
//        }
//
//        itemLabel.snp.makeConstraints { snp in
//            snp.centerX.equalToSuperview()
//            snp.top.equalTo(itemIcon.snp.bottom)
//
//        }
//
//        tabItemsStackView.addArrangedSubview(item)
//
//        return item
//    }
    
//    private func switchTab(fromTab: Int, toTab: Int) {
//        deactivateTab(fromTab)
//        activateTab(toTab)
//    }
//
//    private func activateTab(_ tab: Int) {
//    }
//
//    private func deactivateTab(_ tab: Int) {
//
//    }
    
    
//    @objc private func didSelectItem(_ item: TabItemControl) {
//        tabBarDelegate?.didSelectItem(item.type)
//        print("Custom Tab Bar: was select item: \(item)")
//    }
    
    @objc private func accountButtonPressed(_ sender: UIButton) {
    }
    
}

private extension CustomTabBar {
    var _tabItemsStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }
    
    var _userAccountButton: UIButton {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.setImage(UIImage(named: "user_icon"), for: .normal)
        btn.imageView?.snp.makeConstraints { snp in
            snp.width.height.equalTo(30)
        }
        btn.layer.cornerRadius = 30
        btn.addTarget(self, action: #selector(accountButtonPressed(_:)), for: .touchUpInside)
        
        return btn
    }
}
