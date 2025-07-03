using System.Threading.Tasks;
using ECommerce.Application.Interfaces;
using ECommerce.Infrastructure.Data;

namespace ECommerce.Infrastructure
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly CommerceDbContext _context;

        public UnitOfWork(CommerceDbContext context)
        {
            _context = context;
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }
    }
} 