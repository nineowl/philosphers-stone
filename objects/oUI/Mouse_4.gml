global.last_message = "Clicked at " + string(mouse_x) + ", " + string(mouse_y);

var mx = mouse_x;
var my = mouse_y;

// Action buttons
var action_x = 30;
var action_y = 160;
var button_w = 140;
var button_h = 40;
var button_gap = 10;

for (var i = 0; i <= AlchemyAction.Rewind; i++) {
    var btn_x = action_x + i * (button_w + button_gap);
    var btn_y = action_y;

    if (point_in_rectangle(mx, my, btn_x, btn_y, btn_x + button_w, btn_y + button_h)) {
        global.selected_action = i;
        global.last_message = "Selected action.";
        exit;
    }
}

// Perform button
if (point_in_rectangle(mx, my, 30, 220, 180, 260)) {
    if (global.selected_action == AlchemyAction.Rewind) {
        if (global.selected_failure_index >= 0) {
            rewind_failure(global.selected_failure_index);
            global.selected_failure_index = -1;
        } else {
            global.last_message = "Select a failure first.";
        }
    } else {
        try_alchemy(global.selected_action, global.selected_materials);
        global.selected_materials = [];
    }
    exit;
}

// Inventory clicks
var inv_x = 30;
var inv_y = 320;
var inv_w = 180;
var inv_h = 28;
var inv_row = 0;

for (var m = 0; m < array_length(global.inventory); m++) {
    if (global.inventory[m] > 0) {
        var item_y = inv_y + inv_row * (inv_h + 4);

        if (point_in_rectangle(mx, my, inv_x, item_y, inv_x + inv_w, item_y + inv_h)) {
            array_push(global.selected_materials, m);
            global.last_message = "Added " + global.material_data[m].name;
            exit;
        }

        inv_row++;
    }
}

// Failure clicks
for (var f = 0; f < array_length(global.failure_items); f++) {
    var failure_y = 320 + f * 60;

    if (point_in_rectangle(mx, my, 520, failure_y, 800, failure_y + 50)) {
        global.selected_failure_index = f;
        global.last_message = "Selected failure " + string(f);
        exit;
    }
}

// Quest turn-in button
if (point_in_rectangle(mx, my, 875, 450, 1035, 490)) {
    try_complete_active_quest(0);
    exit;
}