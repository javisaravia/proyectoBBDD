# proyectoBBDD
Esta base de datos pertenece a una tienda de ropa y sirve para gestionar distintos tipos de prendas y lo que los clientes añaden a su carrito de compra.

tablas principales:

- camisetas: guarda información de camisetas (precio, color, talla, cantidad).
- camisas: lo mismo, pero para camisas.
- bañadores,bermudas,pantalones, ropa_interior: otros tipos de ropa.
- categorias y categorias_nueva: agrupan los productos por tipo.
- productos: lista general de productos disponibles.
- cesta: representa el carrito de compra del cliente.


Cada tabla guarda los datos necesarios para cada prenda: el precio, el color, la talla y cuántas unidades hay. Algunas tablas usan un identificador único llamado `id`.

triggers:

Hay reglas automáticas que se ejecutan solas cuando se agrega un nuevo producto. Por ejemplo:

- Si se añade una nueva camiseta, camisa o bañador, se agrega automáticamente una unidad de ese producto a la cesta.

Esto ayuda a simular que el producto ya está listo para ser comprado.

tabla `cesta`:

Es como el carrito de la compra, guarda:

- que producto se ha añadido (`producto_id`)
- que tipo de prenda es (`categoria`)
- Talla, nombre y cantidad

relación entre tablas:

La tabla `productos` está conectada con `categorias`, para saber a qué grupo pertenece cada producto (por ejemplo, camisetas, pantalones, etc.).
Algunas tablas tienen el campo `id` configurado para que se incremente automáticamente, para no teer que esccribirlo.

