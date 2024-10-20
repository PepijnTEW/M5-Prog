CREATE TABLE `dbfirst`.`bordspellen` (
  `idbordspellen` INT NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(250) NOT NULL,
  `aantal spelers` INT NOT NULL,
  `beschrijving` VARCHAR(400) NOT NULL,
  `coop` INT NOT NULL,
  PRIMARY KEY (`idbordspellen`),
  UNIQUE INDEX `idbordspellen_UNIQUE` (`idbordspellen` ASC) VISIBLE);
