//go through the list of opps, see which ones have a closed won stage, add a task them

trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> taskList = new List<Task>();
    for(Opportunity o: Trigger.New) {
        if(o.StageName == 'Closed Won') {
            //create new associated task
            Task newTask = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = o.Id //associates task with opp
            );
            //save task to a list for inserting later
            taskList.add(newTask);
        }
    }
    if(taskList.size() > 0) {
        insert taskList;
    }
}