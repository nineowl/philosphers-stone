function draw_quests_page() {
    draw_set_font(global.font_book);
    draw_set_color(c_black);

    if (array_length(global.active_quests) > 0) {
        var quest = global.active_quests[0];
        var can_turn_in = inventory_has(quest.request_material, quest.request_amount);

        draw_text(ui_page_content_x, ui_page_content_y, quest.title);
        draw_text(ui_page_content_x, ui_page_content_y + 18, "Need: " + global.material_data[quest.request_material].name + " x" + string(quest.request_amount));
        draw_text(ui_page_content_x, ui_page_content_y + 36, "Ready: " + string(can_turn_in));

        // wrapped description
        draw_set_font(global.font_small);
        draw_text_ext(
            ui_page_content_x,
            ui_page_content_y + 58,
            quest.desc,
            14,
            ui_page_content_w
        );

        // turn-in button
        draw_set_font(global.font_small);
        draw_rectangle(ui_turnin_x1, ui_turnin_y1, ui_turnin_x2, ui_turnin_y2, true);
        draw_text(ui_turnin_x1 + 6, ui_turnin_y1 + 6, "TURN IN");
    } else {
        draw_text(ui_page_content_x, ui_page_content_y, "No active quests.");
    }
}


function draw_materials_page() {
    draw_set_font(global.font_book);
    draw_set_color(c_black);

    var visible_materials = inventory_get_visible_materials(ui_page_scroll, ui_page_rows_visible);

    for (var i = 0; i < array_length(visible_materials); i++) {
        var mat = visible_materials[i];
        var row_y = ui_page_content_y + i * ui_page_list_row_h;
        var mat_data = global.material_data[mat];

        if (!is_undefined(mat_data.spr)) {
            draw_sprite_ext(mat_data.spr, mat_data.frame, ui_page_content_x + 8, row_y + 10, 0.5, 0.5, 0, c_white, 1);
        }

        draw_text(ui_page_content_x + 22, row_y + 2, mat_data.name + " x" + string(global.inventory[mat]));
    }
}