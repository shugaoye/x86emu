for i in eng userdebug user; do
        add_lunch_combo x86emu_x86-${i}
done

for i in eng userdebug user; do
        add_lunch_combo x86emu_x86_64-${i}
done
