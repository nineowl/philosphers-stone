if (!variable_global_exists("stone_charge")) exit;

draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Header
draw_set_color(c_white);
draw_text(30, 20, "Alchemy Shop Prototype");
draw_text(30, 50, "Stone Charge: " + string(global.stone_charge) + "/" + string(global.stone_max_charge));
draw_text(30, 80, "Selected Action: " + action_name(global.selected_action));
draw_text(30, 110, "Message: " + global.last_message);

// Action buttons
for (var i = 0; i <= AlchemyAction.Rewind; i++) {
    var btn_x = ui_action_x + i * (ui_action_w + ui_action_gap);
    var btn_y = ui_action_y;

    if (global.selected_action == i) {
        draw_set_color(c_lime);
        draw_rectangle(btn_x, btn_y, btn_x + ui_action_w, btn_y + ui_action_h, false);
        draw_set_color(c_black);
        draw_text(btn_x + 10, btn_y + 12, action_name(i));
    } else {
        draw_set_color(make_color_rgb(60, 60, 60));
        draw_rectangle(btn_x, btn_y, btn_x + ui_action_w, btn_y + ui_action_h, false);
        draw_set_color(c_white);
        draw_text(btn_x + 10, btn_y + 12, action_name(i));
    }
}

// Perform button
draw_set_color(make_color_rgb(80, 80, 80));
draw_rectangle(ui_perform_x1, ui_perform_y1, ui_perform_x2, ui_perform_y2, false);
draw_set_color(c_white);
draw_text(ui_perform_x1 + 40, ui_perform_y1 + 13, "PERFORM");

// Inventory
draw_set_color(c_white);
draw_text(ui_inventory_x, 290, "Inventory");

var visible_materials = inventory_get_visible_materials(global.inventory_scroll, ui_inventory_rows);

for (var i = 0; i < array_length(visible_materials); i++) {
    var mat = visible_materials[i];
    var item_y = ui_inventory_y + i * (ui_inventory_h + 4);

    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(ui_inventory_x, item_y, ui_inventory_x + ui_inventory_w, item_y + ui_inventory_h, false);

    draw_set_color(c_white);
    draw_text(ui_inventory_x + 8, item_y + 6, global.material_data[mat].name + " x" + string(global.inventory[mat]));
}

// Scroll buttons
draw_set_color(make_color_rgb(80, 80, 80));
draw_rectangle(ui_inventory_scroll_x1, ui_inventory_scroll_up_y1, ui_inventory_scroll_x2, ui_inventory_scroll_up_y2, false);
draw_rectangle(ui_inventory_scroll_x1, ui_inventory_scroll_down_y1, ui_inventory_scroll_x2, ui_inventory_scroll_down_y2, false);

draw_set_color(c_white);
draw_text(ui_inventory_scroll_x1 + 12, ui_inventory_scroll_up_y1 + 6, "^");
draw_text(ui_inventory_scroll_x1 + 12, ui_inventory_scroll_down_y1 + 6, "v");

draw_text(ui_inventory_x, ui_inventory_y + ui_inventory_rows * (ui_inventory_h + 4) + 8, "Mouse wheel to scroll");

// Selected materials
draw_set_color(c_white);
draw_text(ui_selected_x, 290, "Selected Materials");

for (var s = 0; s < ui_selected_slots; s++) {
    var sx = ui_selected_x + s * (ui_selected_w + ui_selected_gap);
    var sy = ui_selected_y;

    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(sx, sy, sx + ui_selected_w, sy + ui_selected_h, false);

    draw_set_color(c_white);

    if (s < array_length(global.selected_materials)) {
        var selected_mat = global.selected_materials[s];
        draw_text(sx + 8, sy + 12, global.material_data[selected_mat].name);
    } else {
        draw_text(sx + 8, sy + 12, "[empty]");
    }
}

draw_text(ui_selected_x, ui_selected_y + 60, "Right click = remove last selected");

// Failures
draw_text(ui_failure_x1, 290, "Failures");

for (var f = 0; f < array_length(global.failure_items); f++) {
    var failure_y = ui_failure_y + f * ui_failure_gap;

    if (global.selected_failure_index == f) {
        draw_set_color(c_red);
    } else {
        draw_set_color(make_color_rgb(50, 50, 50));
    }

    draw_rectangle(ui_failure_x1, failure_y, ui_failure_x2, failure_y + ui_failure_h, false);

    var failure_text = "Failure " + string(f) + ": ";
    for (var j = 0; j < array_length(global.failure_items[f].materials); j++) {
        failure_text += global.material_data[global.failure_items[f].materials[j]].name;
        if (j < array_length(global.failure_items[f].materials) - 1) {
            failure_text += ", ";
        }
    }

    draw_set_color(c_white);
    draw_text(ui_failure_x1 + 10, failure_y + 8, failure_text);
    draw_text(ui_failure_x1 + 10, failure_y + 26, "Click to select for rewind");
}

// Quest display
draw_set_color(c_white);
draw_text(ui_quest_label_x, ui_quest_label_y, "Active Quest");

if (array_length(global.active_quests) > 0) {
    var quest = global.active_quests[0];
    var can_turn_in = inventory_has(quest.request_material, quest.request_amount);

    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(ui_quest_x1, ui_quest_y1, ui_quest_x2, ui_quest_y2, false);

    draw_set_color(c_white);
    draw_text(ui_quest_x1 + 15, ui_quest_y1 + 15, quest.title);
    draw_text(ui_quest_x1 + 15, ui_quest_y1 + 45, "Need: " + global.material_data[quest.request_material].name + " x" + string(quest.request_amount));
    draw_text(ui_quest_x1 + 15, ui_quest_y1 + 75, "Accepted: " + string(quest.accepted));
    draw_text(ui_quest_x1 + 15, ui_quest_y1 + 95, "Completed: " + string(quest.completed));
    draw_text(ui_quest_x1 + 15, ui_quest_y1 + 115, "Ready to turn in: " + string(can_turn_in));

    draw_set_color(make_color_rgb(80, 80, 80));
    draw_rectangle(ui_turnin_x1, ui_turnin_y1, ui_turnin_x2, ui_turnin_y2, false);

    draw_set_color(c_white);
    draw_text(ui_turnin_x1 + 25, ui_turnin_y1 + 13, "TURN IN QUEST");
}