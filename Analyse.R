library(ggplot2)
library(dplyr)

data_plot <- left_join(data, summary_data, by = "Groupe")

#--- Figure 5 : Box plot de l'âge en fonction du groupe

t.test(Age ~ Groupe, data = data, var.equal = TRUE)

boxplot(Age ~ Groupe, data = data, 
        main = "Figure 5 : Boplot de l'âge en fonction du groupe", 
        xlab = "Groupe", ylab = "Âge", 
        col = c("#2c72B7", "#3FAF46"), 
        outline = FALSE)

stripchart(Age ~ Groupe, data = data,
           vertical = TRUE, method = "jitter",
           pch = 21, col = 'black', bg = 'black', add = TRUE)


summary_data <- data %>%
  group_by(Groupe) %>%
  summarise(Moyenne = mean(Intrusion_Total, na.rm = TRUE),
            SD = sd(Intrusion_Total, na.rm = TRUE),
            N = n(),
            SE = SD / sqrt(N))

#--- Figure 6 : Box plot intrusion total en fonction du groupe

ggplot(data_plot, aes(x = Groupe, y = Intrusion_Total, fill = Groupe)) +
  stat_summary(fun = mean, geom = "bar", width = 0.5, color = "black") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  geom_jitter(width = 0.1, size = 2, shape = 21, fill = "black") +
  scale_fill_manual(values = c("C" = "#2c72B7", "SK" = "#3FAF46")) +
  labs(
    title = "Figure 6 : Score d'intrusions totales (%) selon le groupe",
    x = "Groupe",
    y = "Intrusions totales (%)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )
                    
