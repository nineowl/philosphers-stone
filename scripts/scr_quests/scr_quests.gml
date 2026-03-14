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
        completed: false
    });
	
	array_push(quests, {
        id: "wine_glass",
        title: "Wine!",
        request_material: Material.Wine,
        request_amount: 1,
		provided_materials: [],
        rewards: [
            { type: "material", material: Material.Blood, amount: 1 }
        ],
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
    }

    q.completed = true;
    global.active_quests[_index] = q;

    global.last_message = "Quest completed: " + q.title;
    return true;
}