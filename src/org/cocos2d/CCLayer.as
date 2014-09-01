/**
 * Created by alanmars on 14-8-27.
 */
package org.cocos2d
{
import starling.core.Starling;
import starling.display.Quad;
import starling.utils.Color;

public class CCLayer extends CCNode
{
    protected var _quad:Quad;

    public static function create():CCLayer
    {
        var result:CCLayer = new CCLayer();
        if (result.init())
        {
            return result;
        }
        return null;
    }

    public function CCLayer()
    {
        ignoreAnchorPointForPosition = true;
        _quad = null;
    }

    public override function init():Boolean
    {
        if (!super.init())
        {
            return false;
        }
        _quad = new Quad(Starling.current.stage.stageWidth, Starling.current.stage.stageHeight);
        _quad.color = Color.PURPLE;
        _quad.alpha = 1.0;
        addChild(_quad);
        anchorPointX = anchorPointY = 0.5;
        contentWidth = _quad.width;
        contentHeight = _quad.height;
        return true;
    }

    public override function get color():uint
    {
        return _quad.color;
    }

    public override function set color(value:uint):void
    {
        _quad.color = value;
    }
}
}
