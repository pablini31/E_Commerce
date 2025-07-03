using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ECommerce.Application.DTOs;
using ECommerce.Application.Interfaces;
using ECommerce.Domain.Entities;

namespace ECommerce.Application.Services
{
    public interface IProductService
    {
        Task<ProductResponseDto> CreateAsync(CreateProductDto dto);
        Task<IEnumerable<ProductResponseDto>> GetAllAsync();
        Task<ProductResponseDto?> UpdateAsync(UpdateProductDto dto);
        Task<bool> DeleteAsync(Guid productId);
    }

    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ProductService(IProductRepository productRepository, IUnitOfWork unitOfWork)
        {
            _productRepository = productRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<ProductResponseDto> CreateAsync(CreateProductDto dto)
        {
            if (await _productRepository.GetByNameAsync(dto.Name) != null)
                throw new InvalidOperationException("Product name must be unique");

            var product = new Product(dto.Name, dto.Description, dto.Price);
            await _productRepository.AddAsync(product);
            await _unitOfWork.SaveChangesAsync();

            return Map(product);
        }

        public async Task<IEnumerable<ProductResponseDto>> GetAllAsync()
        {
            var products = await _productRepository.GetAllAsync();
            return products.Select(Map);
        }

        public async Task<ProductResponseDto?> UpdateAsync(UpdateProductDto dto)
        {
            var product = await _productRepository.GetByIdAsync(dto.Id);
            if (product == null) return null;

            if (!string.Equals(product.Name, dto.Name, StringComparison.OrdinalIgnoreCase))
            {
                if (await _productRepository.GetByNameAsync(dto.Name) != null)
                    throw new InvalidOperationException("Product name must be unique");
            }

            product.Update(dto.Name, dto.Description, dto.Price);
            await _productRepository.UpdateAsync(product);
            await _unitOfWork.SaveChangesAsync();

            return Map(product);
        }

        public async Task<bool> DeleteAsync(Guid productId)
        {
            var product = await _productRepository.GetByIdAsync(productId);
            if (product == null) return false;

            if (await _productRepository.IsProductUsedAsync(productId))
                throw new InvalidOperationException("Cannot delete product that is referenced in orders");

            await _productRepository.DeleteAsync(product);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        private static ProductResponseDto Map(Product product) => new()
        {
            Id = product.Id,
            Name = product.Name,
            Description = product.Description,
            Price = product.Price
        };
    }
} 