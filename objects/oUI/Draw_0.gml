if (!variable_global_exists("stone_charge")) exit;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

// ---------------------------------
// Debug / HUD header
// ---------------------------------
draw_set_font(global.font_ui);
draw_set_color(c_white);
draw_text(10, 18, "Stone Charge: " + string(global.stone_charge) + "/" + string(global.stone_max_charge));
draw_text(10, 36, "Selected Action: " + action_name(global.selected_action));
draw_text(10, 54, "Message: " + global.last_message);
draw_text(10, 72, "Page: " + book_tab_name(book_tab) + "   (Q/R/M)");


// ---------------------------------
// Left page title
// ---------------------------------
draw_set_font(global.font_book);
draw_set_color(c_black);
draw_text(ui_page_content_x, ui_page_content_y - 14, book_tab_name(book_tab));


// ---------------------------------
// Left page content
// ---------------------------------
draw_set_font(global.font_book);

switch (book_tab) {
    case 0:
        draw_quests_page();
    break;

    case 1:
        draw_recipes_page();
    break;

    case 2:
        draw_materials_page();
    break;
}


// ---------------------------------
// Selected materials drawn in the middle of the right page
// ---------------------------------
for (var s = 0; s < array_length(global.selected_materials); s++) {
    var mat = global.selected_materials[s];
    var mat_data = global.material_data[mat];

    var draw_x = ui_alchemy_center_x;
    var draw_y = ui_alchemy_center_y;

    switch (s) {
        case 0:
            draw_x = ui_alchemy_center_x;
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
            draw_x = ui_alchemy_center_x;
            draw_y = ui_alchemy_center_y + ui_alchemy_slot_gap;
        break;
    }

    if (!is_undefined(mat_data.spr)) {
        draw_sprite(mat_data.spr, mat_data.frame, draw_x, draw_y);
    } else {
        draw_set_font(global.font_small);
        draw_set_color(c_black);
        draw_text(draw_x - 12, draw_y - 6, mat_data.name);
    }
}


// ---------------------------------
// Customer / quest summary
// ---------------------------------
// Customer / quest summary
draw_set_font(global.font_book);
draw_set_color(c_black);
draw_text(ui_customer_text_x, ui_customer_text_y, "Customer Area");


// ---------------------------------
// Turn-in button
// ---------------------------------
// Turn-in button
draw_set_font(global.font_small);
draw_set_color(c_black);
draw_rectangle(ui_turnin_x1, ui_turnin_y1, ui_turnin_x2, ui_turnin_y2, true);
draw_text(ui_turnin_x1 + 10, ui_turnin_y1 + 8, "TURN IN");


// ---------------------------------
// Temporary failure list
// ---------------------------------
if (array_length(global.failure_items) > 0) {
    draw_set_font(global.font_small);
    draw_set_color(c_black);
    draw_text(ui_customer_text_x, ui_customer_text_y + 86, "Failures:");

    for (var f = 0; f < array_length(global.failure_items); f++) {
        var failure_y = ui_customer_text_y + 102 + f * 18;
        draw_text(ui_customer_text_x, failure_y, "Failure " + string(f));
    }
}