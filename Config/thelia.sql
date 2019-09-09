
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- better_seo
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `better_seo`;

CREATE TABLE `better_seo`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `object_id` INTEGER NOT NULL,
    `object_type` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- better_seo_i18n
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `better_seo_i18n`;

CREATE TABLE `better_seo_i18n`
(
    `id` INTEGER NOT NULL,
    `locale` VARCHAR(5) DEFAULT 'en_US' NOT NULL,
    `noindex` TINYINT(4) DEFAULT 0 NOT NULL,
    `nofollow` TINYINT(4) DEFAULT 0 NOT NULL,
    `canonical_field` TEXT,
    `h1` TEXT,
    PRIMARY KEY (`id`,`locale`),
    CONSTRAINT `better_seo_i18n_FK_1`
        FOREIGN KEY (`id`)
        REFERENCES `better_seo` (`id`)
        ON DELETE CASCADE
) ENGINE=InnoDB;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
