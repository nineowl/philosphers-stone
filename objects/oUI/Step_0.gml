if (mouse_wheel_up()) {
    global.inventory_scroll = max(0, global.inventory_scroll - 1);
}

if (mouse_wheel_down()) {
    global.inventory_scroll += 1;
}

var max_scroll = max(0, inventory_nonzero_count() - ui_inventory_rows);
global.inventory_scroll = clamp(global.inventory_scroll, 0, max_scroll);


// Right click = remove last selected material
if (mouse_check_button_pressed(mb_right)) {
    if (array_length(global.selected_materials) > 0) {
        array_delete(global.selected_materials, array_length(global.selected_materials) - 1, 1);
        global.last_message = "Removed last selected material.";
    } else {
        global.last_message = "No selected materials to remove.";
    }
}


// Left click handling
if (mouse_check_button_pressed(mb_left)) {
    var mx = mouse_x;
    var my = mouse_y;

    // Inventory scroll buttons
    if (point_in_rectangle(mx, my, ui_inventory_scroll_x1, ui_inventory_scroll_up_y1, ui_inventory_scroll_x2, ui_inventory_scroll_up_y2)) {
        global.inventory_scroll = max(0, global.inventory_scroll - 1);
        global.last_message = "Scrolled inventory up.";
        exit;
    }

    if (point_in_rectangle(mx, my, ui_inventory_scroll_x1, ui_inventory_scroll_down_y1, ui_inventory_scroll_x2, ui_inventory_scroll_down_y2)) {
        global.inventory_scroll = min(max_scroll, global.inventory_scroll + 1);
        global.last_message = "Scrolled inventory down.";
        exit;
    }

    // Action buttons
    for (var i = 0; i <= AlchemyAction.Rewind; i++) {
        var btn_x = ui_action_x + i * (ui_action_w + ui_action_gap);
        var btn_y = ui_action_y;

        if (point_in_rectangle(mx, my, btn_x, btn_y, btn_x + ui_action_w, btn_y + ui_action_h)) {
            global.selected_action = i;
            global.last_message = "Selected action: " + action_name(i);
            exit;
        }
    }

    // Perform button
    if (point_in_rectangle(mx, my, ui_perform_x1, ui_perform_y1, ui_perform_x2, ui_perform_y2)) {
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
    var visible_materials = inventory_get_visible_materials(global.inventory_scroll, ui_inventory_rows);

    for (var i = 0; i < array_length(visible_materials); i++) {
        var mat = visible_materials[i];
        var item_y = ui_inventory_y + i * (ui_inventory_h + 4);

        if (point_in_rectangle(mx, my, ui_inventory_x, item_y, ui_inventory_x + ui_inventory_w, item_y + ui_inventory_h)) {
            if (array_length(global.selected_materials) >= ui_selected_slots) {
                global.last_message = "All ingredient slots are full.";
                exit;
            }

            var already_selected = selected_count_of(mat);
            var owned_amount = global.inventory[mat];

            if (already_selected >= owned_amount) {
                global.last_message = "You do not own enough " + global.material_data[mat].name + ".";
                exit;
            }

            array_push(global.selected_materials, mat);
            global.last_message = "Added " + global.material_data[mat].name;
            exit;
        }
    }

    // Failure clicks
    for (var f = 0; f < array_length(global.failure_items); f++) {
        var failure_y = ui_failure_y + f * ui_failure_gap;

        if (point_in_rectangle(mx, my, ui_failure_x1, failure_y, ui_failure_x2, failure_y + ui_failure_h)) {
            global.selected_failure_index = f;
            global.last_message = "Selected failure " + string(f);
            exit;
        }
    }

    // Quest turn-in
    if (point_in_rectangle(mx, my, ui_turnin_x1, ui_turnin_y1, ui_turnin_x2, ui_turnin_y2)) {
        try_complete_active_quest(0);
        exit;
    }
}