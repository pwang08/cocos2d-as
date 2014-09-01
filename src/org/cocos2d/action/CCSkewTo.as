/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCSkewTo extends CCActionInterval
{
    protected var _dstSkewX:Number;
    protected var _dstSkewY:Number;
    protected var _startSkewX:Number;
    protected var _startSkewY:Number;
    protected var _deltaSkewX:Number;
    protected var _deltaSkewY:Number;

    public static function create(a_duration:Number, a_dstSkewX:Number, a_dstSkewY:Number):CCSkewTo
    {
        var result:CCSkewTo = new CCSkewTo();
        result.initSkewTo(a_duration, a_dstSkewX, a_dstSkewY);
        return result;
    }

    public function CCSkewTo()
    {
    }

    public function initSkewTo(a_duration:Number, a_dstSkewX:Number, a_dstSkewY:Number):void
    {
        super.initActionInterval(a_duration);
        _dstSkewX = a_dstSkewX;
        _dstSkewY = a_dstSkewY;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _startSkewX = a_target.skewX;
        if (_startSkewX > 0)
        {
            _startSkewX = _startSkewX % 180.0;
        }
        else
        {
            _startSkewX = _startSkewX % -180.0;
        }
        _deltaSkewX = _dstSkewX - _startSkewX;
        if (_deltaSkewX > 180.0)
        {
            _deltaSkewX -= 360.0;
        }
        if (_deltaSkewX < -180.0)
        {
            _deltaSkewX += 360.0;
        }

        _startSkewY = a_target.skewY;
        if (_startSkewY > 0)
        {
            _startSkewY = _startSkewY % 360.0;
        }
        else
        {
            _startSkewY = _startSkewY % -360.0;
        }
        _deltaSkewY = _dstSkewY - _startSkewY;
        if (_deltaSkewY > 180.0)
        {
            _deltaSkewY -= 360.0;
        }
        if (_deltaSkewY < -180.0)
        {
            _deltaSkewY += 360.0;
        }
    }

    public override function update(a_durationRatio:Number):void
    {
        target.skewX = _startSkewX + _deltaSkewX * a_durationRatio;
        target.skewY = _startSkewY + _deltaSkewY * a_durationRatio;
    }
}
}
