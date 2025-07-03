-- CREACIÓN DE TABLAS (si no existen)
IF OBJECT_ID('OrderItem', 'U') IS NOT NULL DROP TABLE OrderItem;
IF OBJECT_ID('[Order]', 'U') IS NOT NULL DROP TABLE [Order];
IF OBJECT_ID('Product', 'U') IS NOT NULL DROP TABLE Product;

CREATE TABLE Product (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(18,2) NOT NULL
);

CREATE TABLE [Order] (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    Status NVARCHAR(20) NOT NULL
);

CREATE TABLE OrderItem (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    OrderId UNIQUEIDENTIFIER NOT NULL,
    ProductId UNIQUEIDENTIFIER NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES [Order](Id),
    FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

-- INSERCIÓN DE 100 PRODUCTOS (mezcla de tecnología, hogar y moda)
INSERT INTO Product (Id, Name, Description, Price) VALUES
(NEWID(), 'Smartphone Samsung Galaxy S23', 'Smartphone de alta gama con pantalla AMOLED', 899.99),
(NEWID(), 'Laptop Dell Inspiron 15', 'Laptop con procesador Intel i7 y 16GB RAM', 1199.00),
(NEWID(), 'Auriculares Sony WH-1000XM4', 'Auriculares inalámbricos con cancelación de ruido', 349.99),
(NEWID(), 'Smartwatch Apple Watch Series 8', 'Reloj inteligente con GPS y monitor de salud', 429.00),
(NEWID(), 'Cámara Canon EOS Rebel T7', 'Cámara réflex digital para fotografía profesional', 549.00),
(NEWID(), 'Tablet Lenovo Tab P11', 'Tablet Android con pantalla 2K', 299.99),
(NEWID(), 'Monitor LG UltraWide 29"', 'Monitor panorámico para productividad', 259.99),
(NEWID(), 'Teclado mecánico Logitech G Pro', 'Teclado gamer con switches mecánicos', 129.99),
(NEWID(), 'Mouse inalámbrico Logitech MX Master 3', 'Mouse ergonómico para oficina', 99.99),
(NEWID(), 'Impresora HP DeskJet 2720', 'Impresora multifunción WiFi', 79.99),
(NEWID(), 'Sofá seccional de lino', 'Sofá moderno de 3 piezas para sala', 799.00),
(NEWID(), 'Mesa de comedor extensible', 'Mesa de madera para 6 personas', 499.00),
(NEWID(), 'Lámpara de pie LED', 'Lámpara regulable para sala o estudio', 89.99),
(NEWID(), 'Aspiradora robot Xiaomi', 'Aspiradora inteligente con mapeo láser', 299.00),
(NEWID(), 'Cafetera Nespresso Vertuo', 'Cafetera automática para cápsulas', 149.99),
(NEWID(), 'Juego de sábanas algodón', 'Sábanas suaves tamaño queen', 59.99),
(NEWID(), 'Cortinas blackout', 'Cortinas opacas para dormitorio', 39.99),
(NEWID(), 'Silla ergonómica de oficina', 'Silla con soporte lumbar y ajuste de altura', 189.99),
(NEWID(), 'Reloj de pared vintage', 'Reloj decorativo para sala', 29.99),
(NEWID(), 'Set de cuchillos de cocina', 'Cuchillos de acero inoxidable', 49.99),
(NEWID(), 'Vestido largo floral', 'Vestido de verano para mujer', 69.99),
(NEWID(), 'Camisa casual de lino', 'Camisa fresca para hombre', 39.99),
(NEWID(), 'Pantalón chino slim fit', 'Pantalón elegante para oficina', 59.99),
(NEWID(), 'Zapatillas deportivas Nike Air', 'Zapatillas para correr', 119.99),
(NEWID(), 'Bolso tote de cuero', 'Bolso grande para mujer', 89.99),
(NEWID(), 'Chaqueta impermeable Columbia', 'Chaqueta para lluvia y viento', 129.99),
(NEWID(), 'Gorra New Era', 'Gorra ajustable con logo bordado', 24.99),
(NEWID(), 'Bufanda de lana', 'Bufanda tejida para invierno', 19.99),
(NEWID(), 'Zapatos Oxford de piel', 'Zapatos formales para hombre', 99.99),
(NEWID(), 'Cinturón de cuero clásico', 'Cinturón negro para traje', 34.99),
(NEWID(), 'Blusa manga larga', 'Blusa elegante para oficina', 44.99),
(NEWID(), 'Falda plisada midi', 'Falda de moda para mujer', 54.99),
(NEWID(), 'Sandalias planas', 'Sandalias cómodas para verano', 29.99),
(NEWID(), 'Pijama de algodón', 'Pijama suave de dos piezas', 24.99),
(NEWID(), 'Calcetines deportivos pack x6', 'Calcetines transpirables', 14.99),
(NEWID(), 'Mochila escolar resistente', 'Mochila con compartimento para laptop', 49.99),
(NEWID(), 'Maleta de viaje rígida', 'Maleta con ruedas 360°', 89.99),
(NEWID(), 'Paraguas automático compacto', 'Paraguas resistente al viento', 19.99),
(NEWID(), 'Gafas de sol Ray-Ban', 'Gafas polarizadas unisex', 129.99),
(NEWID(), 'Reloj Casio clásico', 'Reloj digital resistente al agua', 39.99),
(NEWID(), 'Pulsera de plata', 'Pulsera fina para mujer', 24.99),
(NEWID(), 'Collar minimalista', 'Collar dorado con dije pequeño', 29.99),
(NEWID(), 'Anillo ajustable', 'Anillo de acero inoxidable', 19.99),
(NEWID(), 'Pendientes de perla', 'Pendientes elegantes para fiesta', 34.99),
(NEWID(), 'Set de maquillaje Maybelline', 'Kit de maquillaje básico', 44.99),
(NEWID(), 'Perfume Calvin Klein', 'Fragancia unisex 100ml', 59.99),
(NEWID(), 'Crema hidratante Neutrogena', 'Crema facial para piel seca', 14.99),
(NEWID(), 'Cepillo alisador Remington', 'Cepillo eléctrico para cabello', 39.99),
(NEWID(), 'Secador de pelo Philips', 'Secador con tecnología iónica', 49.99),
(NEWID(), 'Plancha de vapor Rowenta', 'Plancha para ropa con suela antiadherente', 59.99),
(NEWID(), 'Termo Stanley 1L', 'Termo de acero inoxidable', 34.99),
(NEWID(), 'Botella deportiva Nike', 'Botella plástica 750ml', 14.99),
(NEWID(), 'Bicicleta urbana rodada 26', 'Bicicleta ligera para ciudad', 299.99),
(NEWID(), 'Patineta clásica', 'Patineta de madera con lija', 49.99),
(NEWID(), 'Balón de fútbol Adidas', 'Balón oficial tamaño 5', 29.99),
(NEWID(), 'Raqueta de tenis Wilson', 'Raqueta ligera para principiantes', 69.99),
(NEWID(), 'Guantes de gimnasio', 'Guantes antideslizantes', 19.99),
(NEWID(), 'Mancuernas ajustables', 'Set de mancuernas 2x5kg', 59.99),
(NEWID(), 'Colchoneta de yoga', 'Colchoneta antideslizante', 24.99),
(NEWID(), 'Silla plegable para camping', 'Silla ligera y resistente', 34.99),
(NEWID(), 'Tienda de campaña 2 personas', 'Tienda impermeable fácil de armar', 89.99),
(NEWID(), 'Linterna LED recargable', 'Linterna de mano potente', 19.99),
(NEWID(), 'Cargador portátil Anker PowerCore', 'Batería externa de 20000mAh', 49.99),
(NEWID(), 'Cable USB-C trenzado', 'Cable resistente de 1.5m', 9.99),
(NEWID(), 'Adaptador HDMI a VGA', 'Adaptador para monitores antiguos', 12.99),
(NEWID(), 'Hub USB 4 puertos', 'Expansor USB para laptop', 19.99),
(NEWID(), 'Memoria USB 64GB', 'Memoria flash de alta velocidad', 14.99),
(NEWID(), 'Disco duro externo 1TB', 'Almacenamiento portátil', 59.99),
(NEWID(), 'Router WiFi TP-Link', 'Router inalámbrico de alta velocidad', 39.99),
(NEWID(), 'Extensor de red WiFi', 'Amplificador de señal WiFi', 24.99),
(NEWID(), 'Cámara de seguridad WiFi', 'Cámara IP para interiores', 44.99),
(NEWID(), 'Enchufe inteligente', 'Controla tus dispositivos desde el móvil', 19.99),
(NEWID(), 'Bombilla LED inteligente', 'Bombilla regulable con WiFi', 14.99),
(NEWID(), 'Kit de herramientas 40 piezas', 'Herramientas básicas para el hogar', 29.99),
(NEWID(), 'Taladro inalámbrico Bosch', 'Taladro recargable con maletín', 89.99),
(NEWID(), 'Escalera de aluminio 3m', 'Escalera plegable multiusos', 59.99),
(NEWID(), 'Caja organizadora grande', 'Caja plástica con tapa', 19.99),
(NEWID(), 'Set de recipientes herméticos', 'Recipientes para cocina', 24.99),
(NEWID(), 'Freidora de aire Philips', 'Freidora sin aceite 4L', 129.99),
(NEWID(), 'Microondas Samsung 23L', 'Microondas digital con grill', 99.99),
(NEWID(), 'Refrigerador Mabe 11 pies', 'Refrigerador con congelador superior', 399.99),
(NEWID(), 'Licuadora Oster 10 velocidades', 'Licuadora de vidrio resistente', 49.99),
(NEWID(), 'Tostadora Black+Decker', 'Tostadora para 2 rebanadas', 24.99),
(NEWID(), 'Batidora de mano Braun', 'Batidora eléctrica multifunción', 39.99),
(NEWID(), 'Juego de ollas acero', 'Set de 5 ollas con tapas', 79.99),
(NEWID(), 'Sartén antiadherente Tefal', 'Sartén de 28cm', 29.99),
(NEWID(), 'Cafetera italiana Bialetti', 'Cafetera de aluminio 6 tazas', 34.99),
(NEWID(), 'Rallador multifunción', 'Rallador de acero inoxidable', 9.99),
(NEWID(), 'Báscula digital cocina', 'Báscula precisa hasta 5kg', 14.99),
(NEWID(), 'Termómetro infrarrojo', 'Termómetro sin contacto', 19.99),
(NEWID(), 'Oxímetro de pulso', 'Medidor de saturación de oxígeno', 24.99),
(NEWID(), 'Tensiómetro digital', 'Medidor de presión arterial', 34.99),
(NEWID(), 'Nebulizador portátil', 'Nebulizador para uso doméstico', 39.99),
(NEWID(), 'Silla de ruedas plegable', 'Silla ligera y resistente', 129.99),
(NEWID(), 'Andadera ajustable', 'Andadera para adultos mayores', 49.99),
(NEWID(), 'Bastón ergonómico', 'Bastón con mango antideslizante', 19.99),
(NEWID(), 'Cama hospitalaria manual', 'Cama ajustable para pacientes', 299.99),
(NEWID(), 'Colchón ortopédico individual', 'Colchón firme para descanso', 99.99),
(NEWID(), 'Almohada viscoelástica', 'Almohada ergonómica para dormir', 29.99),
(NEWID(), 'Sábanas térmicas', 'Sábanas para invierno', 34.99),
(NEWID(), 'Cobertor polar', 'Cobertor suave y cálido', 24.99),
(NEWID(), 'Cortina de baño impermeable', 'Cortina decorativa para baño', 14.99),
(NEWID(), 'Set de toallas algodón', 'Toallas suaves para baño', 19.99),
(NEWID(), 'Alfombra antideslizante', 'Alfombra para baño o cocina', 9.99),
(NEWID(), 'Espejo de pared grande', 'Espejo decorativo rectangular', 39.99),
(NEWID(), 'Perchero de pie', 'Perchero metálico para ropa', 24.99),
(NEWID(), 'Zapatero de madera', 'Zapatero para 12 pares', 34.99),
(NEWID(), 'Caja fuerte digital', 'Caja de seguridad para documentos', 59.99);

-- INSERCIÓN DE 100 ÓRDENES
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO [Order] (Id, Status)
    VALUES (NEWID(), CASE WHEN @i % 2 = 0 THEN 'Enviado' ELSE 'Pendiente' END);
    SET @i = @i + 1;
END

-- INSERCIÓN DE 1000 ORDER ITEMS
-- Relaciona aleatoriamente productos y órdenes
DECLARE @orderCount INT = (SELECT COUNT(*) FROM [Order]);
DECLARE @productCount INT = (SELECT COUNT(*) FROM Product);

DECLARE @orderIndex INT = 0;
DECLARE @productIndex INT = 0;

WHILE @orderIndex < @orderCount
BEGIN
    DECLARE @currentOrderId UNIQUEIDENTIFIER = (SELECT Id FROM (SELECT ROW_NUMBER() OVER (ORDER BY Id) AS rn, Id FROM [Order]) t WHERE rn = @orderIndex + 1);
    DECLARE @itemsPerOrder INT = 5 + (ABS(CHECKSUM(NEWID())) % 11); -- entre 5 y 15 items por orden
    SET @productIndex = 0;
    WHILE @productIndex < @itemsPerOrder
    BEGIN
        DECLARE @currentProductId UNIQUEIDENTIFIER = (SELECT Id FROM (SELECT ROW_NUMBER() OVER (ORDER BY Id) AS rn, Id FROM Product) t WHERE rn = ((@productIndex + @orderIndex) % @productCount) + 1);
        DECLARE @quantity INT = 1 + (ABS(CHECKSUM(NEWID())) % 5);
        DECLARE @price DECIMAL(18,2) = (SELECT Price FROM Product WHERE Id = @currentProductId);
        INSERT INTO OrderItem (Id, OrderId, ProductId, Quantity, Price)
        VALUES (NEWID(), @currentOrderId, @currentProductId, @quantity, @price);
        SET @productIndex = @productIndex + 1;
    END
    SET @orderIndex = @orderIndex + 1;
END 