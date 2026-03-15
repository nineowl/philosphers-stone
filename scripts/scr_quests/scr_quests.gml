function init_special_quests() {
    var quests = [];

    // 1 - woman
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
            { type: "material", material: Material.Grapes, amount: 1 },
            { type: "recipe_material", material: Material.Wine }
        ],
        portrait_frame: 4,
        stage: "offer",
        completed: false
    });

    // 2 - woman
    array_push(quests, {
        id: "wine_job",
        title: "Wine!",
        desc: "Help us revive this party!",
        request_material: Material.Wine,
        request_amount: 1,
        provided_materials: [],
        rewards: [
            { type: "material", material: Material.Blood, amount: 1 },
            { type: "recipe_material", material: Material.AphrodisiacPotion }
        ],
        portrait_frame: 4,
        stage: "offer",
        completed: false
    });

    // 3 - old man
    array_push(quests, {
        id: "ice_cream",
        title: "A Sweet Treat",
        desc: "Could you make me some ice cream?",
        request_material: Material.IceCream,
        request_amount: 1,
        provided_materials: [
            { material: Material.Milk, amount: 1 },
            { material: Material.Flowers, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 1 }
        ],
        portrait_frame: 6,
        stage: "offer",
        completed: false
    });

    // 4 - tough man
    array_push(quests, {
        id: "making_money_1",
        title: "Silver Request",
        desc: "There is a werewolf about. We only have iron.",
        request_material: Material.Silver,
        request_amount: 1,
        provided_materials: [
            { material: Material.Iron, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 1 },
            { type: "recipe_material", material: Material.Sword }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });

    // 5 - woman
    array_push(quests, {
        id: "love_potion",
        title: "Raising the Stakes",
        desc: "My husband just has not been in the mood lately. Might you have something for that?",
        request_material: Material.AphrodisiacPotion,
        request_amount: 1,
        provided_materials: [
            { material: Material.Wine, amount: 1 },
            { material: Material.Flowers, amount: 2 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 2 },
            { type: "material", material: Material.FaerieJar, amount: 1 }
        ],
        portrait_frame: 5,
        stage: "offer",
        completed: false
    });

    // 6 - tough man
    array_push(quests, {
        id: "soldiers_fortune",
        title: "Soldier in Need",
        desc: "I need 2 swords urgently. Here are the materials.",
        request_material: Material.Sword,
        request_amount: 2,
        provided_materials: [
            { material: Material.Iron, amount: 2 },
            { material: Material.Carbon, amount: 2 }
        ],
        rewards: [
            { type: "material", material: Material.Gold, amount: 1 },
            { type: "material", material: Material.Mercury, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });

    // 7 - old man
    array_push(quests, {
        id: "old_man_perfume",
        title: "A Memory",
        desc: "Could you make a perfume? It reminds me of someone.",
        request_material: Material.Perfume,
        request_amount: 1,
        provided_materials: [
            { material: Material.Flowers, amount: 1 },
            { material: Material.Water, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 1 }
        ],
        portrait_frame: 6,
        stage: "offer",
        completed: false
    });

    // 8 - tough man
    array_push(quests, {
        id: "making_money_2",
        title: "Silver Request Urgently",
        desc: "That silver failed us. This is my last iron block.",
        request_material: Material.Silver,
        request_amount: 1,
        provided_materials: [
            { material: Material.Iron, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 1 },
            { type: "recipe_material", material: Material.Bomb }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });

    // 9 - fancy man
    array_push(quests, {
        id: "iron_to_gold",
        title: "Alchemy at its Finest",
        desc: "Is it true you can make gold? I need to fund my campaign.",
        request_material: Material.Gold,
        request_amount: 1,
        provided_materials: [
            { material: Material.Silver, amount: 2 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 2 },
            { type: "material", material: Material.SoulEminent, amount: 1 },
            { type: "recipe_material", material: Material.Chimera }
        ],
        portrait_frame: 1,
        stage: "offer",
        completed: false
    });

    // 10 - tough man
    array_push(quests, {
        id: "night_shift",
        title: "Need a Bomb",
        desc: "I forgot my keys. Can you make a bomb for me?",
        request_material: Material.Bomb,
        request_amount: 1,
        provided_materials: [
            { material: Material.Carbon, amount: 1 },
            { material: Material.Sulfur, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Sword, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });

    // 11 - tough man
    array_push(quests, {
        id: "free_a_friend",
        title: "Diamond",
        desc: "I need a diamond to cut glass and free my friend.",
        request_material: Material.Diamond,
        request_amount: 1,
        provided_materials: [
            { material: Material.Carbon, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Sulfur, amount: 2 },
            { type: "recipe_material", material: Material.Perfume }
        ],
        portrait_frame: 3,
        stage: "offer",
        completed: false
    });

    // 12 - tough man
    array_push(quests, {
        id: "night_shift_2",
        title: "Need Another Bomb",
        desc: "I locked myself out again. I can trade you this amulet.",
        request_material: Material.Bomb,
        request_amount: 1,
        provided_materials: [
            { material: Material.Carbon, amount: 1 },
            { material: Material.Sulfur, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Amulet, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });

    // 13 - fancy man
    array_push(quests, {
        id: "chimera",
        title: "Alchemy at its Finest II",
        desc: "I really want a pet, but my mother will not allow it.",
        request_material: Material.Chimera,
        request_amount: 1,
        provided_materials: [
            { material: Material.Sulfur, amount: 1 },
            { material: Material.SoulEminent, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 2 },
            { type: "material", material: Material.Blood, amount: 1 },
            { type: "material", material: Material.Clay, amount: 1 },
            { type: "recipe_material", material: Material.Homunculus }
        ],
        portrait_frame: 5,
        stage: "offer",
        completed: false
    });

    // 14 - fancy man
    array_push(quests, {
        id: "homunculus",
        title: "Alchemy at its Finest III",
        desc: "I want a friend, someone I can speak to. Can you help?",
        request_material: Material.Homunculus,
        request_amount: 1,
        provided_materials: [
            { material: Material.Clay, amount: 1 },
            { material: Material.SoulRegular, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 2 },
            { type: "material", material: Material.SoulEminent, amount: 1 },
            { type: "recipe_material", material: Material.PhilosopherStone }
        ],
        portrait_frame: 6,
        stage: "offer",
        completed: false
    });

    return quests;
}

function unlock_recipe_by_output(_material) {
    for (var i = 0; i < array_length(global.recipes); i++) {
        var r = global.recipes[i];

        for (var j = 0; j < array_length(r.outputs); j++) {
            if (r.outputs[j].material == _material) {
                r.discovered = true;
                global.recipes[i] = r;
                return true;
            }
        }
    }

    return false;
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

        if (r.type == "recipe_material") {
            unlock_recipe_by_output(r.material);
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

    audio_play_sound(snd_turnin, 1, false);
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