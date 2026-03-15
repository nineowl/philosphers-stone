function book_turn_to_frame(_frame) {
    if (!instance_exists(oBook)) return;

    with (oBook) {
        if (book_turning) exit;

        target_book_frame = _frame;
        sprite_index = sBookPageTurn;
        image_index = 0;
        image_speed = 0.4;
        book_turning = true;
    }
}