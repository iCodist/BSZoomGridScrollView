//
//  BSZoomGridBaseViewController.swift
//  BSZoomGridScrollView
//
//  Created by Jang seoksoon on 2019/11/19.
//
//  Copyright (c) 2019 Jang seoksoon <boraseoksoon@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class BSZoomGridBaseViewController: UIViewController {
    // MARK: - Initializers
    /// Using constuctor Dependency Injection, all initialization should be done in the constructor.
    ///
    /// - Parameters:
    ///   - parentView: a parent view to add scrollView as subview
    ///   - imagesToZoom: image array in grid to be displayed.
    ///                   if image numbers are not enough to fill the grid, it will be repeated until grid is fully drawn.
    ///   - powerOfZoomBounce: a value to be able to choose from enum four enumeration types
    ///   - numberOfRows: number of row to be applied in a row.
    ///   - didLongPressItem: closure that will indicates which UIImage is decided to be chosen, by a long touch.
    ///   - didFinishDraggingOnItem: closure that will indicates
    ///                              which UIImage is decided to be chosen, by a end of pan gesture touch.
    /// - Returns: Initializer
    init(imagesToZoom: [UIImage],
         powerOfZoomBounce: ZoomBounceRatio,
         numberOfColumns: Int,
         numberOfRows: Int,
         didLongPressItem: ((_: UIImage) -> Void)?,
         didFinishDraggingOnItem: ((_: UIImage) -> Void)?) {
        
        guard imagesToZoom.count > 0 else {
            fatalError("At least, image array containing more than one image should be provided!")
        }
        
        /// Closures
        self.didLongPressItem = didLongPressItem
        self.didFinishDraggingOnItem = didFinishDraggingOnItem
        
        self.imagesToZoom = imagesToZoom
        self.powerOfZoomBounce = powerOfZoomBounce
        
        super.init(nibName: nil, bundle: nil)
        
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
    }
    
    required init?(coder: NSCoder) {
        fatalError("""
                init(coder:) has not been implemented.\n
                Creating BSZoomGridScrollViewController programmatically is only allowed.
        """)
    }
    
    // MARK: - Private Instance Variables
    /// private accessor goes here.
    internal private(set) var didLongPressItem: ((_: UIImage) -> Void)?
    internal private(set) var didFinishDraggingOnItem: ((_: UIImage) -> Void)?
    
    internal private(set) var imagesToZoom: [UIImage]
    
    internal private(set) var powerOfZoomBounce: ZoomBounceRatio
    
    private var _numberOfColumns: CGFloat = 70.0
    private(set) var numberOfColumns: Int {
        get {
            return Int(_numberOfColumns)
        }
        set {
            _numberOfColumns = CGFloat(newValue)
        }
    }
    
    private var _numberOfRows: CGFloat = 30.0
    private(set) var numberOfRows: Int {
        get {
            return Int(_numberOfRows)
        }
        set {
            _numberOfRows = CGFloat(newValue)
        }
    }
}