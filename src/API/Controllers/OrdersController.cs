using System;
using System.Threading.Tasks;
using ECommerce.Application.DTOs;
using ECommerce.Application.Services;
using ECommerce.Domain.Enums;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ECommerce.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderService _orderService;

        public OrdersController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        /// <summary>
        /// Create a new order.
        /// </summary>
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> Create()
        {
            var orderId = await _orderService.CreateAsync();
            return CreatedAtAction(nameof(Create), new { id = orderId }, new { orderId });
        }

        /// <summary>
        /// Add an item to an existing order.
        /// </summary>
        [HttpPost("{orderId}/items")]
        [Authorize]
        public async Task<IActionResult> AddItem(Guid orderId, AddOrderItemDto dto)
        {
            await _orderService.AddItemAsync(orderId, dto);
            return NoContent();
        }

        /// <summary>
        /// Change order status.
        /// </summary>
        [HttpPut("{orderId}/status")]
        [Authorize]
        public async Task<IActionResult> ChangeStatus(Guid orderId, UpdateOrderStatusDto dto)
        {
            await _orderService.ChangeStatusAsync(orderId, dto.Status);
            return NoContent();
        }
    }
} 