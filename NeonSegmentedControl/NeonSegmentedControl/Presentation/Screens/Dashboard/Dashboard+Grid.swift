//
//  Dashboard+Grid.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Grid view displaying draggable dashboard tiles
struct TilesGrid: View {

    /// Binding to the tiles displayed in the grid
    @Binding var tiles: [Tile]
    /// Grid column configuration
    let columns: [GridItem]
    /// Visual style applied to each tile
    let style: TileStyle
    /// Currently dragged tile used for reordering
    @Binding var draggingItem: Tile?

    /// Main grid layout with drag-and-drop support
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: DashboardStyles.Grid.gridSpacing) {
                ForEach(tiles) { tile in
                    GeometryReader { geo in
                        /// Current tile size used for drag preview
                        let size = geo.size

                        TileCell(style: style, tint: tile.tint)
                            .frame(height: DashboardStyles.Tile.cellHeight)
                            .draggable(tile) {
                                RoundedRectangle(
                                    cornerRadius: DashboardStyles.Tile.cardCornerRadius,
                                    style: .continuous
                                )
                                .fill(.ultraThinMaterial)
                                .frame(width: size.width, height: size.height)
                                .onAppear { draggingItem = tile }
                            }
                            .dropDestination(for: Tile.self) { _, _ in
                                draggingItem = nil
                                return false
                            } isTargeted: { status in
                                handleReorder(tile: tile, isTargeted: status)
                            }
                    }
                    .frame(height: DashboardStyles.Tile.cellHeight)
                }
            }
            .padding(.horizontal, DashboardStyles.Layout.horizontalPadding)
            .padding(.top, DashboardStyles.Grid.topPadding)
            .padding(.bottom, DashboardStyles.Grid.bottomPadding)
        }
    }

    /// Handles tile reordering when a drag target is activated
    private func handleReorder(tile: Tile, isTargeted: Bool) {
        guard
            let draggingItem,
            isTargeted,
            draggingItem != tile,
            let sourceIndex = tiles.firstIndex(of: draggingItem),
            let destinationIndex = tiles.firstIndex(of: tile)
        else { return }

        withAnimation(.bouncy) {
            let moved = tiles.remove(at: sourceIndex)
            tiles.insert(moved, at: destinationIndex)
        }
    }
}
