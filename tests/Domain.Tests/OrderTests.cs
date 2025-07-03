using System;
using ECommerce.Domain.Entities;
using ECommerce.Domain.Enums;
using Xunit;

namespace ECommerce.Tests.Domain
{
    public class OrderTests
    {
        [Fact]
        public void Cannot_Add_Item_When_Shipped()
        {
            // Arrange
            var order = new Order();
            order.ChangeStatus(OrderStatus.Enviado);
            var item = new OrderItem(Guid.NewGuid(), 1, 10);

            // Act & Assert
            Assert.Throws<InvalidOperationException>(() => order.AddItem(item));
        }
    }
} 