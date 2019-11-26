for(i = 0; i < 5; ++i) {
	if(other == recipe_ds[i, 0] && !recipe_ds[i, 1]) {
		num_ingred_collected++;
		break;
	}
}