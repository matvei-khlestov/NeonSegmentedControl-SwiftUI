//
//  NeonSegmentedControl+Pieces.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Visual building blocks and subviews for the neon segmented control
extension NeonSegmentedControl {

    /// Main container composing background, selection pill, and segment buttons
    @ViewBuilder
    func controlBody(layout: Layout) -> some View {
        ZStack {
            backgroundCapsule
            glassCapsule

            selectedPill(width: layout.pillWidth, height: layout.pillHeight)
                .position(x: layout.clampedCenterX, y: layout.centerY)
                .animation(.spring(response: 0.28, dampingFraction: 0.86), value: selectedIndex)

            segmentsRow(layout: layout)
        }
        .frame(height: Metrics.height)
    }

    /// Base background capsule with gradient fill
    private var backgroundCapsule: some View {
        RoundedRectangle(cornerRadius: Metrics.outerRadius, style: .continuous)
            .fill(backgroundGradient)
    }

    /// Glass-like overlay capsule providing glow and depth effects
    private var glassCapsule: some View {
        let shape = RoundedRectangle(cornerRadius: Metrics.outerRadius, style: .continuous)

        return shape
            .fill(containerFill)
            .overlay(shape.stroke(glassStroke, lineWidth: 1))
            .overlay(
                shape
                    .stroke(glassGlowStroke, lineWidth: 6)
                    .blur(radius: 4)
                    .mask(shape)
            )
            .insetShadow(shape, top: 0.26, bottom: 0.12, blur: 12, offset: 2)
            .shadow(color: Color.black.opacity(0.65), radius: 18, y: 10)
    }

    /// Horizontal row containing all segment buttons
    @ViewBuilder
    private func segmentsRow(layout: Layout) -> some View {
        HStack(spacing: Metrics.segmentSpacing) {
            ForEach(items.indices, id: \.self) { i in
                let isSelected = selectedIndex == i

                segmentButton(items[i], isSelected: isSelected)
                    .frame(width: layout.slotWidth, height: layout.slotHeight)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(response: 0.28, dampingFraction: 0.86)) {
                            selectedIndex = i
                        }
                    }
                    .background(
                        segmentChrome(isSelected: isSelected)
                            .padding(Metrics.pillInset)
                    )
                    .zIndex(isSelected ? 3 : 1)
            }
        }
        .padding(Metrics.innerPadding)
    }

    /// Button representing a single segment with icon and title
    @ViewBuilder
    private func segmentButton(_ item: NeonSegmentItem, isSelected: Bool) -> some View {
        HStack(spacing: 12) {
            Image(systemName: item.systemImage)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(isSelected ? Color.white : Color.white.opacity(0.55))

            Text(item.title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(isSelected ? Color.white : Color.white.opacity(0.55))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    /// Background and glow styling for an individual segment
    private func segmentChrome(isSelected: Bool) -> some View {
        Capsule(style: .continuous)
            .fill(inactiveSegmentFill(isSelected: isSelected))
            .overlay(
                Capsule(style: .continuous)
                    .stroke(inactiveSegmentStroke(isSelected: isSelected), lineWidth: 1)
            )
            .overlay(
                Capsule(style: .continuous)
                    .stroke(inactiveSegmentGlowStroke(isSelected: isSelected), lineWidth: 6)
                    .blur(radius: 4)
                    .mask(Capsule(style: .continuous))
            )
    }

    /// Animated selection pill highlighting the active segment
    private func selectedPill(width: CGFloat, height: CGFloat) -> some View {
        ZStack {
            Capsule(style: .continuous)
                .fill(selectedGradient)

            Capsule(style: .continuous)
                .fill(selectedHighlightGradient)
                .blendMode(.screen)

            Capsule(style: .continuous)
                .stroke(selectedStroke, lineWidth: 2)
                .shadow(color: selectedGlowPrimary.opacity(0.55), radius: 10)
                .shadow(color: selectedGlowSecondary.opacity(0.45), radius: 18)
        }
        .frame(width: width, height: height)
    }
}
