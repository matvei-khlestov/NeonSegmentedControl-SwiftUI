//
//  Dashboard+Models.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Available dashboard segments
enum Segment: Int, CaseIterable {
    case home
    case popular
    case recent
}

/// Model representing a draggable dashboard tile
struct Tile: Identifiable, Hashable, Codable, Transferable {
    
    /// Unique identifier of the tile
    let id: UUID
    
    /// Creates a tile with a unique identifier
    init(id: UUID = UUID()) {
        self.id = id
    }
    
    /// Generates a deterministic tint color based on tile identifier
    var tint: Color {
        let hash = abs(id.hashValue)
        let r = Double((hash & 0xFF0000) >> 16) / 255.0
        let g = Double((hash & 0x00FF00) >> 8) / 255.0
        let b = Double(hash & 0x0000FF) / 255.0
        
        return Color(
            red: DashboardColors.tintBase + r * DashboardColors.tintRange,
            green: DashboardColors.tintBase + g * DashboardColors.tintRange,
            blue: DashboardColors.tintBase + b * DashboardColors.tintRange
        )
    }
    
    /// Creates an initial set of tiles for the dashboard
    static func makeInitial(count: Int = 9) -> [Tile] {
        (0..<count).map { _ in Tile() }
    }
    
    /// Transfer representation used for drag and drop support
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .data)
    }
}

/// Visual styles available for dashboard tiles
enum TileStyle {
    case square
    case coralStar
    case circle
}

/// Segment-related presentation helpers
extension Segment {
    /// Tile style associated with the current segment
    var cellStyle: TileStyle {
        switch self {
        case .home:
            return .square
        case .popular:
            return .coralStar
        case .recent:
            return .circle
        }
    }
}
