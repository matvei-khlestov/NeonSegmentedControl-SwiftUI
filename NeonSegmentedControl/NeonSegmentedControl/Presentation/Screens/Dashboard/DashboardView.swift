//
//  DashboardView.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Main dashboard screen with segmented control and draggable tiles grid
struct DashboardView: View {

    /// Currently selected segment index
    @State private var selectedIndex: Int = Segment.home.rawValue
    /// Tile that is currently being dragged
    @State private var draggingItem: Tile?

    /// Tiles displayed in the Home segment
    @State private var homeTiles: [Tile] = Tile.makeInitial()
    /// Tiles displayed in the Popular segment
    @State private var popularTiles: [Tile] = Tile.makeInitial()
    /// Tiles displayed in the Recent segment
    @State private var recentTiles: [Tile] = Tile.makeInitial()

    /// Configuration items for the segmented control
    private let items: [NeonSegmentItem] = [
        .init("Home", systemImage: "house.fill"),
        .init("Popular", systemImage: "flame.fill"),
        .init("Recent", systemImage: "clock")
    ]

    /// Grid layout configuration for tiles
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: DashboardStyles.Grid.columnSpacing),
        GridItem(.flexible(), spacing: DashboardStyles.Grid.columnSpacing),
        GridItem(.flexible(), spacing: DashboardStyles.Grid.columnSpacing)
    ]

    /// Currently active segment derived from selected index
    private var currentSegment: Segment {
        Segment(rawValue: selectedIndex) ?? .home
    }

    /// Binding to tiles array based on the active segment
    private var tiles: Binding<[Tile]> {
        switch currentSegment {
        case .home:
            return $homeTiles
        case .popular:
            return $popularTiles
        case .recent:
            return $recentTiles
        }
    }

    /// Main view body layout
    var body: some View {
        ZStack {
            DashboardBackground()

            VStack(spacing: DashboardStyles.Layout.stackSpacing) {
                NeonSegmentedControl(
                    items: items,
                    selectedIndex: $selectedIndex
                )
                .padding(.horizontal, DashboardStyles.Layout.horizontalPadding)
                .padding(.top, DashboardStyles.Layout.controlTopPadding)

                TilesGrid(
                    tiles: tiles,
                    columns: columns,
                    style: currentSegment.cellStyle,
                    draggingItem: $draggingItem
                )
            }
        }
    }
}
