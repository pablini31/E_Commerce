using System;

namespace ECommerce.Domain.Entities
{
    public class OrderItem
    {
        public Guid Id { get; private set; } = Guid.NewGuid();
        public Guid ProductId { get; private set; }
        public int Quantity { get; private set; }
        public decimal Price { get; private set; }

        private OrderItem() { }

        public OrderItem(Guid productId, int quantity, decimal price)
        {
            if (quantity <= 0)
                throw new ArgumentException("Quantity must be positive");
            if (price <= 0)
                throw new ArgumentException("Price must be positive");
            ProductId = productId;
            Quantity = quantity;
            Price = price;
        }

        public void UpdateQuantity(int quantity)
        {
            if (quantity <= 0)
                throw new ArgumentException("Quantity must be positive");
            Quantity = quantity;
        }
    }
} 