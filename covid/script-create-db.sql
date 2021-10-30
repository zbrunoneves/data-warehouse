CREATE TABLE `Dim_Data` (
  `data_id` int unsigned auto_increment,
  `data` date,
  PRIMARY KEY (`data_id`)
);

CREATE TABLE `Dim_Localizacao` (
  `localizacao_id` int unsigned auto_increment,
  `codigo_ibge` int unsigned,
  `estado` char(2),
  `municipio` varchar(100),
  `localizacao_tipo` varchar(50),
  `populacao_2019` int unsigned,
  `populacao_atual` int unsigned,
  PRIMARY KEY (`localizacao_id`)
);

CREATE TABLE `Fato_Casos` (
  `data_id` int unsigned,
  `localizacao_id` int unsigned,
  `confirmados` int unsigned,
  `confirmados_por_100k` float,
  `obitos` int unsigned,
  `indice_mortalidade` float,
  `ordem_dado_localizacao` int unsigned,
  `ultimo_dado` bit,
  PRIMARY KEY (`data_id`, `localizacao_id`),
  FOREIGN KEY (`data_id`) REFERENCES `Dim_Data`(`data_id`),
  FOREIGN KEY (`localizacao_id`) REFERENCES `Dim_Localizacao`(`localizacao_id`)
);


