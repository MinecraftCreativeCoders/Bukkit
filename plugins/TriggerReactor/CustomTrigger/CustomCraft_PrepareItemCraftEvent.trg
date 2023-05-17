import org.bukkit.craftbukkit.v1_19_R3.inventory.CraftInventoryCrafting

import java.util.ArrayList
import org.bukkit.inventory.RecipeChoice$ExactChoice


IF event.getRecipe() != null
    IF event.getRecipe().getKey().getNamespace() == "triggerreactor"
        shape = ArrayList(event.getRecipe().getChoiceMap().values())

        FOR i = 0:shape.size()
            item = shape.get(i)
            IF item IS ExactChoice
                matrix = event.getInventory().getMatrix()

                IF !item.getItemStack().isSimilar(matrix[i]) || item.getItemStack().getAmount() > matrix[i].getAmount()
                    event.getInventory().setResult(null)
                ELSE
                    event.getInventory().setResult(event.getRecipe().getResult())
                ENDIF
            ENDIF
        ENDFOR
    ENDIF
ENDIF