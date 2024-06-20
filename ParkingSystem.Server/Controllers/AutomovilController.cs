using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ParkingSystem.Server.Models;
namespace ParkingSystem.Server.Controllers
{
    [ApiController]
    [Route("api/Automovil")]
    public class AutomovilController : ControllerBase
    {
        private readonly ParkingSystemContext _context;
        public AutomovilController(ParkingSystemContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Automovil>>> GetAutomoviles()
        {
            return await _context.Automoviles.ToListAsync();
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<Automovil>> GetAutomovil(int id)
        {
            var automovil = await _context.Automoviles.FindAsync(id);
            if (automovil == null)
            {
                return NotFound();
            }
            return automovil;
        }
        [HttpPost]
        public async Task<ActionResult<Automovil>> PostAutomovil(Automovil automovil)
        {
            _context.Automoviles.Add(automovil);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetAutomovil), new { id = automovil.Id_aut }, automovil);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAutomovil(int id, Automovil automovil)
        {
            if (id != automovil.Id_aut)
            {
                return BadRequest();
            }
            _context.Entry(automovil).State = EntityState.Modified;
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AutomovilExists(id))
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
        public async Task<IActionResult> DeleteAutomovil(int id)
        {
            var automovil = await _context.Automoviles.FindAsync(id);
            if (automovil == null)
            {
                return NotFound();
            }
            _context.Automoviles.Remove(automovil);
            await _context.SaveChangesAsync();
            return NoContent();
        }
        private bool AutomovilExists(int id)
        {
            return _context.Automoviles.Any(e => e.Id_aut == id);
        }
    }
}