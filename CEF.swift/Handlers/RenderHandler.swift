//
//  RenderHandler.swift
//  CEF.swift
//
//  Created by Tamas Lustyik on 2015. 08. 11..
//  Copyright © 2015. Tamas Lustyik. All rights reserved.
//

import Foundation

public enum OnStartDraggingAction {
    case Allow
    case Cancel
}

extension OnStartDraggingAction: BooleanType {
    public var boolValue: Bool { return self == .Allow }
}

/// Implement this interface to handle events when window rendering is disabled.
/// The methods of this class will be called on the UI thread.
public protocol RenderHandler {
    
    /// Called to retrieve the root window rectangle in screen coordinates. Return
    /// true if the rectangle was provided.
    func rootScreenRectForBrowser(browser: Browser) -> NSRect?
    
    /// Called to retrieve the view rectangle which is relative to screen
    /// coordinates. Return true if the rectangle was provided.
    func viewRectForBrowser(browser: Browser) -> NSRect?
    
    /// Called to retrieve the translation from view coordinates to actual screen
    /// coordinates. Return true if the screen coordinates were provided.
    func screenPointForBrowser(browser: Browser, viewPoint: NSPoint) -> NSPoint?
    
    /// Called to allow the client to fill in the CefScreenInfo object with
    /// appropriate values. Return true if the |screen_info| structure has been
    /// modified.
    /// If the screen info rectangle is left empty the rectangle from GetViewRect
    /// will be used. If the rectangle is still empty or invalid popups may not be
    /// drawn correctly.
    func screenInfoForBrowser(browser: Browser) -> ScreenInfo?
    
    /// Called when the browser wants to show or hide the popup widget. The popup
    /// should be shown if |show| is true and hidden if |show| is false.
    func onPopupShow(browser: Browser, showing: Bool)
    
    /// Called when the browser wants to move or resize the popup widget. |rect|
    /// contains the new location and size in view coordinates.
    func onPopupSize(browser: Browser, rect: NSRect)
    
    /// Called when an element should be painted. Pixel values passed to this
    /// method are scaled relative to view coordinates based on the value of
    /// CefScreenInfo.device_scale_factor returned from GetScreenInfo. |type|
    /// indicates whether the element is the view or the popup widget. |buffer|
    /// contains the pixel data for the whole image. |dirtyRects| contains the set
    /// of rectangles in pixel coordinates that need to be repainted. |buffer| will
    /// be |width|*|height|*4 bytes in size and represents a BGRA image with an
    /// upper-left origin.
    func onPaint(browser: Browser,
                 type: PaintElementType,
                 dirtyRects: [NSRect],
                 buffer: UnsafePointer<Void>,
                 size: NSSize)
    
    /// Called when the browser's cursor has changed. If |type| is CT_CUSTOM then
    /// |custom_cursor_info| will be populated with the custom cursor information.
    func onCursorChange(browser: Browser,
                        cursor: CursorHandle,
                        type: CursorType,
                        cursorInfo: CursorInfo?)
    
    /// Called when the user starts dragging content in the web view. Contextual
    /// information about the dragged content is supplied by |drag_data|.
    /// (|x|, |y|) is the drag start location in screen coordinates.
    /// OS APIs that run a system message loop may be used within the
    /// StartDragging call.
    /// Return false to abort the drag operation. Don't call any of
    /// CefBrowserHost::DragSource*Ended* methods after returning false.
    /// Return true to handle the drag operation. Call
    /// CefBrowserHost::DragSourceEndedAt and DragSourceSystemDragEnded either
    /// synchronously or asynchronously to inform the web view that the drag
    /// operation has ended.
    func onStartDragging(browser: Browser,
                         dragData: DragData,
                         operationMask: DragOperationsMask,
                         location: NSPoint) -> OnStartDraggingAction
    
    /// Called when the web view wants to update the mouse cursor during a
    /// drag & drop operation. |operation| describes the allowed operation
    /// (none, move, copy, link).
    func onUpdateDragCursor(browser: Browser, operation: DragOperationsMask)
    
    /// Called when the scroll offset has changed.
    func onScrollOffsetChanged(browser: Browser, offset: NSPoint)

}

public extension RenderHandler {
    
    func rootScreenRectForBrowser(browser: Browser) -> NSRect? {
        return nil
    }

    func viewRectForBrowser(browser: Browser) -> NSRect? {
        return nil
    }

    func screenPointForBrowser(browser: Browser, viewPoint: NSPoint) -> NSPoint? {
        return nil
    }
    
    func screenInfoForBrowser(browser: Browser) -> ScreenInfo? {
        return nil
    }

    func onPopupShow(browser: Browser, showing: Bool) {
    }

    func onPopupSize(browser: Browser, rect: NSRect) {
    }

    func onPaint(browser: Browser,
                 type: PaintElementType,
                 dirtyRects: [NSRect],
                 buffer: UnsafePointer<Void>,
                 size: NSSize) {
    }

    func onCursorChange(browser: Browser,
                        cursor: CursorHandle,
                        type: CursorType,
                        cursorInfo: CursorInfo?) {
    }

    func onStartDragging(browser: Browser,
                         dragData: DragData,
                         operationMask: DragOperationsMask,
                         location: NSPoint) -> OnStartDraggingAction {
        return .Cancel
    }

    func onUpdateDragCursor(browser: Browser, operation: DragOperationsMask) {
    }

    func onScrollOffsetChanged(browser: Browser, offset: NSPoint) {
    }
    
}
