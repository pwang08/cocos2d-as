/**
 * Created by alanmars on 14-8-29.
 */
package org.cocos2d.action
{
import flash.utils.Dictionary;

import org.cocos2d.CCNode;

import starling.animation.IAnimatable;

import starling.core.Starling;
import starling.events.Event;

public class CCActionManager implements IAnimatable
{
    private static var _instance:CCActionManager = null;

    private var _targetActionsMap:Dictionary;    //CCNode => Vector.<CCAction>

    public static function get instance():CCActionManager
    {
        if (_instance == null)
        {
            _instance = new CCActionManager();
            Starling.juggler.add(_instance);
        }
        return _instance;
    }

    public function CCActionManager()
    {
        if (_instance != null)
        {
            throw new Error("Singleton, use CCActionManager.instance instead!");
        }
        _targetActionsMap = new Dictionary();
    }

    public function advanceTime(time:Number):void
    {
        for (var obj:Object in _targetActionsMap)
        {
            var target:CCNode = obj as CCNode;
            if (target == null || !target.isRunning)
            {
                continue;
            }
            var actions:Vector.<CCAction> = _targetActionsMap[target];
            if (actions != null && actions.length > 0)
            {
                for (var i:uint = 0; i < actions.length; ++ i)
                {
                    actions[i].advanceTime(time);
                }
                //remove all completed actions
                var index:uint = 0;
                for (i = 0; i < actions.length; ++ i)
                {
                    if (!actions[i].isDone)
                    {
                        if (index != i)
                        {
                            actions[index] = actions[i];
                        }
                        ++ index;
                    }
                }
                //now, index is the length of actions
                if (index == 0)
                {
                    delete _targetActionsMap[target];
                }
                else
                {
                    actions.length = index;
                }
            }
        }
    }

    public function addAction(a_action:CCAction, a_target:CCNode):void
    {
        a_action.startWithTarget(a_target);
        var actions:Vector.<CCAction> = _targetActionsMap[a_target];
        if (actions == null)
        {
            actions = new Vector.<CCAction>();
            _targetActionsMap[a_target] = actions;
            a_target.addEventListener(Event.REMOVE_FROM_JUGGLER, onNodeRemoved);
        }
        actions.push(a_action);
    }

    public function removeAllActions():void
    {
        _targetActionsMap = new Dictionary();
    }

    public function removeAllActionsFromTarget(a_target:CCNode):void
    {
        if (_targetActionsMap[a_target] != null)
        {
            delete _targetActionsMap[a_target];
        }
    }

    public function removeAction(a_action:CCAction):void
    {
        if (a_action.target != null && _targetActionsMap[a_action.target] != null)
        {
            var removedIndex:int = -1;
            var actions:Vector.<CCAction> = _targetActionsMap[a_action.target];
            for (var i:int = 0; i < actions.length; ++ i)
            {
                if (actions[i] == a_action)
                {
                    removedIndex = i;
                    break;
                }
            }
            if (removedIndex != -1)
            {
                var lastAction:CCAction = actions.pop();
                if (lastAction != a_action)
                {
                    actions[removedIndex] = lastAction;
                }
                //if a_action is the last one
                if (actions.length == 0)
                {
                    delete _targetActionsMap[a_action.target];
                }
            }
        }
    }

    private function onNodeRemoved(event:Event):void
    {
        var node:CCNode = event.target as CCNode;
        if (node != null)
        {
            removeAllActionsFromTarget(node);
        }
    }
}
}
