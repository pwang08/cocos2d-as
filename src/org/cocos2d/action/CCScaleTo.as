/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCScaleTo extends CCActionInterval
{
    protected var _dstScaleX:Number;
    protected var _dstScaleY:Number;
    protected var _startScaleX:Number;
    protected var _startScaleY:Number;
    protected var _deltaScaleX:Number;
    protected var _deltaScaleY:Number;

    public static function create(a_duration:Number, a_scaleX:Number, a_scaleY:Number):CCScaleTo
    {
        var result:CCScaleTo = new CCScaleTo();
        result.initScaleTo(a_duration, a_scaleX, a_scaleY);
        return result;
    }

    public function CCScaleTo()
    {
    }

    public function initScaleTo(a_duration:Number, a_scaleX:Number, a_scaleY:Number):void
    {
        super.initActionInterval(a_duration);
        _dstScaleX = a_scaleX;
        _dstScaleY = a_scaleY;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _startScaleX = a_target.scaleX;
        _startScaleY = a_target.scaleY;
        _deltaScaleX = _dstScaleX - _startScaleX;
        _deltaScaleY = _dstScaleY - _startScaleY;
    }

    public override function update(a_durationRatio:Number):void
    {
        target.scaleX = _startScaleX + _deltaScaleX * a_durationRatio;
        target.scaleY = _startScaleY + _deltaScaleY * a_durationRatio;
    }
}
}
