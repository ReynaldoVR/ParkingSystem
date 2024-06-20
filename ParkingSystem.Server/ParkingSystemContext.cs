using Microsoft.EntityFrameworkCore;
using ParkingSystem.Server.Models;

namespace ParkingSystem.Server
{
    public class ParkingSystemContext : DbContext
    {
        public ParkingSystemContext(DbContextOptions<ParkingSystemContext> options) : base(options) { }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Automovil> Automoviles { get; set; }
        public DbSet<Estacionamiento> Estacionamientos { get; set; }
    }
}
