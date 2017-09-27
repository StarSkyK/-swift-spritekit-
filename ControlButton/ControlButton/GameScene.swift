//
//  GameScene.swift
//  ControlButton
//
//  Created by WTFKL on 17/9/11.
//  Copyright © 2017年 WTF. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var k_centerPoint : SKShapeNode!;
    var Player : SKSpriteNode!;
    var k_circle : SKShapeNode!;
    var isMoving : Bool!;
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0);
        test();
    }
    
    func test(){
        //设置大圆
        self.backgroundColor = SKColor.red;
        k_circle = SKShapeNode.init(rectOf: CGSize.init(width: 106, height: 106), cornerRadius: 53);
        k_circle.position = CGPoint(x: 100, y: 100);
        k_circle.lineWidth = 2;
        k_circle.name = "k_circle";
        addChild(k_circle)
        //设置中心点
        k_centerPoint = SKShapeNode.init(circleOfRadius: 6);
        k_centerPoint.fillColor = SKColor.white;
        k_centerPoint.position = CGPoint(x: 100, y: 100);
        k_centerPoint.name = "k_centerPoint";
        addChild(k_centerPoint);
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {

    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        k_centerPoint.position = CGPoint(x: 100, y: 100);//触摸结束，将中心点复位
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        for t in touches {
            let position = t.location(in: self);
            let moveX = position.x - 100;
            let moveY = position.y - 100;
            let length = moveX * moveX + moveY * moveY;
            let lg = sqrt(length);
            if lg < 50 {
                k_centerPoint.position = position;
            }else{
                let outY = (50 * moveY)/lg;
                let outX = (50 * moveX)/lg;
                print("print(outY)",outY,"------",outX);
                k_centerPoint.position = CGPoint(x: outX + 100, y: outY + 100);
            }
        }
        
    }
}
