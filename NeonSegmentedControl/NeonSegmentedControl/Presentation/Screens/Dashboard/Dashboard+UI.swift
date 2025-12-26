//
//  Dashboard+UI.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Background view rendering the dashboard gradient
struct DashboardBackground: View {
    /// Background layout covering the entire safe area
    var body: some View {
        DashboardStyles.Background.gradient
            .ignoresSafeArea()
    }
}

/// Visual representation of a single dashboard tile
struct TileCell: View {
    
    /// Tile visual style determining its shape and content
    let style: TileStyle
    /// Tint color used for the tile icon or shape
    let tint: Color
    
    /// Tile layout composed of background card and styled content
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DashboardStyles.Tile.cardCornerRadius, style: .continuous)
                .fill(DashboardStyles.Tile.cardFill)
                .overlay(
                    RoundedRectangle(cornerRadius: DashboardStyles.Tile.cardCornerRadius, style: .continuous)
                        .stroke(DashboardStyles.Tile.cardStroke, lineWidth: DashboardStyles.Tile.cardStrokeWidth)
                )
                .shadow(
                    color: DashboardStyles.Tile.cardShadowColor,
                    radius: DashboardStyles.Tile.cardShadowRadius,
                    y: DashboardStyles.Tile.cardShadowY
                )
            
            switch style {
            case .square:
                RoundedRectangle(cornerRadius: DashboardStyles.Tile.iconCornerRadius, style: .continuous)
                    .fill(tint.opacity(DashboardStyles.Tile.iconFillOpacity))
                    .frame(width: DashboardStyles.Tile.iconSize, height: DashboardStyles.Tile.iconSize)
                    .shadow(color: tint.opacity(DashboardStyles.Tile.iconShadowOpacity), radius: DashboardStyles.Tile.iconShadowRadius)
                
            case .coralStar:
                Image(systemName: "star.fill")
                    .font(.system(size: DashboardStyles.Tile.starFontSize, weight: .semibold))
                    .foregroundStyle(tint.opacity(DashboardStyles.Tile.starOpacity))
                    .shadow(color: tint.opacity(DashboardStyles.Tile.starShadowOpacity), radius: DashboardStyles.Tile.starShadowRadius)
                
            case .circle:
                Circle()
                    .fill(tint.opacity(DashboardStyles.Tile.iconFillOpacity))
                    .frame(width: DashboardStyles.Tile.iconSize, height: DashboardStyles.Tile.iconSize)
                    .shadow(color: tint.opacity(DashboardStyles.Tile.iconShadowOpacity), radius: DashboardStyles.Tile.iconShadowRadius)
            }
        }
    }
}
