// Lista de productos predefinidos (ítems del videojuego)
const productosFijos = [
    { nombre: "Espada Legendaria", precio: 100 },
    { nombre: "Escudo Mágico", precio: 75 },
    { nombre: "Poción de Vida", precio: 25 },
    { nombre: "Armadura de Dragón", precio: 150 }
];

// Lista para almacenar los productos comprados
let carrito = [];

// Mostrar productos predefinidos en la página
function mostrarProductosPredefinidos() {
    let productosDiv = document.getElementById("productos");
    productosDiv.innerHTML = ""; // Limpiar la lista de productos

    productosFijos.forEach((producto, index) => {
        let productoHTML = `
            <div class="producto">
                <p><strong>Nombre:</strong> ${producto.nombre}</p>
                <p><strong>Precio:</strong> ${producto.precio} monedas</p>
                <button onclick="comprarProducto(${index})">Comprar</button>
            </div>`;
        productosDiv.innerHTML += productoHTML;
    });
}

// Comprar un producto
function comprarProducto(index) {
    const productoComprado = productosFijos[index];

    // Verificar si el producto ya está en el carrito
    const productoEnCarrito = carrito.find(p => p.nombre === productoComprado.nombre);

    if (productoEnCarrito) {
        // Si el producto ya está en el carrito, aumentar la cantidad
        productoEnCarrito.cantidad += 1;
    } else {
        // Si el producto no está en el carrito, añadirlo con cantidad 1
        carrito.push({ ...productoComprado, cantidad: 1 });
    }

    // Actualizar la vista del carrito
    actualizarCarrito();
}

// Actualizar la vista del carrito
function actualizarCarrito() {
    let carritoDiv = document.getElementById("carrito");
    carritoDiv.innerHTML = ""; // Limpiar el carrito

    carrito.forEach(producto => {
        let productoHTML = `
            <div class="carrito-producto">
                <p><strong>Nombre:</strong> ${producto.nombre}</p>
                <p><strong>Cantidad:</strong> ${producto.cantidad}</p>
            </div>`;
        carritoDiv.innerHTML += productoHTML;
    });
}

// Mostrar los productos al cargar la página
window.onload = mostrarProductosPredefinidos;
