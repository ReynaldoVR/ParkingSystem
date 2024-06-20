namespace ParkingSystem.Server.Models
{
    public class Estacionamiento
    {
        public int Id_est { get; set; }
        public int? Id_cli_est { get; set; }
        public int? Id_aut_est { get; set; }
        public int Numero_plaza_est { get; set; }
        public DateTime Fecha_entrada_est { get; set; }
        public DateTime? Fecha_salida_est { get; set; }
        public bool Estado_est { get; set; }
    }
}