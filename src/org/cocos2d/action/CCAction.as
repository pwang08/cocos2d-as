/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import flash.utils.getQualifiedClassName;

import org.cocos2d.CCNode;

import starling.animation.IAnimatable;

import starling.errors.AbstractClassError;

public class CCAction implements IAnimatable
{
    private var _target:CCNode;

    public function CCAction()
    {
        if (getQualifiedClassName(this) == "org.cocos2d.action::CCAction")
        {
            throw new AbstractClassError();
        }
        _target = null;
    }

    public function startWithTarget(a_target:CCNode):void
    {
        _target = a_target;
    }

    public function advanceTime(time:Number):void
    {
    }

    public function update(durationRatio:Number):void
    {
    }

    public function get isDone():Boolean
    {
        return true;
    }

    public function get target():CCNode
    {
        return _target;
    }
}
}
