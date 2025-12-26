//
//  Dashboard+Styles.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Centralized style definitions for the dashboard UI
enum DashboardStyles {

    /// Background-related style constants
    enum Background {
        /// Main background gradient for the dashboard
        static let gradient = LinearGradient(
            colors: [
                DashboardColors.backgroundStart,
                DashboardColors.backgroundEnd
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    /// Layout spacing and padding constants
    enum Layout {
        /// Horizontal padding applied to main content
        static let horizontalPadding: CGFloat = 16
        /// Top padding for the segmented control
        static let controlTopPadding: CGFloat = 40
        /// Vertical spacing between stacked elements
        static let stackSpacing: CGFloat = 12
    }

    /// Grid layout spacing configuration
    enum Grid {
        /// Spacing between grid columns
        static let columnSpacing: CGFloat = 12
        /// Spacing between grid items
        static let gridSpacing: CGFloat = 12
        /// Top padding for the grid container
        static let topPadding: CGFloat = 16
        /// Bottom padding for the grid container
        static let bottomPadding: CGFloat = 24
    }

    /// Visual styling constants for dashboard tiles
    enum Tile {

        /// Fixed height of a tile cell
        static let cellHeight: CGFloat = 100

        /// Corner radius of the tile card
        static let cardCornerRadius: CGFloat = 16
        /// Background gradient fill for the tile card
        static let cardFill = LinearGradient(
            colors: [
                DashboardColors.cardTop,
                DashboardColors.cardBottom
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        /// Stroke color of the tile card border
        static let cardStroke: Color = DashboardColors.cardStroke
        /// Width of the tile card border stroke
        static let cardStrokeWidth: CGFloat = 1

        /// Shadow color applied to the tile card
        static let cardShadowColor: Color = DashboardColors.cardShadow
        /// Blur radius of the tile card shadow
        static let cardShadowRadius: CGFloat = 10
        /// Vertical offset of the tile card shadow
        static let cardShadowY: CGFloat = 3

        /// Size of the tile icon
        static let iconSize: CGFloat = 46
        /// Corner radius for square tile icons
        static let iconCornerRadius: CGFloat = 10

        /// Opacity applied to tile icon fill
        static let iconFillOpacity: Double = 0.82
        /// Opacity multiplier for the tile icon shadow
        static let iconShadowOpacity: Double = DashboardColors.tileShadowMultiplier
        /// Blur radius of the tile icon shadow
        static let iconShadowRadius: CGFloat = 12

        /// Font size for the star icon style
        static let starFontSize: CGFloat = 30
        /// Opacity applied to the star icon
        static let starOpacity: Double = 0.78
        /// Opacity multiplier for the star icon shadow
        static let starShadowOpacity: Double = DashboardColors.starShadowMultiplier
        /// Blur radius of the star icon shadow
        static let starShadowRadius: CGFloat = 12
    }
}
