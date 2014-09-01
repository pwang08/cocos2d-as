/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

public class CCMoveTo extends CCMoveBy
{
    protected var _endX:Number;
    protected var _endY:Number;

    public static function create(a_duration:Number, a_endX:Number, a_endY:Number):CCMoveTo
    {
        var result:CCMoveTo = new CCMoveTo();
        result.initMoveTo(a_duration, a_endX, a_endY);
        return result;
    }

    public function CCMoveTo()
    {
    }

    public function initMoveTo(a_duration:Number, a_endX:Number, a_endY:Number):void
    {
        super.initActionInterval(a_duration);
        _endX = a_endX;
        _endY = a_endY;
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _deltaX = _endX - target.x;
        _deltaY = _endY - target.y;
    }
}
}
