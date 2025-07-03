using System;
using System.Threading.Tasks;
using ECommerce.Application.DTOs;
using ECommerce.Application.Interfaces;
using ECommerce.Domain.Entities;
using ECommerce.Domain.Enums;

namespace ECommerce.Application.Services
{
    public interface IOrderService
    {
        Task<Guid> CreateAsync();
        Task AddItemAsync(Guid orderId, AddOrderItemDto dto);
        Task ChangeStatusAsync(Guid orderId, OrderStatus status);
    }

    public class OrderService : IOrderService
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IProductRepository _productRepository;
        private readonly IUnitOfWork _unitOfWork;

        public OrderService(IOrderRepository orderRepository, IProductRepository productRepository, IUnitOfWork unitOfWork)
        {
            _orderRepository = orderRepository;
            _productRepository = productRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Guid> CreateAsync()
        {
            var order = new Order();
            await _orderRepository.AddAsync(order);
            await _unitOfWork.SaveChangesAsync();
            return order.Id;
        }

        public async Task AddItemAsync(Guid orderId, AddOrderItemDto dto)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order == null) throw new InvalidOperationException("Order not found");

            var product = await _productRepository.GetByIdAsync(dto.ProductId);
            if (product == null) throw new InvalidOperationException("Product not found");

            var item = new OrderItem(dto.ProductId, dto.Quantity, dto.Price);
            order.AddItem(item);
            _orderRepository.AddOrderItem(item);
            await _unitOfWork.SaveChangesAsync();
        }

        public async Task ChangeStatusAsync(Guid orderId, OrderStatus status)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order == null) throw new InvalidOperationException("Order not found");

            order.ChangeStatus(status);
            await _orderRepository.UpdateAsync(order);
            await _unitOfWork.SaveChangesAsync();
        }
    }
} 