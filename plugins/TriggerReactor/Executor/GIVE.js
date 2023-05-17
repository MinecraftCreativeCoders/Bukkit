/*******************************************************************************
 *     Copyright (C) 2017 wysohn
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *******************************************************************************/
function GIVE(args){
	if(args.length == 1){

		if (!(args[0] instanceof Java.type("org.bukkit.inventory.ItemStack")))
		{
			throw new Error("Invalid ItemStack: " + args[0])
		}

		var inven = player.getInventory();
		var size = 0;
		for(var i = 0; i < 36; i++){
			if (inven.getItem(i) == null) {
				size += args[0].getMaxStackSize();
			}else if (inven.getItem(i).isSimilar(args[0])){
				size += inven.getItem(i).getMaxStackSize() - inven.getItem(i).getAmount();
			}

			if (size >= args[0].getAmount()) {
				inven.addItem(args[0]);
				return;
			}
		}
		throw new Error("Player has no empty slot.");
	}else{
		throw new Error("Invalid parameters. Need [ItemStack]")
	}
}