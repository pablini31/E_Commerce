using System;
using System.Collections.Generic;
using System.Linq;
using ECommerce.Domain.Enums;

namespace ECommerce.Domain.Entities
{
    public class Order
    {
        public Guid Id { get; private set; } = Guid.NewGuid();
        public OrderStatus Status { get; private set; } = OrderStatus.Pendiente;
        private readonly List<OrderItem> _orderItems = new();
        public IReadOnlyCollection<OrderItem> OrderItems => _orderItems.AsReadOnly();

        public Order() { }

        public void AddItem(OrderItem item)
        {
            EnsureNotShipped();
            if (item == null) throw new ArgumentNullException(nameof(item));
            _orderItems.Add(item);
        }

        public void RemoveItem(Guid orderItemId)
        {
            EnsureNotShipped();
            var item = _orderItems.FirstOrDefault(x => x.Id == orderItemId);
            if (item != null) _orderItems.Remove(item);
        }

        public void ChangeStatus(OrderStatus newStatus)
        {
            // Business rule: cannot go backwards from Enviado
            if (Status == OrderStatus.Enviado)
                throw new InvalidOperationException("Order already shipped and cannot change status.");
            Status = newStatus;
        }

        private void EnsureNotShipped()
        {
            if (Status == OrderStatus.Enviado)
                throw new InvalidOperationException("Cannot modify items when order has been shipped (Enviado).");
        }
    }
} 