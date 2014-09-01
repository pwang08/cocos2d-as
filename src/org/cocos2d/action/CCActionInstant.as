/**
 * Created by alanmars on 14-9-1.
 */
package org.cocos2d.action
{
import flash.utils.getQualifiedClassName;

import starling.errors.AbstractClassError;

public class CCActionInstant extends CCFiniteTimeAction
{
    public function CCActionInstant()
    {
        if (getQualifiedClassName(this) == "org.cocos2d.action::CCActionInstant")
        {
            throw new AbstractClassError();
        }
    }

    public override function advanceTime(time:Number):void
    {
        update(1.0);
    }

    public override function update(a_durationRatio:Number):void
    {
    }

    public override function get isDone():Boolean
    {
        return true;
    }
}
}
