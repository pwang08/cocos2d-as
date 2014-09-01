/**
 * Created by alanmars on 14-8-27.
 */
package org.cocos2d
{
import starling.core.Starling;

public class CCScene extends CCNode
{
    public static function create():CCScene
    {
        var result:CCScene = new CCScene();
        if (result.init())
        {
            return result;
        }
        return null;
    }

    public function CCScene()
    {
        ignoreAnchorPointForPosition = true;
    }

    public override function init():Boolean
    {
        if (!super.init())
        {
            return false;
        }
        anchorPointX = anchorPointY = 0.5;
        contentWidth = Starling.current.stage.stageWidth;
        contentHeight = Starling.current.stage.stageHeight;
        return true;
    }
}
}
