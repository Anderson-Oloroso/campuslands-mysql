USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS skin_shooter(
  skind_id INT NOT NULL AUTO_INCREMENT,
  skin_name VARCHAR(50) NOT NULL,
  skin_description VARCHAR(100) NOT NULL,
  PRIMARY KEY (skind_id)
)

CREATE TABLE IF NOT EXISTS inventario_skins(
  inventario_id INT NOT NULL AUTO_INCREMENT,
  skin_id INT NOT NULL,
  skin_quantity INT NOT NULL,
  PRIMARY KEY (inventario_id),
  FOREIGN KEY (skin_id) REFERENCES skin_shooter(skind_id)
)