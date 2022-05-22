// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

import "remix_tests.sol"; 
import "remix_accounts.sol";
import "../contracts/4_Todo.sol";

contract testSuite {

    Todo todo;
    function beforeAll() public{
        todo = new Todo();
    }

    function initialValueOfTask() public returns(bool) {
        return Assert.equal(uint(0), todo.getTaskCount(), "Initial Tasks not 0");
    }

    function addNewTask() public returns(bool){
        todo.addTask("Read Books");
        return Assert.equal(todo.getTask(uint(0)).task,"Rea Books", "first task not same as in list");        
    }

    function CheckCountAfterOneTask() public returns (bool) {
        return Assert.equal(uint(1), todo.getTaskCount(), "Initial Tasks not 0");
    }
    
    function CheckStatusUpdated() public returns (bool) {
        todo.updateStatus(uint(0),false);
        return Assert.equal(todo.getTask(uint(0)).isDone,true, "status of task is not updated to false");        
    }

    function deleteTask() public returns (bool) {
        todo.deleteTask(0);
        return Assert.equal(uint(0),todo.getTaskCount(), "task not deleted");        
    }
}
    