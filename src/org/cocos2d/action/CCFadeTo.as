/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCFadeTo extends CCActionInterval
{
    private var _dstAlpha:Number;
    private var _startAlpha:Number;

    /**
     *
     * @param a_duration
     * @param a_dstAlpha - The opacity of the object. 0 = transparent, 1 = opaque.
     * @return
     */
    public static function create(a_duration:Number, a_dstAlpha:Number):CCFadeTo
    {
        var result:CCFadeTo = new CCFadeTo();
        result.initFadeTo(a_duration, a_dstAlpha);
        return result;
    }

    public function CCFadeTo()
    {
    }

    public function initFadeTo(a_duration:Number, a_dstAlpha:Number):void
    {
        super.initActionInterval(a_duration);
        _dstAlpha = a_dstAlpha;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _startAlpha = a_target.alpha;
    }

    public override function update(a_durationRatio:Number):void
    {
        target.alpha = _startAlpha + (_dstAlpha - _startAlpha) * a_durationRatio;
    }
}
}
