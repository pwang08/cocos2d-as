/**
 * Created by alanmars on 14-9-1.
 */
package org.cocos2d.action
{
public class CCHide extends CCActionInstant
{
    public static function create():CCHide
    {
        var result:CCHide = new CCHide();
        return result;
    }

    public function CCHide()
    {
    }

    public override function update(a_durationRatio:Number):void
    {
        target.visible = false;
    }
}
}
