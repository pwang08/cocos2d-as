/**
 * Created by alanmars on 14-8-27.
 */
package org.cocos2d
{

import starling.display.Image;
import starling.textures.Texture;

public class CCSprite extends CCNode
{
    private var _image:Image;

    public static function createWithTexture(a_texture:Texture):CCSprite
    {
        var result:CCSprite = new CCSprite();
        if (result.initWithTexture(a_texture))
        {
            return result;
        }
        return null;
    }

    public function CCSprite()
    {
        _image = null;
    }

    public override function init():Boolean
    {
        if (!super.init())
        {
            return false;
        }
        return true;
    }

    public function initWithTexture(a_texture:Texture):Boolean
    {
        if (!init())
        {
            return false;
        }
        anchorPointX = anchorPointY = 0.5;
        texture = a_texture;
        return true;
    }

    public function get texture():Texture
    {
        return _image.texture;
    }

    public function set texture(a_texture:Texture):void
    {
        if (_image != null)
        {
            _image.removeFromParent();
        }
        _image = new Image(a_texture);
        addChild(_image);
        contentWidth = _image.width;
        contentHeight = _image.height;
    }

    public override function get color():uint
    {
        return _image.color;
    }

    public override function set color(value:uint):void
    {
        _image.color = value;
    }
}
}
