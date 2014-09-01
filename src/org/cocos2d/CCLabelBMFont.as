/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d
{
import starling.text.TextField;
import starling.utils.Color;

public class CCLabelBMFont extends CCLabelTTF
{
    public static function create(width:int, height:int, text:String, fontName:String="Verdana",
                                  fontSize:Number=12, color:uint=Color.WHITE, bold:Boolean=false):CCLabelBMFont
    {
        var result:CCLabelBMFont = new CCLabelBMFont();
        if (result.initWith(width, height, text, fontName, fontSize, color, bold))
        {
            return result;
        }
        return null;
    }

    public function CCLabelBMFont()
    {
    }

    public override function initWith(width:int, height:int, text:String, fontName:String="Verdana",
                                      fontSize:Number=12, color:uint=Color.WHITE, bold:Boolean=false):Boolean
    {
        if (TextField.getBitmapFont(fontName) == null)
        {
            throw new Error(fontName + " is not registered!");
        }
        if (!super.initWith(width, height, text, fontName, fontSize, color, bold))
        {
            return false;
        }
        return true;
    }
}
}
