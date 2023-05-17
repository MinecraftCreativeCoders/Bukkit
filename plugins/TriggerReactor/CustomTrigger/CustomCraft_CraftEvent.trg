import java.util.ArrayList
import org.bukkit.event.inventory.InventoryAction
import org.bukkit.inventory.RecipeChoice$ExactChoice

//MOVE_TO_OTHER_INVENTORY
//PICKUP_ALL
//PICKUP_HALF
//HOTBAR_SWAP

IF event.getInventory().getResult() != null
    IF event.getRecipe().getKey().getNamespace() != "triggerreactor"
        #STOP
    ENDIF
    IF event.getAction() == InventoryAction.PICKUP_ALL || event.getAction() == InventoryAction.PICKUP_HALF || event.getAction() == InventoryAction.HOTBAR_SWAP
        shape = ArrayList(event.getRecipe().getChoiceMap().values())
        matrix = event.getInventory().getMatrix()
        
        FOR i = 0:matrix.length
            item = matrix[i]
            IF item != null
                IF shape.get(i) IS ExactChoice
                    item.setAmount(item.getAmount() - shape.get(i).getItemStack().getAmount()+1)
                ENDIF
            ENDIF
        ENDFOR
    ELSEIF event.getAction() == InventoryAction.MOVE_TO_OTHER_INVENTORY

        event.setCancelled(true)

        result = event.getInventory().getResult()
        inven = event.getWhoClicked().getInventory()

        WHILE event.getInventory().getResult() != null
            TRY
                #GIVE event.getRecipe().getResult()
                shape = ArrayList(event.getRecipe().getChoiceMap().values())
                matrix = event.getInventory().getMatrix()
                FOR i = 0:matrix.length
                    item = matrix[i]
                    IF item != null && shape.get(i) IS ExactChoice
                        item.setAmount(item.getAmount() - shape.get(i).getItemStack().getAmount())
                        IF item.getAmount() < shape.get(i).getItemStack().getAmount()
                            event.getInventory().setResult(null)
                        ENDIF
                    ENDIF
                ENDFOR
            CATCH e
                #BREAK
            ENDTRY
        ENDWHILE
    ENDIF
ENDIF