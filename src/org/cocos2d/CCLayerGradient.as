/**
 * Created by alanmars on 14-8-28.
 */
package org.cocos2d
{
public class CCLayerGradient extends CCLayerColor
{
    public static function create():CCLayerGradient
    {
        var result = new CCLayerGradient();
        if (result.init())
        {
            return result;
        }
        return null;
    }

    public function CCLayerGradient()
    {
    }
}
}
