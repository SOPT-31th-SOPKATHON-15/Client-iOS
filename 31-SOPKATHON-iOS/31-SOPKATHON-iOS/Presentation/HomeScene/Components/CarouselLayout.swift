//
//  CarouselLayout.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import UIKit

public class CarouselLayout: UICollectionViewFlowLayout {

    private enum Metric {
        static let cellHeight: CGFloat = 392
        static let cellSideHeight: CGFloat = 240

        static let spacing: CGFloat = 0
    }

    public var sideItemScale: CGFloat = Metric.cellSideHeight/Metric.cellHeight
    public var sideItemAlpha: CGFloat = 0.8
    public var isPagingEnabled: Bool = false

    private var isSetup: Bool = false

    override public func prepare() {
        super.prepare()
        if isSetup == false {
            setupLayout()
            isSetup = true
        }
    }

    // prepare() 가 처음으로 호출될 때 컬렉션 뷰에 대한 초기 설정을 하기 위해, setupLayout()이라는 함수 만듬.
    private func setupLayout() {
        guard let collectionView = self.collectionView else {return}

        let collectionViewSize = collectionView.bounds.size
        let itemWidth = self.itemSize.width
        let itemHeight = self.itemSize.height

        let xInset = (collectionViewSize.width - itemWidth) / 2
        let yInset = (collectionViewSize.height - itemHeight) / 2

        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)

        let scaledItemOffset =  (itemWidth - itemWidth*self.sideItemScale) / 2
        self.minimumLineSpacing = Metric.spacing - scaledItemOffset

        self.scrollDirection = .horizontal
    }

    // true: 사용자가 스크롤 시 prepare()를 통해 레이아웃 업데이트가 가능하게끔 합니다.
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    // 모든 셀과 뷰에 대한 레이아웃 속성을  UICollectionViewLayoutAttributes 배열로 반환하는데
    // 이 속성을 변환해서 반환할 거기 때문에 고차 함수 map을 사용
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superAttributes = super.layoutAttributesForElements(in: rect),
            let attributes = NSArray(array: superAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes]
            else { return nil }

        return attributes.map({ self.transformLayoutAttributes(attributes: $0) })
    }

    private func transformLayoutAttributes(attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {

        guard let collectionView = self.collectionView else {return attributes}

        let collectionCenter = collectionView.frame.size.width / 2
        let contentOffset = collectionView.contentOffset.x
        let center = attributes.center.x - contentOffset

        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - center), maxDistance)

        let ratio = (maxDistance - distance)/maxDistance

        let alpha = ratio * (1 - self.sideItemAlpha) + self.sideItemAlpha
        let scale = ratio * (1 - self.sideItemScale) + self.sideItemScale

        attributes.alpha = alpha

        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let dist = attributes.frame.midX - visibleRect.midX
        var transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        transform = CATransform3DTranslate(transform, 0, 0, -abs(dist/1000))
        attributes.transform3D = transform

        return attributes
    }


    // targetContentOffset 메서드는 스크롤을 중지할 지점을 찾아서 반환하는 메소드
    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        guard let collectionView = self.collectionView else {
            let latestOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
            return latestOffset
        }

        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.frame.width, height: collectionView.frame.height)
        guard let rectAttributes = super.layoutAttributesForElements(in: targetRect) else { return .zero }

        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + collectionView.frame.width / 2

        for layoutAttributes in rectAttributes {
            let itemHorizontalCenter = layoutAttributes.center.x
            if (itemHorizontalCenter - horizontalCenter).magnitude < offsetAdjustment.magnitude {
                offsetAdjustment = itemHorizontalCenter - horizontalCenter
            }
        }

        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
