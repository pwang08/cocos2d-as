/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{

public class CCDelayTime extends CCActionInterval
{
    public static function create(a_duration:Number):CCDelayTime
    {
        var result:CCDelayTime = new CCDelayTime();
        result.initDelayTime(a_duration);
        return result;
    }

    public function CCDelayTime()
    {
    }

    public function initDelayTime(a_duration:Number):void
    {
        super.initActionInterval(a_duration);
    }
}
}
