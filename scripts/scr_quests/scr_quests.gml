function init_special_quests() {
    var quests = [];

    array_push(quests, {
        id: "tutorial_wine_glass",
        title: "Wine Glasses for a Party",
        desc: "A customer needs a proper glass for the evening festivities.",
        request_material: Material.WineGlass,
        request_amount: 1,
        provided_materials: [
            { material: Material.Saltwater, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Grapes, amount: 1 }
        ],
        portrait_frame: 0,
        stage: "offer",
        completed: false
    });

    array_push(quests, {
        id: "wine_job",
        title: "Wine!",
        desc: "Help us revive this party!",
        request_material: Material.Wine,
        request_amount: 1,
        provided_materials: [],
        rewards: [
            { type: "material", material: Material.Blood, amount: 1 }
        ],
        portrait_frame: 1,
        stage: "offer",
        completed: false
    });

    array_push(quests, {
        id: "making_money_1",
        title: "Silver Request",
        desc: "There's a werewolf about and we need silver to kill it. We only have iron though.",
        request_material: Material.Silver,
        request_amount: 1,
        provided_materials: [
            { material: Material.Iron, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });

    return quests;
}


function try_complete_active_quest(_index) {
    if (_index < 0 || _index >= array_length(global.active_quests)) return false;

    var q = global.active_quests[_index];

    if (q.completed) {
        global.last_message = "Quest already completed.";
        return false;
    }

    if (!inventory_has(q.request_material, q.request_amount)) {
        global.last_message = "You do not have the required item.";
        return false;
    }

    inventory_remove(q.request_material, q.request_amount);

    for (var i = 0; i < array_length(q.rewards); i++) {
        var r = q.rewards[i];

        if (r.type == "material") {
            inventory_add(r.material, r.amount);
        }

        if (r.type == "recipe") {
            var recipe = global.recipes[r.recipe_index];
            recipe.discovered = true;
            global.recipes[r.recipe_index] = recipe;
        }
    }

    q.completed = true;
    q.stage = "completed";
    global.active_quests[_index] = q;

    global.last_message = "Quest completed: " + q.title;
    global.npc_name = "Customer";
    global.npc_line = "Wonderful. Thank you.";
    global.dialog_visible = true;
    global.pending_next_quest = true;

    return true;
}



function advance_to_next_quest() {
    if (global.next_special_quest_index < array_length(global.special_quests)) {
        global.active_quests[0] = global.special_quests[global.next_special_quest_index];
        global.next_special_quest_index += 1;

        global.npc_name = "Customer";
        global.npc_line = global.active_quests[0].desc;
        global.dialog_visible = true;
        global.pending_next_quest = false;
    } else {
        // no more quests
        array_resize(global.active_quests, 0);
        global.dialog_visible = false;
        global.pending_next_quest = false;
    }
}