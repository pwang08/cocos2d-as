/**
 * Created by alanmars on 14-8-27.
 */
package org.cocos2d
{

import flash.geom.Rectangle;

import org.cocos2d.action.CCAction;
import org.cocos2d.action.CCActionManager;

import starling.core.RenderSupport;
import starling.core.Starling;
import starling.display.DisplayObject;

import starling.display.Sprite;
import starling.display.Stage;
import starling.events.Event;
import starling.utils.Color;

public class CCNode extends Sprite
{
    public static const CCNODE_INVALID_TAG:int = -1;
    private static var _s_orderOfArrival:int = 0;

    private var _isRunning:Boolean;
    private var _y:Number;
    private var _anchorPointX:Number;
    private var _anchorPointY:Number;
    private var _contentWidth:Number;
    private var _contentHeight:Number;
    private var _color:uint;
    private var _clipRect:Rectangle;

    private var _ignoreAnchorPointForPosition:Boolean;
    private var _childrenZOrderDirty:Boolean;
    private var _orderOfArrival:int;
    private var _zorder:int;
    private var _tag:int;

    public static function create():CCNode
    {
        var result:CCNode = new CCNode();
        if (result.init())
        {
            return result;
        }
        return null;
    }

    public function CCNode()
    {
        _isRunning = false;
        _y = 0.0;
        _anchorPointX = _anchorPointY = _contentWidth = _contentHeight = 0.0;
        _color = Color.WHITE;
        _ignoreAnchorPointForPosition = false;
        _childrenZOrderDirty = false;
        _orderOfArrival = 0;
        _zorder = 0;
        _tag = CCNODE_INVALID_TAG;
    }

    public function init():Boolean
    {
        addEventListener(Event.ADDED, onAdded);
        addEventListener(Event.REMOVED, onRemoved);
        return true;
    }

    public function get isRunning():Boolean
    {
        return _isRunning;
    }

    public override function get y():Number
    {
        return _y;
    }

    public override function set y(value:Number):void
    {
        _y = value;
    }

    public function get anchorPointX():Number
    {
        return _anchorPointX;
    }

    public function set anchorPointX(value:Number):void
    {
        _anchorPointX = value;
    }

    public function get anchorPointY():Number
    {
        return _anchorPointY;
    }

    public function set anchorPointY(value:Number):void
    {
        _anchorPointY = value;
    }

    public function get contentWidth():Number
    {
        return _contentWidth;
    }

    public function set contentWidth(value:Number):void
    {
        _contentWidth = value;
    }

    public function get contentHeight():Number
    {
        return _contentHeight;
    }

    public function set contentHeight(value:Number):void
    {
        _contentHeight = value;
    }

    public function get color():uint
    {
        return _color;
    }

    public function set color(value:uint):void
    {
        _color = color;
    }

    public override function get clipRect():Rectangle
    {
        return _clipRect;
    }

    public override function set clipRect(value:Rectangle):void
    {
        if (_clipRect && value)
        {
            _clipRect.copyFrom(value);
        }
        else
        {
            _clipRect = (value ? value.clone() : null);
        }
    }

    public function get ignoreAnchorPointForPosition():Boolean
    {
        return _ignoreAnchorPointForPosition;
    }

    public function set ignoreAnchorPointForPosition(value:Boolean):void
    {
        _ignoreAnchorPointForPosition = value;
    }

    public function get zorder():int
    {
        return _zorder;
    }

    public function set zorder(value:int):void
    {
        _zorder = value;
    }

    public function get tag():int
    {
        return _tag;
    }

    public function set tag(value:int):void
    {
        _tag = value;
    }

    private function transformY():void
    {
        if (parent == null)
        {
            return;
        }
        if (parent is Stage)
        {
            super.y = Starling.current.stage.stageHeight - _y;
        }
        else
        {
            var parentNode:CCNode = parent as CCNode;
            super.y = parentNode.contentHeight - _y;
        }
    }

    private function transformPivot():void
    {
        if (_ignoreAnchorPointForPosition)
        {
            pivotX = 0.0;
            pivotY = 1.0 * contentHeight;
        }
        else
        {
            pivotX = anchorPointX * contentWidth;
            pivotY = (1.0 - anchorPointY) * contentHeight;
        }
    }

    private function transformClipRect():void
    {
        if (_clipRect != null)
        {
            super.clipRect = _clipRect;
            super.clipRect.y =  -_clipRect.y - _clipRect.height;
        }
    }

    public function transform():void
    {
        transformY();
        transformPivot();
        transformClipRect();
    }

    protected function onAdded(event:Event):void
    {
        if (event.target != this)
        {
            return;
        }
        if (parent is Stage)
        {
            _isRunning = true;
        }
        else if (parent is CCNode)
        {
            var parentNode:CCNode = parent as CCNode;
            _isRunning = parentNode.isRunning;
        }
        else
        {
            throw new Error("The parent of CCNode is either Stage or CCNode");
        }
    }

    protected function onRemoved(event:Event):void
    {
        if (event.target != this)
        {
            return;
        }
        _isRunning = false;
    }

    public function addChildV3(a_childNode:CCNode, a_zorder:int, a_tag:int):CCNode
    {
        a_childNode._orderOfArrival = ++ _s_orderOfArrival;
        a_childNode.zorder = a_zorder;
        a_childNode.tag = a_tag;
        _childrenZOrderDirty = true;
        return super.addChild(a_childNode) as CCNode;
    }

    public function addChildV2(a_childNode:CCNode, a_zorder:int):CCNode
    {
        return addChildV3(a_childNode, a_zorder, a_childNode.tag);
    }

    public function addChildV1(a_childNode:CCNode):CCNode
    {
        return addChildV2(a_childNode, a_childNode.zorder);
    }

    public override function dispose():void
    {
        dispatchEventWith(Event.REMOVE_FROM_JUGGLER);
        super.dispose();
    }

    public override function render(a_support:RenderSupport, a_parentAlpha:Number):void
    {
        sortChildrenByZOrder();
        transform();

        super.render(a_support, a_parentAlpha);
    }

    private function sortChildrenByZOrder():void
    {
        if (_childrenZOrderDirty)
        {
            sortChildren(compareNodeByZOrder);
            _childrenZOrderDirty = false;
        }
    }

    private static function compareNodeByZOrder(a_node1:DisplayObject, a_node2:DisplayObject):int
    {
        var node1:CCNode = a_node1 as CCNode;
        var node2:CCNode = a_node2 as CCNode;
        if (node1 == null)
        {
            return -1;
        }
        if (node2 == null)
        {
            return 1;
        }
        if (node1.zorder != node2.zorder)
        {
            return node1.zorder - node2.zorder;
        }
        else
        {
            return node1._orderOfArrival - node2._orderOfArrival;
        }
    }

    public function getChildByTag(a_tag:int):CCNode
    {
        if (a_tag == CCNODE_INVALID_TAG)
        {
            throw new Error("Invalid parameter for getChildByTag!");
        }
        for (var i:int = 0; i < numChildren; ++ i)
        {
            var childNode:CCNode = getChildAt(i) as CCNode;
            if (childNode != null && childNode.tag == a_tag)
            {
                return childNode;
            }
        }
        return childNode;
    }

    public function runAction(a_action:CCAction):void
    {
        CCActionManager.instance.addAction(a_action, this);
    }

    public function stopAllActions():void
    {
        CCActionManager.instance.removeAllActionsFromTarget(this);
    }

    public function stopAction(a_action:CCAction):void
    {
        CCActionManager.instance.removeAction(a_action);
    }
}
}
