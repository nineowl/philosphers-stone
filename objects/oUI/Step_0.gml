var mx = mouse_x;
var my = mouse_y;

// dialogue typewriter reset when line changes
if (global.npc_line != ui_last_dialog_line) {
    ui_last_dialog_line = global.npc_line;
    ui_dialog_char_index = 0;
    ui_dialog_char_timer = 0;
}

// typewriter progress
if (global.dialog_visible && array_length(global.active_quests) > 0) {
    var dq = global.active_quests[0];

    if (dq.stage == "offer" || dq.stage == "completed") {
        ui_dialog_char_timer += ui_dialog_char_speed;

        if (ui_dialog_char_timer >= 1) {
            ui_dialog_char_timer = 0;

            if (ui_dialog_char_index < string_length(global.npc_line)) {
                ui_dialog_char_index += 1;
            }
        }
    }
}

// reset hover every step
global.hovered_material = -1;
global.hovered_recipe = -1;
global.hovered_failure = -1;

// keep oBook synced to alchemy symbol frame
if (instance_exists(oBook)) {
    with (oBook) {
        image_index = global.selected_action;
    }
}

// -------------------------
// KEYBOARD PAGE SWITCHING
// -------------------------
if (keyboard_check_pressed(ord("Q"))) {
    book_tab = 0;
    ui_page_scroll = 0;
    global.last_message = "Opened Quests page.";

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

if (keyboard_check_pressed(ord("R"))) {
    book_tab = 1;
    ui_page_scroll = 0;
    global.last_message = "Opened Recipes page.";

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

if (keyboard_check_pressed(ord("M"))) {
    book_tab = 2;
    ui_page_scroll = 0;
    global.last_message = "Opened Materials page.";

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

// -------------------------
// KEYBOARD ACTION SWITCHING
// -------------------------
if (keyboard_check_pressed(ord("1"))) {
    global.selected_action = AlchemyAction.Separate;
    global.last_message = "Selected action: " + action_name(global.selected_action);

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

if (keyboard_check_pressed(ord("2"))) {
    global.selected_action = AlchemyAction.Combine;
    global.last_message = "Selected action: " + action_name(global.selected_action);

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

if (keyboard_check_pressed(ord("3"))) {
    global.selected_action = AlchemyAction.Heat;
    global.last_message = "Selected action: " + action_name(global.selected_action);

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

if (keyboard_check_pressed(ord("4"))) {
    global.selected_action = AlchemyAction.Cold;
    global.last_message = "Selected action: " + action_name(global.selected_action);

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

if (keyboard_check_pressed(ord("5"))) {
    global.selected_action = AlchemyAction.Rewind;
    global.last_message = "Selected action: " + action_name(global.selected_action);

    if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
        instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
    }
}

// -------------------------
// PAGE SCROLL CLAMP
// -------------------------
var max_scroll = 0;

switch (book_tab) {
    case 0:
        max_scroll = 0;
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

// -------------------------
// RIGHT CLICK REMOVE LAST
// -------------------------
if (mouse_check_button_pressed(mb_right)) {
    if (array_length(global.selected_materials) > 0) {
        array_delete(global.selected_materials, array_length(global.selected_materials) - 1, 1);
        global.last_message = "Removed last selected material.";
    } else {
        global.last_message = "No selected materials to remove.";
    }
}

// -------------------------
// MATERIALS / FAILURES PAGE
// -------------------------
if (book_tab == 2) {
    if (ui_materials_mode == 0) {
        var visible_materials = inventory_get_visible_materials(ui_page_scroll, ui_page_rows_visible);

        for (var i = 0; i < array_length(visible_materials); i++) {
            var mat = visible_materials[i];
            var row_y = ui_page_content_y + i * ui_page_list_row_h;
            var row_x1 = ui_page_content_x;
            var row_y1 = row_y;
            var row_x2 = ui_page_content_x + ui_page_content_w;
            var row_y2 = row_y + ui_page_list_row_h - 2;

            if (point_in_rectangle(mx, my, row_x1, row_y1, row_x2, row_y2)) {
                global.hovered_material = mat;

                if (mouse_check_button_pressed(mb_left)) {
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
    } else {
		for (var f = 0; f < array_length(global.failure_items); f++) {
		    var fy = ui_page_content_y + f * 18;

		    if (point_in_rectangle(mx, my, ui_page_content_x, fy, ui_page_content_x + 90, fy + 12)) {
		        global.hovered_failure = f;

		        if (mouse_check_button_pressed(mb_left)) {
		            global.selected_failure_index = f;
		            global.last_message = "Selected failure.";
		        }
		    }
		}
    }
}
// -------------------------
// HOVER RECIPE PAGE
// -------------------------
if (book_tab == 1) {
    var recipe_draw_index = 0;

    for (var i = 0; i < array_length(global.recipes); i++) {
        var recipe = global.recipes[i];
        if (!recipe.discovered) continue;

        if (recipe_draw_index < ui_page_scroll) {
            recipe_draw_index++;
            continue;
        }

        var row_y = ui_page_content_y + (recipe_draw_index - ui_page_scroll) * ui_page_list_row_h;
        if (row_y > ui_page_content_y + ui_page_content_h) break;

        var row_x1 = ui_page_content_x;
        var row_y1 = row_y;
        var row_x2 = ui_page_content_x + ui_page_content_w;
        var row_y2 = row_y + ui_page_list_row_h - 2;

        if (point_in_rectangle(mx, my, row_x1, row_y1, row_x2, row_y2)) {
            global.hovered_recipe = i;
        }

        recipe_draw_index++;
    }
}

// -------------------------
// LEFT CLICK HANDLING
// -------------------------
if (mouse_check_button_pressed(mb_left)) {
	
	// faerie confirm popup buttons
	if (ui_faerie_confirm) {
	    if (point_in_rectangle(mx, my, ui_faerie_yes_x1, ui_faerie_yes_y1, ui_faerie_yes_x2, ui_faerie_yes_y2)) {
	        ui_faerie_confirm = false;

	        if (!ui_faerie_popup_active && global.inventory[Material.FaerieJar] > 0) {
	            inventory_remove(Material.FaerieJar, 1);
	            ui_faerie_popup_active = true;
	            ui_faerie_popup_frame = 0;
	        }
	        exit;
	    }

	    if (point_in_rectangle(mx, my, ui_faerie_no_x1, ui_faerie_no_y1, ui_faerie_no_x2, ui_faerie_no_y2)) {
	        ui_faerie_confirm = false;
	        exit;
	    }
	}

    // click dialogue box: reveal text or move to next quest
    if (global.dialog_visible && array_length(global.active_quests) > 0) {
        var dq = global.active_quests[0];

        if (dq.stage == "offer" || dq.stage == "completed") {
            if (point_in_rectangle(mx, my, ui_dialog_x1, ui_dialog_y1, ui_dialog_x2, ui_dialog_y2)) {
                if (ui_dialog_char_index < string_length(global.npc_line)) {
                    ui_dialog_char_index = string_length(global.npc_line);
                    exit;
                }

                if (dq.stage == "completed" && global.pending_next_quest) {
                    advance_to_next_quest();
                    ui_dialog_char_index = 0;
                    ui_dialog_char_timer = 0;
                    ui_last_dialog_line = "";
                    exit;
                }
            }
        }
    }
	// materials/failures sub-mode toggle
	if (book_tab == 2) {
	    if (point_in_rectangle(mx, my,
	        ui_submode_arrow_left_x, ui_submode_arrow_left_y,
	        ui_submode_arrow_left_x + ui_submode_arrow_w, ui_submode_arrow_left_y + ui_submode_arrow_h)) {

	        ui_materials_mode = max(0, ui_materials_mode - 1);
	        exit;
	    }

	    if (point_in_rectangle(mx, my,
	        ui_submode_arrow_right_x, ui_submode_arrow_right_y,
	        ui_submode_arrow_right_x + ui_submode_arrow_w, ui_submode_arrow_right_y + ui_submode_arrow_h)) {

	        ui_materials_mode = min(1, ui_materials_mode + 1);
	        exit;
	    }
	}
    // action arrows
    if (point_in_rectangle(mx, my,
        ui_action_arrow_left_x, ui_action_arrow_left_y,
        ui_action_arrow_left_x + ui_action_arrow_w, ui_action_arrow_left_y + ui_action_arrow_h)) {

        global.selected_action -= 1;
        if (global.selected_action < 0) global.selected_action = AlchemyAction.Rewind;
        global.last_message = "Selected action: " + action_name(global.selected_action);

        if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
            instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
        }
        exit;
    }

    if (point_in_rectangle(mx, my,
        ui_action_arrow_right_x, ui_action_arrow_right_y,
        ui_action_arrow_right_x + ui_action_arrow_w, ui_action_arrow_right_y + ui_action_arrow_h)) {

        global.selected_action += 1;
        if (global.selected_action > AlchemyAction.Rewind) global.selected_action = 0;
        global.last_message = "Selected action: " + action_name(global.selected_action);

        if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
            instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
        }
        exit;
    }

    // Q / R / M clicks
    if (point_in_rectangle(mx, my, ui_tab_q_x, ui_tab_q_y, ui_tab_q_x + ui_tab_w, ui_tab_q_y + ui_tab_h)) {
        book_tab = 0;
        ui_page_scroll = 0;
        global.last_message = "Opened Quests page.";

        if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
            instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
        }
        exit;
    }

    if (point_in_rectangle(mx, my, ui_tab_r_x, ui_tab_r_y, ui_tab_r_x + ui_tab_w, ui_tab_r_y + ui_tab_h)) {
        book_tab = 1;
        ui_page_scroll = 0;
        global.last_message = "Opened Recipes page.";

        if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
            instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
        }
        exit;
    }

    if (point_in_rectangle(mx, my, ui_tab_m_x, ui_tab_m_y, ui_tab_m_x + ui_tab_w, ui_tab_m_y + ui_tab_h)) {
        book_tab = 2;
        ui_page_scroll = 0;
        global.last_message = "Opened Materials page.";

        if (!instance_exists(oPageTurn) && instance_exists(oBook)) {
            instance_create_depth(oBook.x, oBook.y, -10, oPageTurn);
        }
        exit;
    }

    // perform alchemy by clicking right page
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

    // accepting and ending quests
    if (book_tab == 0 && array_length(global.active_quests) > 0) {
        var q = global.active_quests[0];

        if (q.stage == "offer") {
            if (point_in_rectangle(mx, my, ui_accept_x1, ui_accept_y1, ui_accept_x2, ui_accept_y2)) {
                q.stage = "accepted";
                global.active_quests[0] = q;

                global.npc_line = "Please bring me the item when it is ready.";
                global.dialog_visible = false;

                for (var i = 0; i < array_length(q.provided_materials); i++) {
                    var p = q.provided_materials[i];
                    inventory_add(p.material, p.amount);
                }

                global.last_message = "Quest accepted.";
                exit;
            }
        }

        if (q.stage == "accepted") {
            if (point_in_rectangle(mx, my, ui_turnin_x1, ui_turnin_y1, ui_turnin_x2, ui_turnin_y2)) {
                try_complete_active_quest(0);
                exit;
            }
        }
    }

	//knife kill faerie
	if (instance_exists(oKnifeMarker) && global.inventory[Material.FaerieJar] > 0) {
	    if (collision_point(mx, my, oKnifeMarker, false, true)) {
	        ui_faerie_confirm = true;
	        exit;
	    }
	}

    // recharge
    if (point_in_rectangle(mx, my, ui_recharge_x1, ui_recharge_y1, ui_recharge_x2, ui_recharge_y2)) {
        recharge_stone_with_heart();
        exit;
    }
}

// faerie animation
ui_faerie_frame += ui_faerie_speed;
if (ui_faerie_frame >= sprite_get_number(sFaerie)) {
    ui_faerie_frame = 0;
}



if (ui_faerie_popup_active) {
    ui_faerie_popup_frame += ui_faerie_popup_speed;

    if (ui_faerie_popup_frame >= sprite_get_number(sFaerieKill)) {
        ui_faerie_popup_active = false;
        ui_faerie_popup_frame = 0;

        inventory_add(Material.Heart, 1);
    }
}