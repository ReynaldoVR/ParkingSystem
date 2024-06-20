namespace ParkingSystem.Server.Models
{
    public class Automovil
    {
        public int Id_aut { get; set; }
        public int? Id_cli_aut { get; set; }
        public string Marca_aut { get; set; }
        public string Modelo_aut { get; set; }
        public string Placa_aut { get; set; }
    }
}