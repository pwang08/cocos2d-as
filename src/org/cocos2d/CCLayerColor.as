/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d
{
public class CCLayerColor extends CCLayer
{
    public static function create():CCLayerColor
    {
        var result = new CCLayerColor();
        if (result.init())
        {
            return result;
        }
        return null;
    }

    public function CCLayerColor()
    {
    }
}
}
