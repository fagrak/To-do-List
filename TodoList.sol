// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo{
        string text;
        bool completed;
        bool onTime;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false,
            onTime: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;
    }

    function get(uint _index) external view returns (string memory, bool, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed, todo.onTime);
    }

    //total to-do count and how many are left 
    function result() external view returns (uint, uint)  {
       uint counter;
       for (uint i=0; i <todos.length; i++) {
            if (todos[i].completed == false) {counter +=1;}     
        }
        return (todos.length, counter);
    }

    function toggleCompleted (uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

    //Is it done in time 
    function didItOnTime (uint _index) external {
        todos[_index].onTime = !todos[_index].onTime;
    }
}