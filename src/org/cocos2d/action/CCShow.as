/**
 * Created by alanmars on 14-9-1.
 */
package org.cocos2d.action
{
public class CCShow extends CCActionInstant
{
    public static function create():CCShow
    {
        var result:CCShow = new CCShow();
        return result;
    }

    public function CCShow()
    {
    }

    public override function update(a_durationRatio:Number):void
    {
        target.visible = true;
    }
}
}
