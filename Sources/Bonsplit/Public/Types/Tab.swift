import Foundation
import SwiftUI

/// Represents a tab's metadata (read-only snapshot for library consumers)
public struct Tab: Identifiable, Hashable {
    public let id: TabID
    public let title: String
    public let hasCustomTitle: Bool
    public let icon: String?
    /// Optional image data (PNG recommended) for the tab icon. When present, this takes precedence over `icon`.
    public let iconImageData: Data?
    /// Consumer-defined tab kind identifier (for example, "terminal" or "browser").
    public let kind: String?
    public let isDirty: Bool
    /// Whether the tab should show an "unread/activity" badge (library consumer-defined meaning).
    public let showsNotificationBadge: Bool
    /// Whether the tab should show an activity/loading indicator (e.g. spinning icon).
    public let isLoading: Bool
    /// Whether the tab is pinned in its pane.
    public let isPinned: Bool
    /// Optional short badge text displayed before the title (e.g. "T1", "T2").
    public let badge: String?
    /// Optional badge text color. When nil, uses default secondary color.
    public let badgeColor: Color?

    public init(
        id: TabID = TabID(),
        title: String,
        hasCustomTitle: Bool = false,
        icon: String? = nil,
        iconImageData: Data? = nil,
        kind: String? = nil,
        isDirty: Bool = false,
        showsNotificationBadge: Bool = false,
        isLoading: Bool = false,
        isPinned: Bool = false,
        badge: String? = nil,
        badgeColor: Color? = nil
    ) {
        self.id = id
        self.title = title
        self.hasCustomTitle = hasCustomTitle
        self.icon = icon
        self.iconImageData = iconImageData
        self.kind = kind
        self.isDirty = isDirty
        self.showsNotificationBadge = showsNotificationBadge
        self.isLoading = isLoading
        self.isPinned = isPinned
        self.badge = badge
        self.badgeColor = badgeColor
    }

    internal init(from tabItem: TabItem) {
        self.id = TabID(id: tabItem.id)
        self.title = tabItem.title
        self.hasCustomTitle = tabItem.hasCustomTitle
        self.icon = tabItem.icon
        self.iconImageData = tabItem.iconImageData
        self.kind = tabItem.kind
        self.isDirty = tabItem.isDirty
        self.showsNotificationBadge = tabItem.showsNotificationBadge
        self.isLoading = tabItem.isLoading
        self.isPinned = tabItem.isPinned
        self.badge = tabItem.badge
        self.badgeColor = tabItem.badgeColor
    }
}
