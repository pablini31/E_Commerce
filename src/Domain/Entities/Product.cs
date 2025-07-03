using System;

namespace ECommerce.Domain.Entities
{
    public class Product
    {
        public Guid Id { get; private set; } = Guid.NewGuid();
        public string Name { get; private set; }
        public string Description { get; private set; }
        public decimal Price { get; private set; }

        private Product() { }

        public Product(string name, string description, decimal price)
        {
            SetName(name);
            Description = description;
            SetPrice(price);
        }

        public void SetName(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
                throw new ArgumentException("Name cannot be empty");
            Name = name.Trim();
        }

        public void SetPrice(decimal price)
        {
            if (price <= 0)
                throw new ArgumentException("Price must be positive");
            Price = price;
        }

        public void Update(string name, string description, decimal price)
        {
            SetName(name);
            Description = description;
            SetPrice(price);
        }
    }
} 