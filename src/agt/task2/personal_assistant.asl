// personal assistant agent 

/* Task 2 Start of your solution */
// Interference Rules
owner_awake :- owner_state("awake").
owner_asleep :- owner_state("asleep").

best_option(Option) 
    :- 
        wake_up_ranking(Option, Rank)
        & not lower_ranking_exists(Rank)
        & not used_method(Option)
    .

lower_ranking_exists(Rank) 
    :-
        wake_up_ranking(_, LowerRank)
        & LowerRank < Rank
        & not used_method(_)
    .
    
// Beliefs
wake_up_ranking(vibrations, 0).
wake_up_ranking(natural_light, 1).
wake_up_ranking(artificial_light, 2).

// Plans
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

@handle_upcoming_event_awake_plan
+upcoming_event("now")
    : owner_awake
    <-
        .print("Enjoy your event");
    .

@handle_upcoming_event_asleep_plan
+upcoming_event("now")
    : owner_asleep
    <-
        .print("Starting wake-up routine");
    !wake_up_user;
    .

@wake_up_user_plan_best_option_vibrations
+!wake_up_user
    : owner_asleep & best_option(vibrations)
    <-
        .print("Attempting to wake up the user with vibrations…");
        setVibrationsMode;
        +used_method(vibrations);
        .wait(3000);
        !wake_up_user;
    .

@wake_up_user_plan_best_option_natural_light
+!wake_up_user
    : owner_asleep & best_option(natural_light)
    <-
        .print("Attempting to wake up the user with raised blinds…");
        raiseBlinds;
        +used_method(natural_light);
        .wait(3000);
        !wake_up_user;
    .

@wake_up_user_plan_best_option_artificial_light
+!wake_up_user
    : owner_asleep & best_option(artificial_light)
    <-
        .print("Attempting to wake up the user with artificaial light…");
        turnOnLights;
        +used_method(artificial_light);
        .wait(3000);
        !wake_up_user;
    .

@wake_up_success_plan
+!wake_up_user
    : owner_awake
    <-
        .print("The design objective has been achieved: The user is now awake.");
        -used_method(vibrations); 
        -used_method(natural_light);
        -used_method(artificial_light);
        setIdleMode;
    .
/* Task 2 End of your solution */

/* Import behavior of agents that work in CArtAgO environments */
{ include("$jacamoJar/templates/common-cartago.asl") }