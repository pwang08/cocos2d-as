/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCSkewBy extends CCSkewTo
{
    private var _tmpDeltaSkewX:Number;
    private var _tmpDeltaSkewY:Number;

    public static function create(a_duration:Number, a_deltaSkewX:Number, a_deltaSkewY:Number):CCSkewBy
    {
        var result:CCSkewBy = new CCSkewBy();
        result.initSkewBy(a_duration, a_deltaSkewX, a_deltaSkewY);
        return result;
    }

    public function CCSkewBy()
    {
    }

    public function initSkewBy(a_duration:Number, a_deltaSkewX:Number, a_deltaSkewY:Number):void
    {
        super.initSkewTo(a_duration, a_deltaSkewX, a_deltaSkewY);
        _tmpDeltaSkewX = a_deltaSkewX;
        _tmpDeltaSkewY = a_deltaSkewY;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _deltaSkewX = _tmpDeltaSkewX;
        _deltaSkewY = _tmpDeltaSkewY;
        _dstSkewX = _startSkewX + _deltaSkewX;
        _dstSkewY = _startSkewY + _deltaSkewY;
    }
}
}
