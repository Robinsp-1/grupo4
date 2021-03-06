/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 27-may.-2020 15:47:09 				*/
/*  DBMS       : MySql 						*/
/* ---------------------------------------------------- */

SET FOREIGN_KEY_CHECKS=0 
;

/* Drop Tables */

DROP TABLE IF EXISTS `almacen` CASCADE
;

DROP TABLE IF EXISTS `clientes` CASCADE
;

DROP TABLE IF EXISTS `compras` CASCADE
;

DROP TABLE IF EXISTS `facturas` CASCADE
;

DROP TABLE IF EXISTS `productos` CASCADE
;

DROP TABLE IF EXISTS `proveedores` CASCADE
;

DROP TABLE IF EXISTS `registro_ventas` CASCADE
;

DROP TABLE IF EXISTS `vendedores` CASCADE
;

/* Create Tables */

CREATE TABLE `almacen`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`id_producto` BIGINT NOT NULL,
	`no_fila` TINYTEXT NULL,
	`no_estante` TINYTEXT NULL,
	`disponibilidad` ENUM ('Disponible', 'No disponible') NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'contiene datos en el que esta almacenado el producto'

;

CREATE TABLE `clientes`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`nombre` TINYTEXT NULL,
	`nit` TINYTEXT NULL,
	`direccion` TINYTEXT NULL,
	`ciudad` TINYTEXT NULL,
	`telefono` TINYTEXT NULL,
	`correo_electronico` TINYTEXT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'aqui ira la informacion de los clientes'

;

CREATE TABLE `compras`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`id_producto` BIGINT NOT NULL,
	`id_proveedor` BIGINT NOT NULL,
	`Cantidad_comprado` TINYTEXT NULL,
	`Fecha_de_compra_de_producto` DATE NULL,
	`total_compra` FLOAT(10,2) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Aqui ira la informacion de la compra de productos'

;

CREATE TABLE `facturas`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`no_factura` VARCHAR(50) NULL,
	`id_cliente` BIGINT NOT NULL,
	`id_producto` BIGINT NOT NULL,
	`cantidad` BIGINT NULL,
	`hora` TIME NULL,
	`fecha` DATE NULL,
	`total` FLOAT(10,2) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'contiene la información de la venta'

;

CREATE TABLE `productos`
(
	`Id` BIGINT NOT NULL AUTO_INCREMENT,
	`codigo_producto` VARCHAR(50) NULL,
	`descripcion` TINYTEXT NULL,
	`unidades_disponibles` VARCHAR(50) NULL,
	`precio_unidad` FLOAT(10,2) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`Id` ASC)
)
COMMENT = 'contiene la información de los productos para la reventa'

;

CREATE TABLE `proveedores`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`nombre` TINYTEXT NULL,
	`telefono` TINYTEXT NULL,
	`direccion` TINYTEXT NULL,
	`dia_reparto` ENUM ('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Todos los dias') NULL,
	`categoria_productos` ENUM ('Estufas','Refrigeradores','Televisiones','Sonido','Lavadoras','Sillones','Mesas','Luces','Otros') NULL,
	CONSTRAINT `PK_proveedores` PRIMARY KEY (`id` ASC)
)
COMMENT = 'aqui ira la informacion de los proveedores'

;

CREATE TABLE `registro_ventas`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`id_vendedor` BIGINT NOT NULL,
	`id_factura` BIGINT NOT NULL,
	`id_cliente` BIGINT NOT NULL,
	`numero_venta` BIGINT NULL,
	`fecha_registro` DATE NULL,
	`hora_reistro` TIME NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `vendedores`
(
	`id` BIGINT NOT NULL AUTO_INCREMENT,
	`nombre` TINYTEXT NULL,
	`no_dpi` TINYTEXT NULL,
	`nit` BIGINT NULL,
	`direccion` TINYTEXT NULL,
	`ciudad` TINYTEXT NULL,
	`telefono` TINYTEXT NULL,
	CONSTRAINT `PK_vendedores` PRIMARY KEY (`id` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `almacen` 
 ADD INDEX `IXFK_almacen_productos` (`id_producto` ASC)
;

ALTER TABLE `almacen` 
 ADD INDEX `IXFK_almacen_productos_02` (`id_producto` ASC)
;

ALTER TABLE `compras` 
 ADD INDEX `IXFK_compras _productos` (`id_producto` ASC)
;

ALTER TABLE `compras` 
 ADD INDEX `IXFK_compras _proveedores` (`id_proveedor` ASC)
;

ALTER TABLE `facturas` 
 ADD INDEX `IXFK_facturas_clientes` (`id_cliente` ASC)
;

ALTER TABLE `facturas` 
 ADD INDEX `IXFK_facturas_productos` (`id_producto` ASC)
;

ALTER TABLE `registro_ventas` 
 ADD INDEX `IXFK_registro_ventas_clientes` (`id_cliente` ASC)
;

ALTER TABLE `registro_ventas` 
 ADD INDEX `IXFK_registro_ventas_facturas` (`id_factura` ASC)
;

ALTER TABLE `registro_ventas` 
 ADD INDEX `IXFK_registro_ventas_vendedores` (`id_vendedor` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `almacen` 
 ADD CONSTRAINT `FK_almacen_productos`
	FOREIGN KEY (`id_producto`) REFERENCES `productos` (`Id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `compras` 
 ADD CONSTRAINT `FK_compras _productos`
	FOREIGN KEY (`id_producto`) REFERENCES `productos` (`Id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `compras` 
 ADD CONSTRAINT `FK_compras _proveedores`
	FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `facturas` 
 ADD CONSTRAINT `FK_facturas_clientes`
	FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `facturas` 
 ADD CONSTRAINT `FK_facturas_productos`
	FOREIGN KEY (`id_producto`) REFERENCES `productos` (`Id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `registro_ventas` 
 ADD CONSTRAINT `FK_registro_ventas_clientes`
	FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `registro_ventas` 
 ADD CONSTRAINT `FK_registro_ventas_facturas`
	FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `registro_ventas` 
 ADD CONSTRAINT `FK_registro_ventas_vendedores`
	FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;
