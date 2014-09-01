/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{

public class CCFadeIn extends CCActionInterval
{
    public static function create(a_duration:Number):CCFadeIn
    {
        var result:CCFadeIn = new CCFadeIn();
        result.initFadeIn(a_duration);
        return result;
    }

    public function CCFadeIn()
    {
    }

    public function initFadeIn(a_duration:Number):void
    {
        super.initActionInterval(a_duration);
    }

    public override function update(a_durationRatio:Number):void
    {
        target.alpha = a_durationRatio;
    }
}
}
