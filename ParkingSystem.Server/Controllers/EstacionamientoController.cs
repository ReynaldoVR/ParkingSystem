using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ParkingSystem.Server.Models;
namespace ParkingSystem.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EstacionamientoController : ControllerBase
    {
        private readonly ParkingSystemContext _context;
        public EstacionamientoController(ParkingSystemContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Estacionamiento>>> GetEstacionamientos()
        {
            return await _context.Estacionamientos.ToListAsync();
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<Estacionamiento>> GetEstacionamiento(int id)
        {
            var estacionamiento = await _context.Estacionamientos.FindAsync(id);
            if (estacionamiento == null)
            {
                return NotFound();
            }
            return estacionamiento;
        }
        [HttpPost]
        public async Task<ActionResult<Estacionamiento>> PostEstacionamiento(Estacionamiento estacionamiento)
        {
            _context.Estacionamientos.Add(estacionamiento);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetEstacionamiento), new { id = estacionamiento.Id_est }, estacionamiento);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEstacionamiento(int id, Estacionamiento estacionamiento)
        {
            if (id != estacionamiento.Id_est)
            {
                return BadRequest();
            }
            _context.Entry(estacionamiento).State = EntityState.Modified;
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EstacionamientoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return NoContent();
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEstacionamiento(int id)
        {
            var estacionamiento = await _context.Estacionamientos.FindAsync(id);
            if (estacionamiento == null)
            {
                return NotFound();
            }
            _context.Estacionamientos.Remove(estacionamiento);
            await _context.SaveChangesAsync();
            return NoContent();
        }
        private bool EstacionamientoExists(int id)
        {
            return _context.Estacionamientos.Any(e => e.Id_est == id);
        }
    }
}