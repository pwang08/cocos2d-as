/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{

public class CCFadeOut extends CCActionInterval
{
    public static function create(a_duration:Number):CCFadeOut
    {
        var result:CCFadeOut = new CCFadeOut();
        result.initFadeOut(a_duration);
        return result;
    }

    public function CCFadeOut()
    {
    }

    public function initFadeOut(a_duration:Number):void
    {
        super.initActionInterval(a_duration);
    }

    public override function update(a_durationRatio:Number):void
    {
        target.alpha = 1.0 - a_durationRatio;
    }
}
}
