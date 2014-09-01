/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d
{
import starling.display.Button;
import starling.events.Event;
import starling.textures.Texture;

public class CCControlButton extends CCNode
{
    private var _button:Button;

    public static function create(upState:Texture, text:String="", downState:Texture=null,
                           overState:Texture=null, disabledState:Texture=null):CCControlButton
    {
        var result:CCControlButton = new CCControlButton();
        if (result.initWithTextureAndTitle(upState, text, downState, overState, disabledState))
        {
            return result;
        }
        return null;
    }

    public function CCControlButton()
    {
        _button = null;
    }

    public function initWithTextureAndTitle(upState:Texture, text:String="", downState:Texture=null,
                                            overState:Texture=null, disabledState:Texture=null):Boolean
    {
        if (!init())
        {
            return false;
        }
        _button = new Button(upState, text, downState, overState, disabledState);
        _button.addEventListener(Event.TRIGGERED, onButtonTriggered);
        addChild(_button);
        anchorPointX = anchorPointY = 0.5;
        contentWidth = _button.width;
        contentHeight = _button.height;
        return true;
    }

    private function onButtonTriggered(event:Event):void
    {
        dispatchEventWith(event.type, true);
    }
}
}
