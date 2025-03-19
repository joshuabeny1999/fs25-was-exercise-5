// personal assistant agent 

/* Task 2 Start of your solution */
@blinds_added_plan
+blinds(State)
    :   true
    <-
        .print("The blinds are ", State);
    .
@blinds_removed_plan
-blinds(State)
    :   true
    <-
        .print("The state of the blinds is removed");
    .

@lights_added_plan
+lights(State)
    :   true
    <-
        .print("The lights are turned ", State);
    .
@lights_removed_plan
-lights(State)
    :   true
    <-
        .print("The state of the lights is removed");
    .

@mattress_added_plan
+mattress(State)
    :   true
    <-
        .print("The mattress is ", State);
    .
@mattress_removed_plan
-mattress(State)
    :   true
    <-
        .print("The state of the mattress is removed");
    .

@owner_state_added_plan
+owner_state(State)
    :   true
    <-
        .print("The owner is currently ", State);
    .
@owner_state_removed_plan
-owner_state(State)
    :   true
    <-
        .print("The owner state is removed");
    .

/* Task 2 End of your solution */

/* Import behavior of agents that work in CArtAgO environments */
{ include("$jacamoJar/templates/common-cartago.asl") }