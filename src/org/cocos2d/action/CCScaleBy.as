/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCScaleBy extends CCScaleTo
{
    public static function create(a_duration:Number, a_deltaScaleX:Number, a_deltaScaleY:Number):CCScaleBy
    {
        var result:CCScaleBy = new CCScaleBy();
        result.initScaleBy(a_duration, a_deltaScaleX, a_deltaScaleY);
        return result;
    }

    public function CCScaleBy()
    {
    }

    public function initScaleBy(a_duration:Number, a_deltaScaleX:Number, a_deltaScaleY:Number):void
    {
        super.initScaleTo(a_duration, a_deltaScaleX, a_deltaScaleY);
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _deltaScaleX = _startScaleX * _dstScaleX - _startScaleX;
        _deltaScaleY = _startScaleY * _dstScaleY - _startScaleY;
    }
}
}
