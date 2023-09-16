//
//  HomeVC.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 15.09.2023.
//

import UIKit

class HomeVC: CompositionalCollectionViewViewController
{
    
    var datasource: ColoredDiffableDataSource!
    
    var gridItemSize: GridItemSize = .half {
        didSet {
            collectionView.setCollectionViewLayout(createLayout(), animated: true)
        }
    }
    
    private lazy var sizeMenu: UIMenu = { [unowned self] in
        return UIMenu(title: "Select size", image: nil, identifier: nil, options: [.displayInline], children: [
            UIAction(title: "Half", image: UIImage(systemName: "square.grid.2x2.fill"), handler: { (_) in
                self.gridItemSize = .half
            }),
            UIAction(title: "Third", image: UIImage(systemName: "square.grid.3x2.fill"), handler: { (_) in
                self.gridItemSize = .third
            }),
            UIAction(title: "Quarter", image: UIImage(systemName: "square.grid.4x3.fill"), handler: { (_) in
                self.gridItemSize = .quarter
            }),
        ])
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.configureDatasource()
    }
    
    func configureDatasource() {
        self.collectionView.delegate = self
        self.collectionView.register(cell: ColorCell.self)
        
        self.datasource = ColoredDiffableDataSource(collectionView: collectionView)
        self.datasource.apply(ColorsSnapshot.random())
    }
    
    override func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(gridItemSize.rawValue),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .uniform(size: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(gridItemSize.rawValue))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension HomeVC {
    func setupView() {
        title = "Sample"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .edit, primaryAction: nil, menu: sizeMenu)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(addTapped)
        )
    }
    
    @objc func addTapped() {
        var currentSnapshot = datasource.snapshot()
        currentSnapshot.addRandomItem()
        datasource.apply(currentSnapshot)
    }
}

//MARK: - Edit Grid Size
extension HomeVC {
    
    enum GridItemSize: CGFloat {
        case half = 0.5
        case third = 0.33333
        case quarter = 0.25
    }
    
    
    @objc func showSizeSelection() {
        let ac = UIAlertController(title: "Select size", message: nil, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Half", style: .default, handler: { (_) in
            self.gridItemSize = .half
        }))
        
        ac.addAction(UIAlertAction(title: "Third", style: .default, handler: { (_) in
            self.gridItemSize = .third
        }))
        
        ac.addAction(UIAlertAction(title: "Quarter", style: .default, handler: { (_) in
            self.gridItemSize = .quarter
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(ac, animated: true)
    }
}

//MARK: - CollectionView - Delete Item
extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = datasource.itemIdentifier(for: indexPath) else { return }
        
        var currentSnapshot = datasource.snapshot()
        currentSnapshot.deleteItems([cell])
        datasource.apply(currentSnapshot)
    }
}
