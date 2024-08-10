// Coconut
/obj/item/grown/coconut
	seed = /obj/item/seeds/coconut
	name = "Coconut"
	desc = "The young coconut is still green"
	icon_state = "coconut"
	var/coco_name = "piece coconut"

/obj/item/seeds/coconut
	name = "pack of coconut seeds"
	desc = "test"
	icon_state = "seed-coconut"
	species = "coconut"
	plantname = "Coconut Tree"
	product = /obj/item/grown/coconut
	lifespan = 79
	endurance = 59
	production = 7
	maturation = 11
	yield = 5
	potency = 69
	growthstages = 6
	weed_rate = 4
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "coconut-grow"
	icon_dead = "coconut-dead"
	genes = list(/datum/plant_gene/trait/maxchem , /datum/plant_gene/trait/repeated_harvest)
	reagents_add = list("coconut_water" = 0.45, "shradded_coconut" = 0.15)

/obj/item/grown/coconut/attackby(obj/item/W, mob/user, params)
	if(is_sharp(W))
		if(isturf(loc))
			user.show_message(span_notice("You make [coco_name] out of \the [src]!"), 1)
			new /obj/item/reagent_containers/food/snacks/piece_coconut(loc)
			new /obj/item/reagent_containers/food/snacks/piece_coconut(loc)
			to_chat(user, "<span class='notice'>You crack [src].</span>")
			qdel(src)
		else
			to_chat(user, "<span class='notice'>You need to put [src] on a surface to roll it out!</span>")
	else
		return ..()

/obj/item/reagent_containers/food/snacks/piece_coconut
	name = "Piece coconut"
	desc = "Slice of old coconut has pulp"
	icon_state = "piece_coconut"
	list reagents = list("shradded_coconut" = 3)
