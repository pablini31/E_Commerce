using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ECommerce.Domain.Entities;

namespace ECommerce.Application.Interfaces
{
    public interface IProductRepository
    {
        Task<Product?> GetByIdAsync(Guid id);
        Task<Product?> GetByNameAsync(string name);
        Task<IEnumerable<Product>> GetAllAsync();
        Task AddAsync(Product product);
        Task UpdateAsync(Product product);
        Task DeleteAsync(Product product);
        Task<bool> IsProductUsedAsync(Guid productId);
    }

    public interface IOrderRepository
    {
        Task<Order?> GetByIdAsync(Guid id);
        Task AddAsync(Order order);
        Task UpdateAsync(Order order);
        void AddOrderItem(OrderItem item);
    }

    public interface IUnitOfWork
    {
        Task<int> SaveChangesAsync();
    }
} 