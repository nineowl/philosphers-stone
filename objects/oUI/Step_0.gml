// Temporary page switching
if (keyboard_check_pressed(ord("Q"))) {
    book_tab = 0;
    ui_page_scroll = 0;
    global.last_message = "Opened Quests page.";
}

if (keyboard_check_pressed(ord("R"))) {
    book_tab = 1;
    ui_page_scroll = 0;
    global.last_message = "Opened Recipes page.";
}

if (keyboard_check_pressed(ord("M"))) {
    book_tab = 2;
    ui_page_scroll = 0;
    global.last_message = "Opened Materials page.";
}


// Clamp page scroll depending on current tab
var max_scroll = 0;

switch (book_tab) {
    case 0:
        max_scroll = max(0, array_length(global.active_quests) - ui_page_rows_visible);
    break;

    case 1:
        max_scroll = max(0, array_length(global.recipes) - ui_page_rows_visible);
    break;

    case 2:
        max_scroll = max(0, inventory_nonzero_count() - ui_page_rows_visible);
    break;
}

if (mouse_wheel_up()) {
    ui_page_scroll = max(0, ui_page_scroll - 1);
}

if (mouse_wheel_down()) {
    ui_page_scroll = min(max_scroll, ui_page_scroll + 1);
}


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

    // Materials page clicks
    if (book_tab == 2) {
        var visible_materials = inventory_get_visible_materials(ui_page_scroll, ui_page_rows_visible);

        for (var i = 0; i < array_length(visible_materials); i++) {
            var mat = visible_materials[i];
            var row_y = ui_page_content_y + i * ui_page_list_row_h;
            var row_x1 = ui_page_content_x;
            var row_y1 = row_y;
            var row_x2 = ui_page_content_x + ui_page_content_w;
            var row_y2 = row_y + ui_page_list_row_h - 2;

            if (point_in_rectangle(mx, my, row_x1, row_y1, row_x2, row_y2)) {
                if (array_length(global.selected_materials) >= 4) {
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
    }

    // Turn in quest
    if (point_in_rectangle(mx, my, ui_turnin_x1, ui_turnin_y1, ui_turnin_x2, ui_turnin_y2)) {
        try_complete_active_quest(0);
        exit;
    }

    // Perform alchemy by clicking anywhere on right page
    if (point_in_rectangle(mx, my, ui_page_right_x1, ui_page_right_y1, ui_page_right_x2, ui_page_right_y2)) {
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

    // Failure selection (temporary)
    if (global.selected_action == AlchemyAction.Rewind) {
        for (var f = 0; f < array_length(global.failure_items); f++) {
            var failure_y = ui_customer_text_y + 80 + f * 18;

            if (point_in_rectangle(mx, my, ui_customer_text_x, failure_y, ui_customer_text_x + 160, failure_y + 16)) {
                global.selected_failure_index = f;
                global.last_message = "Selected failure " + string(f);
                exit;
            }
        }
    }
}