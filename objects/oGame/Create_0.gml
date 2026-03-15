global.material_data = init_material_data();
global.recipes = init_recipe_data();

global.inventory = array_create(Material.Chimera + 1, 0);
global.failure_items = [];

global.special_quests = init_special_quests();
global.active_quests = [];

global.stone_level = StoneLevel.Crude;
global.stone_charge = 10;
global.stone_max_charge = 10;
global.game_won = false;
global.game_lost = false;

global.selected_action = AlchemyAction.Separate;
global.selected_materials = [];
global.selected_failure_index = -1;
global.last_message = "Welcome.";

global.inventory_scroll = 0;

//fonts
global.font_ui = fnt_ui;
global.font_book = fnt_book;
global.font_small = fnt_small;
global.font_title = fnt_title;

// test materials
inventory_add(Material.Sand, 2);
inventory_add(Material.Water, 2);
inventory_add(Material.Flowers, 2);
inventory_add(Material.Sulfur, 2);
inventory_add(Material.Carbon, 2);
inventory_add(Material.Iron, 1);
inventory_add(Material.Milk, 1);
inventory_add(Material.Silver, 1);
inventory_add(Material.Mercury, 1);
inventory_add(Material.SoulTiny, 1);
inventory_add(Material.Saltwater, 1);
inventory_add(Material.FaerieJar, 1);
inventory_add(Material.Fungi, 1);

// activate tutorial quest
array_push(global.active_quests, global.special_quests[0]);


//hover description
global.hovered_material = -1;
global.hovered_recipe = -1;



//npc
global.npc_present = true;
global.dialog_visible = true;
global.npc_name = "Customer";
global.npc_line = "Hello. I need a wine glass for tonight's festivities.";
global.current_quest_index = 0;
//global.quest_stage = "offer";
global.npc_sprite = noone;

//quests

global.next_special_quest_index = 1;


