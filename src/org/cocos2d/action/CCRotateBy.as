/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

import starling.utils.deg2rad;

public class CCRotateBy extends CCActionInterval
{
    private var _deltaRadian:Number;
    private var _startRadian:Number;

    public static function create(a_duration:Number, a_deltaAngle:Number):CCRotateBy
    {
        var result:CCRotateBy = new CCRotateBy();
        result.initRotateBy(a_duration, a_deltaAngle);
        return result;
    }

    public function CCRotateBy()
    {
    }

    public function initRotateBy(a_duration:Number, a_deltaAngle:Number)
    {
        super.initActionInterval(a_duration);
        _deltaRadian = deg2rad(a_deltaAngle);
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _startRadian = a_target.rotation;
    }

    public override function update(a_durationRatio:Number):void
    {
        target.rotation = _startRadian + _deltaRadian * a_durationRatio;
    }
}
}
