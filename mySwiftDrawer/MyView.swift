//
//  MyView.swift
//  mySwiftDrawer
//
//  Created by user15 on 2017/9/11.
//  Copyright © 2017年 user15. All rights reserved.
//

import Cocoa

class MyView: NSView {
    //var line:[CGPoint] = []  //儲存 一條線的坐標,資料結構：Array<CGPoint>
    var lines:[[CGPoint]] = []  //儲存 多條線的坐標,資料結構：Array<Array<CGPoint>>
    var recycler:[[CGPoint]] = []  //資源回收桶 儲存被undo的坐標資料
    
    //MyView的呈現畫面
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        for line in lines {
            if line.count<2 {continue}  //畫線的坐標點數小於 2點，繼續畫
                
            let myPath = NSBezierPath()
            myPath.move(to: line[0])
            for i in 1..<line.count {
                myPath.line(to: line[i])
            }
            myPath.stroke()
        }

        /*
        //畫一條線 使用NSBezigerPath()  基本畫線程式
        var myPath = NSBezierPath()
        myPath.move(to: CGPoint(x:0,y:0))
        myPath.line(to: CGPoint(x:100,y:100))
        myPath.line(to: CGPoint(x:100,y:150))
        myPath.line(to: CGPoint(x:50,y:150))
        myPath.line(to: CGPoint(x:50,y:100))
        myPath.line(to: CGPoint(x:100,y:100))
        myPath.stroke()
        */
    }
    
    override func mouseDown(with event: NSEvent) {
        var line:[CGPoint] = []  //新的一條線的開始
        let px = event.locationInWindow.x
        let py = event.locationInWindow.y
        line += [CGPoint(x: px, y: py)]
        lines += [line]
        recycler = []
    }
    
    override func mouseDragged(with event: NSEvent) {
        let px = event.locationInWindow.x
        let py = event.locationInWindow.y
        //line += [CGPoint(x: px, y: py)]
        //重畫 needsDisplay = true
        //滑鼠拖曳方法，有屬性=>產生xy坐標數值，儲存至全域變數line
        
        //多條線的方法
        lines[lines.count - 1] += [CGPoint(x: px, y: py)]
        needsDisplay = true
    }
    
    func clearMe(){
        lines = []  //清除全部線的坐標
        recycler = []
        //lines.removeAll()  //也是清除全部線的坐標
        needsDisplay = true
    }
    
    func undo(){
        if lines.count > 0 {
            recycler += [lines.remove(at: lines.count - 1)]
            needsDisplay = true
        }
    }
    
    func redo() {
        if recycler.count > 0 {
            lines += [recycler.remove(at: recycler.count - 1)]
        }
        needsDisplay = true
    }
}
