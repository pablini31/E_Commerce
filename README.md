# ECommerce API – Clean Architecture (.NET 8)

REST API de ejemplo para una tienda en línea que gestiona **productos** y **pedidos** siguiendo principios de
POO, DDD y Clean Architecture. Incluye autenticación **JWT**, CORS y documentación **Swagger**.

---

## 🏗️ Tecnologías

* .NET 8
* ASP.NET Core Web API
* Entity Framework Core 8 (SQL Server)
* Swagger / Swashbuckle
* JWT Bearer Authentication
* xUnit

## 📁 Estructura de carpetas

```
src/
 ├─ Domain/           # Entidades, enums, lógica de dominio pura
 ├─ Application/      # DTOs, interfaces, servicios de caso de uso
 ├─ Infrastructure/   # EF Core, Repositorios, Unit of Work
 └─ API/              # Controllers, Program.cs, configuración

tests/
 └─ Domain.Tests/     # Pruebas unitarias
```

## 🚀 Ejecutar localmente

1. **Requisitos**
   * .NET SDK 8.0+
   * SQL Server (o LocalDB)

2. **Clonar y restaurar dependencias**

   ```bash
   git clone https://github.com/tu-usuario/ecommerce-api.git
   cd ecommerce-api
   dotnet restore
   ```

3. **Configurar string de conexión** (opcional)

   Edita `src/API/appsettings.json`→`ConnectionStrings:DefaultConnection`.

4. **Crear base de datos y aplicar migraciones**

   ```bash
   dotnet tool install --global dotnet-ef   # una sola vez

   dotnet ef migrations add Initial \
       --project src/Infrastructure \
       --startup-project src/API

   dotnet ef database update \
       --project src/Infrastructure \
       --startup-project src/API
   ```

5. **Ejecutar la API**

   ```bash
   dotnet run --project src/API
   ```

   La consola mostrará los puertos (p.e. https://localhost:5001).

6. **Swagger**

   Navega a `/swagger` y prueba los endpoints.

   * Genera un token:
     ```json
     POST /api/Auth/login
     {
       "username": "demo",
       "password": "cualquier"
     }
     ```
   * Pulsa **Authorize** y pega `Bearer <TOKEN>` para llamar a rutas protegidas.

## 🩺 Pruebas

```bash
 dotnet test
```

## ✨ Reglas de negocio implementadas

* No se puede **agregar/quitar/modificar** `OrderItem` si el **estado** del pedido es `Enviado`.
* No se puede crear un **producto** con nombre duplicado.
* No se puede **eliminar** un producto que esté referenciado en un pedido.

## 🔒 Seguridad

* Autenticación JWT con algoritmo **HS256** y clave de 32 bytes.
* Política de **CORS** abierta por defecto (`AllowAnyOrigin`). Modifícala en `Program.cs` según tus necesidades.

## 📝 Licencia

MIT License – libre para usar y modificar con fines educativos. 