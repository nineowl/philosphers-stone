if (!variable_global_exists("stone_charge")) exit;

// background first
//draw_sprite(bg_main, global.selected_action, 0, 0);//no longer used

// philosopher stone
draw_sprite_ext(
    sMaterials,
    57,
    ui_stone_x,
    ui_stone_y,
    ui_stone_scale,
    ui_stone_scale,
    0,
    c_white,
    1
);


//alchemy page handling:


draw_set_halign(fa_left);
draw_set_valign(fa_top);

// small HUD
draw_set_font(global.font_small);
draw_set_color(c_white);
draw_text(12, 12, "Charge: " + string(global.stone_charge));

// page title
draw_set_font(global.font_book);
draw_set_color(c_black);
draw_text(ui_page_content_x, ui_page_content_y - 14, book_tab_name(book_tab));
if (array_length(global.active_quests) > 1) {
    draw_set_font(global.font_small);
    draw_set_color(c_black);
    draw_text(ui_quest_arrow_left_x, ui_quest_arrow_left_y, "<");
    draw_text(ui_quest_arrow_right_x, ui_quest_arrow_right_y, ">");
}


// page content inline, no external script dependency
switch (book_tab) {
    case 0:
        draw_set_font(global.font_book);
        draw_set_color(c_black);

        if (array_length(global.active_quests) > 0) {
            var quest = global.active_quests[global.current_quest_index];
            var can_turn_in = inventory_has(quest.request_material, quest.request_amount);

            draw_text(ui_page_content_x, ui_page_content_y, quest.title);
            draw_text(ui_page_content_x, ui_page_content_y + 18, "Need: " + global.material_data[quest.request_material].name + " x" + string(quest.request_amount));
            draw_text(ui_page_content_x, ui_page_content_y + 36, "Ready: " + string(can_turn_in));

            draw_set_font(global.font_small);
            draw_text_ext(
                ui_page_content_x,
                ui_page_content_y + 56,
                quest.desc,
                12,
                ui_page_content_w
            );

        } else {
            draw_text(ui_page_content_x, ui_page_content_y, "No active quests.");
        }
		if (array_length(global.active_quests) > 0) {
		    var quest = global.active_quests[global.current_quest_index];

		    draw_set_font(global.font_small);
		    draw_set_color(c_black);

		    if (quest.stage == "offer") {
		        draw_rectangle(ui_accept_x1, ui_accept_y1, ui_accept_x2, ui_accept_y2, true);
		        draw_text(ui_accept_x1 + 8, ui_accept_y1 + 6, "ACCEPT");
		    }

		    if (quest.stage == "accepted") {
		        draw_rectangle(ui_turnin_x1, ui_turnin_y1, ui_turnin_x2, ui_turnin_y2, true);
		        draw_text(ui_turnin_x1 + 2, ui_turnin_y1 + 2, "TURN IN");
		    }
		}


		if (array_length(global.failure_items) > 0) {
		    draw_set_font(global.font_small);
		    draw_set_color(c_black);
		    draw_text(ui_page_content_x, ui_page_content_y + 150, "Failures:");

		    for (var f = 0; f < array_length(global.failure_items); f++) {
		        draw_text(ui_page_content_x, ui_page_content_y + 164 + f * 14, "Failure " + string(f));
		    }
		}


    break;

	case 1:
	    draw_set_font(global.font_book);
	    draw_set_color(c_black);

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

	        var out_mat = recipe.outputs[0].material;

	        // highlight hovered recipe
	        if (global.hovered_recipe == i) {
	            draw_rectangle(ui_page_content_x, row_y, ui_page_content_x + ui_page_content_w, row_y + ui_page_list_row_h - 2, true);
	            draw_set_color(c_white);
	            draw_text(ui_page_content_x + 2, row_y + 2, global.material_data[out_mat].name);
	            draw_set_color(c_black);
	        } else {
	            draw_text(ui_page_content_x, row_y, global.material_data[out_mat].name);
	        }

	        recipe_draw_index++;
	    }

	    // detailed recipe info
	    if (global.hovered_recipe != -1) {
	        var r = global.recipes[global.hovered_recipe];
	        var detail_y = ui_page_content_y + 100;

	        draw_set_font(global.font_small);
	        draw_set_color(c_black);

	        draw_text(ui_page_content_x, detail_y, "Action: " + action_name(r.action));
	        draw_text(ui_page_content_x, detail_y + 14, "Ingredients:");

	        for (var k = 0; k < array_length(r.inputs); k++) {
	            draw_text(
	                ui_page_content_x + 8,
	                detail_y + 28 + k * 12,
	                "- " + global.material_data[r.inputs[k]].name
	            );
	        }
	    }
	break;


    case 2:
        draw_set_font(global.font_book);
        draw_set_color(c_black);

        var visible_materials = inventory_get_visible_materials(ui_page_scroll, ui_page_rows_visible);

        for (var j = 0; j < array_length(visible_materials); j++) {
            var mat = visible_materials[j];
            var row_y2 = ui_page_content_y + j * ui_page_list_row_h;
            var mat_data = global.material_data[mat];

            if (!is_undefined(mat_data.spr)) {
                draw_sprite_ext(mat_data.spr, mat_data.frame, ui_page_content_x + 8, row_y2 + 10, 0.5, 0.5, 0, c_white, 1);
            }

            draw_text(ui_page_content_x + 22, row_y2 + 2, mat_data.name + " x" + string(global.inventory[mat]));
        }
    break;
}

// selected materials in middle
for (var s = 0; s < array_length(global.selected_materials); s++) {
    var sel_mat = global.selected_materials[s];
    var sel_data = global.material_data[sel_mat];

    var draw_x = ui_alchemy_center_x;
    var draw_y = ui_alchemy_center_y;

    switch (s) {
        case 0:
            draw_y = ui_alchemy_center_y - ui_alchemy_slot_gap;
        break;

        case 1:
            draw_x = ui_alchemy_center_x - ui_alchemy_slot_gap;
            draw_y = ui_alchemy_center_y + 4;
        break;

        case 2:
            draw_x = ui_alchemy_center_x + ui_alchemy_slot_gap;
            draw_y = ui_alchemy_center_y + 4;
        break;

        case 3:
            draw_y = ui_alchemy_center_y + ui_alchemy_slot_gap;
        break;
    }

    if (!is_undefined(sel_data.spr)) {
        draw_sprite(sel_data.spr, sel_data.frame, draw_x, draw_y);
    } else {
        draw_set_font(global.font_small);
        draw_set_color(c_black);
        draw_text(draw_x - 12, draw_y - 6, sel_data.name);
    }
}

// action arrows + label
draw_sprite_ext(
    ui_arrow_sprite,
    0,
    ui_action_arrow_left_x,
    ui_action_arrow_left_y,
    ui_arrow_scale,
    ui_arrow_scale,
    0,
    c_white,
    1
);

draw_sprite_ext(
    ui_arrow_sprite,
    1,
    ui_action_arrow_right_x,
    ui_action_arrow_right_y,
    ui_arrow_scale,
    ui_arrow_scale,
    0,
    c_white,
    1
);

draw_set_font(global.font_small);
draw_set_color(c_black);
draw_text(ui_action_label_x, ui_action_label_y, action_name(global.selected_action));

// Q/R/M
draw_set_font(global.font_book);

if (book_tab == 0) draw_set_color(c_yellow); else draw_set_color(c_black);
draw_text(ui_tab_q_x, ui_tab_q_y, "Q");

if (book_tab == 1) draw_set_color(c_yellow); else draw_set_color(c_black);
draw_text(ui_tab_r_x, ui_tab_r_y, "R");

if (book_tab == 2) draw_set_color(c_yellow); else draw_set_color(c_black);
draw_text(ui_tab_m_x, ui_tab_m_y, "M");

// faerie jar
if (global.inventory[Material.FaerieJar] > 0) {
    draw_sprite_ext(
        sFaerie,
        floor(ui_faerie_frame),
        ui_faerie_x,
        ui_faerie_y,
        1,
        1,
        0,
        c_white,
        1
    );
}


// hover text
if (global.hovered_material != -1) {
    var hover_data = global.material_data[global.hovered_material];

    draw_set_font(global.font_small);
    draw_set_color(c_black);
    draw_text(ui_hover_name_x, ui_hover_name_y, hover_data.name);
    draw_text_ext(ui_hover_desc_x, ui_hover_desc_y, hover_data.desc, 12, 160);
}

// npc interactions
if (global.dialog_visible && array_length(global.active_quests) > 0) {
    var dq = global.active_quests[global.current_quest_index];

    if (dq.stage == "offer") {
        draw_set_alpha(1);

        // portrait
        if (global.npc_portrait_sprite != noone) {
            draw_sprite_ext(
                global.npc_portrait_sprite,
                dq.portrait_frame,
                ui_portrait_x,
                ui_portrait_y,
                ui_portrait_scale,
                ui_portrait_scale,
                0,
                c_white,
                1
            );
        }

        // solid dialogue box
        draw_set_color(make_color_rgb(205, 170, 125));
        draw_rectangle(ui_dialog_x1, ui_dialog_y1, ui_dialog_x2, ui_dialog_y2, false);

        // typed text
        draw_set_font(global.font_small);
        draw_set_color(c_black);

        var visible_text = string_copy(global.npc_line, 1, floor(ui_dialog_char_index));

        draw_text(ui_dialog_x1 + 8, ui_dialog_y1 + 6, global.npc_name + ":");
        draw_text_ext(
            ui_dialog_x1 + 8,
            ui_dialog_y1 + 20,
            visible_text,
            12,
            (ui_dialog_x2 - ui_dialog_x1) - 16
        );
    }
}


//stone charging button
draw_set_font(global.font_small);
draw_set_color(c_white);
draw_rectangle(ui_recharge_x1, ui_recharge_y1, ui_recharge_x2, ui_recharge_y2, true);
draw_text(ui_recharge_x1 + 4, ui_recharge_y1 + 4, "RECHARGE");

