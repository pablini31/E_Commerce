using System;
using System.Collections.Generic;
using ECommerce.Domain.Enums;

namespace ECommerce.Application.DTOs
{
    public class CreateOrderDto
    {
        // Could start empty order, later add items
    }

    public class AddOrderItemDto
    {
        public Guid ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }

    public class UpdateOrderStatusDto
    {
        public OrderStatus Status { get; set; }
    }

    public class OrderResponseDto
    {
        public Guid Id { get; set; }
        public OrderStatus Status { get; set; }
        public IEnumerable<OrderItemResponseDto> Items { get; set; } = new List<OrderItemResponseDto>();
    }

    public class OrderItemResponseDto
    {
        public Guid Id { get; set; }
        public Guid ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }
} 