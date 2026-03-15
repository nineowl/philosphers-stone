// -------------------------
// PAGE MODE
// 0 = Quests
// 1 = Recipes
// 2 = Materials
// -------------------------
book_tab = 0;
ui_page_scroll = 0;
ui_page_rows_visible = 7;

// -------------------------
// BOOK PAGE CONTENT
// use marker for left-page text
// -------------------------
if (instance_exists(oQuestTextMarker)) {
    ui_page_content_x = oQuestTextMarker.x;
    ui_page_content_y = oQuestTextMarker.y;
} else {
    ui_page_content_x = 320;
    ui_page_content_y = 100;
}

ui_page_content_w = 112;
ui_page_content_h = 160;
ui_page_list_row_h = 20;
ui_page_list_icon_size = 16;

// -------------------------
// ALCHEMY CENTER
// -------------------------
if (instance_exists(oAlchemyCenterMarker)) {
    ui_alchemy_center_x = oAlchemyCenterMarker.x;
    ui_alchemy_center_y = oAlchemyCenterMarker.y;
} else {
    ui_alchemy_center_x = 530;
    ui_alchemy_center_y = 160;
}

ui_alchemy_slot_gap = 18;





// -------------------------
// PHILOSOPHER STONE
// -------------------------
if (instance_exists(oStoneMarker)) {
    ui_stone_x = oStoneMarker.x;
    ui_stone_y = oStoneMarker.y;
} else {
    ui_stone_x = 20;
    ui_stone_y = 20;
}

ui_stone_scale = 2;

// -------------------------
// ACTION ARROWS
// -------------------------
ui_action_arrow_left_x = 495;
ui_action_arrow_left_y = 280;

ui_action_arrow_right_x = 565;
ui_action_arrow_right_y = 280;

ui_action_arrow_w = 16;
ui_action_arrow_h = 16;

ui_action_label_x = 515;
ui_action_label_y = 280;

// -------------------------
// Q / R / M LETTERS
// -------------------------
ui_tab_q_x = 342;
ui_tab_q_y = 64;

ui_tab_r_x = 381;
ui_tab_r_y = 64;

ui_tab_m_x = 417;
ui_tab_m_y = 64;

ui_tab_w = 16;
ui_tab_h = 16;

// -------------------------
// RIGHT PAGE CLICK AREA
// -------------------------
ui_page_right_x1 = 451;
ui_page_right_y1 = 79;
ui_page_right_x2 = 614;
ui_page_right_y2 = 278;

// -------------------------
// QUEST TURN-IN BUTTON
// This lives inside the quest page
// -------------------------
ui_turnin_x1 = ui_page_content_x+4;
ui_turnin_y1 = ui_page_content_y + 120;
ui_turnin_x2 = ui_page_content_x + 56;
ui_turnin_y2 = ui_page_content_y + 138;

// -------------------------
// FAERIE JAR
// -------------------------
if (instance_exists(oFaerieMarker)) {
    ui_faerie_x = oFaerieMarker.x;
    ui_faerie_y = oFaerieMarker.y;
} else {
    ui_faerie_x = 220;
    ui_faerie_y = 250;
}
//animation
ui_faerie_frame = 0;
ui_faerie_speed = 0.15;


//Hover Text
ui_hover_name_x = 320;
ui_hover_name_y = 280;
ui_hover_desc_x = 320;
ui_hover_desc_y = 304;

// -------------------------
// NPC PORTRAIT + DIALOGUE ANCHORS
// -------------------------
if (instance_exists(oNPCMarker)) {
    ui_portrait_x = oNPCMarker.x;
    ui_portrait_y = oNPCMarker.y;
} else {
    ui_portrait_x = 34;
    ui_portrait_y = 286;
}

if (instance_exists(oDialogTextMarker)) {
    ui_dialog_text_x = oDialogTextMarker.x;
    ui_dialog_text_y = oDialogTextMarker.y;
} else {
    ui_dialog_text_x = 104;
    ui_dialog_text_y = 292;
}

// portrait scale
ui_portrait_scale = 2;

// dialogue box rectangle built around text anchor
ui_dialog_x1 = ui_dialog_text_x - 8;
ui_dialog_y1 = ui_dialog_text_y - 6;
ui_dialog_x2 = ui_dialog_text_x + 178;
ui_dialog_y2 = ui_dialog_text_y + 54;

// Typewriter text
ui_dialog_char_index = 0;
ui_dialog_char_speed = 0.5;
ui_dialog_char_timer = 0;
ui_last_dialog_line = "";

//quest accept button
ui_accept_x1 = ui_page_content_x + 4;
ui_accept_y1 = ui_page_content_y + 120;
ui_accept_x2 = ui_page_content_x + 56;
ui_accept_y2 = ui_page_content_y + 138;


//stone charging button
ui_recharge_x1 = ui_stone_x;
ui_recharge_y1 = ui_stone_y + 54;
ui_recharge_x2 = ui_stone_x + 60;
ui_recharge_y2 = ui_stone_y + 70;


// quest cycle arrows
ui_quest_arrow_left_x = ui_page_content_x + 70;
ui_quest_arrow_left_y = ui_page_content_y - 14;

ui_quest_arrow_right_x = ui_page_content_x + 95;
ui_quest_arrow_right_y = ui_page_content_y - 14;

ui_quest_arrow_w = 12;
ui_quest_arrow_h = 12;

//arrow sprite
ui_arrow_sprite = sArrow;
ui_arrow_scale = 1;


//knife to kill faerie
if (instance_exists(oKnifeMarker)) {
    ui_knife_x = oKnifeMarker.x;
    ui_knife_y = oKnifeMarker.y;
} else {
    ui_knife_x = 240;
    ui_knife_y = 250;
}

ui_knife_w = 20;
ui_knife_h = 20;

// materials page sub-mode
// 0 = Materials
// 1 = Failures
ui_materials_mode = 0;

// sub-mode arrows on materials page
ui_submode_arrow_left_x = ui_page_content_x + 74;
ui_submode_arrow_left_y = ui_page_content_y - 14;

ui_submode_arrow_right_x = ui_page_content_x + 98;
ui_submode_arrow_right_y = ui_page_content_y - 14;

ui_submode_arrow_w = 12;
ui_submode_arrow_h = 12;

// faerie kill confirm popup
ui_faerie_confirm = false;
ui_faerie_popup_active = false;
ui_faerie_popup_frame = 0;
ui_faerie_popup_speed = 0.09; // much slower than before

ui_faerie_popup_x1 = 230;
ui_faerie_popup_y1 = 110;
ui_faerie_popup_x2 = 410;
ui_faerie_popup_y2 = 200;

ui_faerie_yes_x1 = 250;
ui_faerie_yes_y1 = 170;
ui_faerie_yes_x2 = 300;
ui_faerie_yes_y2 = 192;

ui_faerie_no_x1 = 330;
ui_faerie_no_y1 = 170;
ui_faerie_no_x2 = 380;
ui_faerie_no_y2 = 192;
