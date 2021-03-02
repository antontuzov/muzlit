//
//  Extensions + homeVC.swift
//  muzlit
//
//  Created by turbo on 01.03.2021.
//

import Foundation

//
//extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let type = sections[section]
//        switch type {
//        case .newReleases(let viewModels):
//            return viewModels.count
//        case .featuredPlaylists(let viewModels):
//            return viewModels.count
//        case .recommendedTracks(let viewModels):
//            return viewModels.count
//        }
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return sections.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let type = sections[indexPath.section]
//        switch type {
//        case .newReleases(let viewModels):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: NewReleaseCollectionViewCell.identifier,
//                for: indexPath
//            ) as? NewReleaseCollectionViewCell else {
//                return UICollectionViewCell()
//            }
//            let viewModel = viewModels[indexPath.row]
//            cell.configure(with: viewModel)
//            return cell
//        case .featuredPlaylists(let viewModels):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: FeaturedPlaylistCollectionViewCell.identifier,
//                for: indexPath
//            ) as? FeaturedPlaylistCollectionViewCell else {
//                return UICollectionViewCell()
//            }
//            cell.configure(with: viewModels[indexPath.row])
//            return cell
//        case .recommendedTracks(let viewModels):
//            guard let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: RecommendedTrackCollectionViewCell.identifier,
//                for: indexPath
//            ) as? RecommendedTrackCollectionViewCell else {
//                return UICollectionViewCell()
//            }
//            cell.configure(with: viewModels[indexPath.row])
//            return cell
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        HapticsManager.shared.vibrateForSelection()
//        let section = sections[indexPath.section]
//        switch section {
//        case .featuredPlaylists:
//            let playlist = playlists[indexPath.row]
//            let vc = PlaylistViewController(playlist: playlist)
//            vc.title = playlist.name
//            vc.navigationItem.largeTitleDisplayMode = .never
//            navigationController?.pushViewController(vc, animated: true)
//        case .newReleases:
//            let album = newAlbums[indexPath.row]
//            let vc = AlbumViewController(album: album)
//            vc.title = album.name
//            vc.navigationItem.largeTitleDisplayMode = .never
//            navigationController?.pushViewController(vc, animated: true)
//        case .recommendedTracks:
//            let track = tracks[indexPath.row]
//            PlaybackPresenter.shared.startPlayback(from: self, track: track)
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard let header = collectionView.dequeueReusableSupplementaryView(
//            ofKind: kind,
//            withReuseIdentifier: TitleHeaderCollectionReusableView.identifier,
//            for: indexPath
//        ) as? TitleHeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
//            return UICollectionReusableView()
//        }
//        let section = indexPath.section
//        let title = sections[section].title
//        header.configure(with: title)
//        return header
//    }
//
//    static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
//        let supplementaryViews = [
//            NSCollectionLayoutBoundarySupplementaryItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .absolute(50)
//                ),
//                elementKind: UICollectionView.elementKindSectionHeader,
//                alignment: .top
//            )
//        ]
//
//        switch section {
//        case 0:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//            // Vertical group in horizontal group
//            let verticalGroup = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .absolute(390)
//                ),
//                subitem: item,
//                count: 3
//            )
//
//            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(0.9),
//                    heightDimension: .absolute(390)
//                ),
//                subitem: verticalGroup,
//                count: 1
//            )
//
//            // Section
//            let section = NSCollectionLayoutSection(group: horizontalGroup)
//            section.orthogonalScrollingBehavior = .groupPaging
//            section.boundarySupplementaryItems = supplementaryViews
//            return section
//        case 1:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(200),
//                    heightDimension: .absolute(200)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//            let verticalGroup = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(200),
//                    heightDimension: .absolute(400)
//                ),
//                subitem: item,
//                count: 2
//            )
//
//            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(200),
//                    heightDimension: .absolute(400)
//                ),
//                subitem: verticalGroup,
//                count: 1
//            )
//
//            // Section
//            let section = NSCollectionLayoutSection(group: horizontalGroup)
//            section.orthogonalScrollingBehavior = .continuous
//            section.boundarySupplementaryItems = supplementaryViews
//            return section
//        case 2:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//            let group = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1),
//                    heightDimension: .absolute(80)
//                ),
//                subitem: item,
//                count: 1
//            )
//
//            let section = NSCollectionLayoutSection(group: group)
//            section.boundarySupplementaryItems = supplementaryViews
//            return section
//        default:
//            // Item
//            let item = NSCollectionLayoutItem(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0)
//                )
//            )
//
//            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//            let group = NSCollectionLayoutGroup.vertical(
//                layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .absolute(390)
//                ),
//                subitem: item,
//                count: 1
//            )
//            let section = NSCollectionLayoutSection(group: group)
//            section.boundarySupplementaryItems = supplementaryViews
//            return section
//        }
//    }
//
