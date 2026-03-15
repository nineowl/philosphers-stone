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

ui_action_arrow_right_x = 580;
ui_action_arrow_right_y = 280;

ui_action_arrow_w = 16;
ui_action_arrow_h = 16;

ui_action_label_x = 515;
ui_action_label_y = 280;

// -------------------------
// Q / R / M LETTERS
// -------------------------
ui_tab_q_x = 332;
ui_tab_q_y = 64;

ui_tab_r_x = 366;
ui_tab_r_y = 64;

ui_tab_m_x = 402;
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
ui_turnin_y1 = ui_page_content_y + 100;
ui_turnin_x2 = ui_page_content_x + 56;
ui_turnin_y2 = ui_page_content_y + 118;

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

//Textbox
ui_dialog_x1 = 40;
ui_dialog_y1 = 285;
ui_dialog_x2 = 280;
ui_dialog_y2 = 345;

//quest accept button
ui_accept_x1 = ui_page_content_x + 4;
ui_accept_y1 = ui_page_content_y + 100;
ui_accept_x2 = ui_page_content_x + 56;
ui_accept_y2 = ui_page_content_y + 118;


//stone charging button
ui_recharge_x1 = ui_stone_x;
ui_recharge_y1 = ui_stone_y + 34;
ui_recharge_x2 = ui_stone_x + 60;
ui_recharge_y2 = ui_stone_y + 50;


// quest cycle arrows
ui_quest_arrow_left_x = ui_page_content_x + 70;
ui_quest_arrow_left_y = ui_page_content_y - 14;

ui_quest_arrow_right_x = ui_page_content_x + 95;
ui_quest_arrow_right_y = ui_page_content_y - 14;

ui_quest_arrow_w = 12;
ui_quest_arrow_h = 12;
