/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d
{
import starling.text.TextField;
import starling.utils.Color;

public class CCLabelTTF extends CCNode
{
    protected var _label:TextField;

    public static function create(width:int, height:int, text:String, fontName:String="Verdana",
                                  fontSize:Number=12, color:uint=Color.WHITE, bold:Boolean=false):CCLabelTTF
    {
        var result:CCLabelTTF = new CCLabelTTF();
        if (result.initWith(width, height, text, fontName, fontSize, color, bold))
        {
            return result;
        }
        return null;
    }

    public function CCLabelTTF()
    {
        _label = null;
    }

    public function initWith(width:int, height:int, text:String, fontName:String="Verdana",
                             fontSize:Number=12, color:uint=Color.WHITE, bold:Boolean=false):Boolean
    {
        if (!init())
        {
            return false;
        }
        _label = new TextField(width, height, text, fontName, fontSize, color, bold);
        addChild(_label);
        anchorPointX = anchorPointY = 0.5;
        contentWidth = _label.width;
        contentHeight = _label.height;
        return true;
    }

    public override function get color():uint
    {
        return _label.color;
    }

    public override function set color(value:uint):void
    {
        _label.color = value;
    }
}
}
