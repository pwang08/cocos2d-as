/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import org.cocos2d.CCNode;

import starling.utils.deg2rad;

public class CCRotateTo extends CCActionInterval
{
    private var _dstRadian:Number;
    private var _startRadian:Number;
    private var _deltaRadian:Number;

    public static function create(a_duration:Number, a_angle:Number):CCRotateTo
    {
        var result:CCRotateTo = new CCRotateTo();
        result.initRotateTo(a_duration, a_angle);
        return result;
    }

    public function CCRotateTo()
    {
    }

    public function initRotateTo(a_duration:Number, a_angle:Number):void
    {
        super.initActionInterval(a_duration);
        _dstRadian = deg2rad(a_angle);
    }

    public override function startWithTarget(a_target:CCNode):void
    {
        super.startWithTarget(a_target);
        _startRadian = a_target.rotation;
        _deltaRadian = _dstRadian - _startRadian;
    }

    public override function update(a_durationRatio:Number):void
    {
        target.rotation = _startRadian + _deltaRadian * a_durationRatio;
    }
}
}
