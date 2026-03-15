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
	
	array_push(quests, {
        id: "soldiers_fortune",
        title: "Soldier in need",
        desc: "Hello, I need 2 swords forged as soon as possible. The train is leaving the station in 20 minutes and I need them. It's urgent! Here are the materials!",
        request_material: Material.Sword,
        request_amount: 2,
        provided_materials: [
            { material: Material.Iron, amount: 2, },
            { material: Material.Carbon, amount: 2, }
        ],
        rewards: [
            { type: "material", material: Material.Gold, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });
	array_push(quests, {
        id: "making_money_2",
        title: "Silver Request Urgently",
        desc: "That silver we got was faulty and my friend was bitten! We need more silver to save him. This is the last iron block I have.",
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
	array_push(quests, {
        id: "night_shift",
        title: "Need a Bomb",
        desc: "It seems that I've forgot my keys. Can you please make a bomb for me so I can open the saf... I mean doors of my house?",
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
	///
	array_push(quests, {
        id: "free_a_friend",
        title: "Diamond",
        desc: "My friend was taken by evil wizard. I need a diamond to cut through glass. I can provide the materials. I hope I'm not too late!",
        request_material: Material.Diamond,
        request_amount: 1,
        provided_materials: [
            { material: Material.Carbon, amount: 1 }
        ],
        rewards: [
            { type: "material", material: Material.Sulfur, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });
	array_push(quests, {
        id: "iron_to_gold",
        title: "Alchemy at it's Finest",
        desc: "Is it true, you can make gold? I need to fund my campagin.",
        request_material: Material.Gold,
        request_amount: 2,
        provided_materials: [
            { material: Material.Iron, amount: 1, },
            { material: Material.Mercury, amount: 2, }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 2 },
			{ type: "material", material: Material.SoulEminent, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });
	array_push(quests, {
        id: "night_shift_2",
        title: "Need another Bomb",
        desc: "I locked myself out again. Heheeheee, Can you make me another bomb? I can give you this amulet in return.",
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
	array_push(quests, {
        id: "chimera",
        title: "Alchemy at it's Finest II",
        desc: "I really want a pet, but my mother won't let me have one.",
        request_material: Material.Chimera,
        request_amount: 2,
        provided_materials: [
            { material: Material.Sulfur, amount: 1, },
            { material: Material.SoulEminent, amount: 1, }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 3 },
	{ type: "material", material: Material.Clay, amount: 1 }
        ],
        portrait_frame: 2,
        stage: "offer",
        completed: false
    });
	array_push(quests, {
        id: "homunculus",
        title: "Alchemy at it's Finest III",
        desc: "I really want a friend, someone I can talk to, can you help?",
        request_material: Material.Homunculus,
        request_amount: 2,
        provided_materials: [
            { material: Material.Iron, amount: 1, },
            { material: Material.Mercury, amount: 2, }
        ],
        rewards: [
            { type: "material", material: Material.Heart, amount: 2 },
	{ type: "material", material: Material.SoulEminent, amount: 1 }
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
	audio_play_sound(snd_turnin, 1, false);
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