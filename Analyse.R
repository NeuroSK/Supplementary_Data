t.test(Age ~ Groupe, data = data, var.equal = TRUE)

boxplot(Age ~ Groupe, data = data, 
        main = "Figure 5 : Boplot de l'âge en fonction du groupe", 
        xlab = "Groupe", ylab = "Âge", 
        col = c("#2c72B7", "lightgreen"), 
        outline = FALSE)

