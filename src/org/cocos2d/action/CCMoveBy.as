/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCMoveBy extends CCActionInterval
{
    protected var _deltaX:Number;
    protected var _deltaY:Number;

    private var _prevX:Number;
    private var _prevY:Number;
    private var _startX:Number;
    private var _startY:Number;

    public static function create(a_duration:Number, a_deltaX:Number, a_deltaY:Number):CCMoveBy
    {
        var result:CCMoveBy = new CCMoveBy();
        result.initMoveBy(a_duration, a_deltaX, a_deltaY);
        return result;
    }

    public function CCMoveBy()
    {
    }

    public function initMoveBy(a_duration:Number, a_deltaX:Number, a_deltaY:Number):void
    {
        super.initActionInterval(a_duration);
        _deltaX = a_deltaX;
        _deltaY = a_deltaY;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _prevX = _startX = a_target.x;
        _prevY = _startY = a_target.y;
    }

    public override function update(durationRatio:Number):void
    {
        var curX:Number = target.x;
        var curY:Number = target.y;
        var diffX:Number = curX - _prevX;
        var diffY:Number = curY - _prevY;
        _startX += diffX;
        _startY += diffY;
        target.x = _startX + _deltaX * durationRatio;
        target.y = _startY + _deltaY * durationRatio;
        _prevX = target.x;
        _prevY = target.y;
    }
}
}
